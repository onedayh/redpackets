/* 
*   Controller 基类
*   所有Node编写的业务处理控制类都集成此基类，路由的配置直接配置在roterConfig.json中
*   功能：
*       基类主要实现了数据基础的增删改查的基本操作，如无特殊业务逻辑子类已无需再
*   重新实现，如有特殊的业务可以重写几个方法
*/
var express = require('express');
var parse = require('./utilities/transferUtility');
var utility = require('./utilities/utilities')
var rcp = require('./utilities/requestParser');
var apiResult = require('./result/actionResult');
var excelUtility = require('./utilities/excelUtility');
var daoBase = require('./database/daoBase');
class controllerBase {
    constructor(application, dao) {
        this.app = application;
        ///需要数据访问实体的实例
        if (dao!=null)
            this._daoModel = dao;
        else
            this._daoModel = new daoBase();
        this._router =express.Router();
        this.initializeRouter(this);
        
    }
    get router(){
        return this._router;
    }
    get baseUrl(){return null};
    /*
    返回数据结果
    */
    responseResult(req, res, result) {
        console.log(result);
        result = result || {};
        let export2Excel = utility.checkValue(req.query.exportexcel, "false").toLowerCase() === "true";
        if (result.successed && result.rows && export2Excel) {
            let excelHelper = new excelUtility();
            //excelUtility.recordset2ExcelFile(result.rows, req.query.excelkey)
            excelHelper.recordset2ExcelFile(result.rows, req.query.excelkey,this.beforeExportExcel)
                .then(result => res.json(result))
                .catch(result => res.json(result))
            return;
            //return res.json({successed:true});
        }
        if (result.successed && req.security) {
            result.disableControl = req.security.disableControl
            result.unvisibleControl = req.security.unvisibleControl;
        }
        res.json(result);
    }
    /*
    * 初始化路由处理器(空方法,待继承的子类去实现)
    * 除了在routerConfig中配置的路由以外，继承的子类可以重写实现此方法来
    * 继续配置你的路由
    */
    initializeRouter(instance) { }
    /*
    *  数据加载之前的动作
    *  子类可以重写该方法
    */
    beforeAccessDB(req, sql, sqlParams, type, instance) {
        return Promise.resolve({ sql: sql, sqlParams: sqlParams, canceled: false });
    }

    beforeExportExcel(dataOption){
        console.log(dataOption);
        return dataOption;
        //return Promise.resolve(dataOption);
    }
    /*
    *  数据发送到客户端之前的动作
    *  子类可以重写该方法
    */
    beforeResponseData(req, res, result, type) {
        return Promise.resolve({ render: true, result: result });
    }
    /*
    * 获取查询列表记录的方法
    */
    *getListData(req, dataKey, configFile = 0) {
        req.dataKey = dataKey;
        rcp.getListInfo(req, configFile);
        ////直接操作数据库之前，可由子类再次Handler
        let beforeData = yield this.beforeAccessDB(req, req.listSql, req.sqlParams, "list", this);
        ////如果返回Null,则表示不加载数据了
        if (beforeData.canceled != null && beforeData.canceled == true) return { successed: false, errorcode: 1, errormessage: "canceled" };
        ////操作数据库
        let result = yield this._daoModel.loadData(beforeData.sql, beforeData.sqlParams);
        if (result.rows != null) {
            ///将从数据库中获得的结果集根据dataconfig中的配置进行映射转换
            let resultItem = yield parse.transferName2Mapping(result.rows[0], req.fieldsMapping)
            ///输出的结果是否需要装饰带有successed,total等，便于
            //给grid进行绑定
            var decorated = (req.query.decorate == null || req.query.decorate.toLowerCase() != "false") ? true : false;
            if (decorated) {
                let outputData = { "successed": true, page: req.page, rows: resultItem.data };
                ///需要进行尾部统计
                if (req.countSql) {
                    let footerItem = yield parse.transferName2Mapping(result.rows[2], req.footerMapping)
                    outputData.footer = footerItem.data;
                }
                if (req.sqltype == "proc") {
                    req.sqlOutParams.forEach(function (item, index) {
                        outputData[item] = result.rows[1][0][item];
                    });
                } else {
                    outputData.total = result.rows[1][0].total;
                }
                return outputData;
            }
            else
                return resultItem.data;

        }
        return { "successed": false, errorcode: -1, total: 0, rows: [] };
    }
    /*
    * 获取详细记录的方法
    */
    *getDataById(req, dataKey, sqlCommand) {
        req.dataKey = dataKey;
        rcp.getDetailInfo(req);
        let beforeData = yield this.beforeAccessDB(req, sqlCommand || this._daoModel.getByIdSql, req.params.id, "detail", this);
        ////如果返回Null,则表示不加载数据了
        if (beforeData.canceled) return { successed: false, errorcode: 1, errormessage: "canceled" };

        let result = yield this._daoModel.getBykey(beforeData.sql, beforeData.sqlParams);
        if (result.rows != null && result.rows.length == 1) {
            ///将从数据库中获得的结果集根据dataconfig中的配置进行映射转换
            let resultMapping = yield parse.transferName2Mapping(result.rows, req.fieldsMapping);
            return { successed: true, rows: resultMapping.data[0], id: req.params.id };
        }
        return apiResult.DB_NO_RECORD_FOUND;
    }


    /*
    * 新增实体记录的方法
    */
    *create(req, dataKey, sqlCommand) {

        let mapping = utility.checkValue(req.query.Mapping, true);
        let resultItem = { successed: true, data: req.body };
        ///是否需要将data中的key-value值到配置文件中进行转换
        if (mapping == true) {
            req.dataKey = dataKey;
            rcp.getDetailInfo(req);
            resultItem = yield parse.transferMapping2Name(req, req.fieldsMapping, "create");
        }
        let beforeData = yield this.beforeAccessDB(req, sqlCommand || this._daoModel.insertSql, resultItem.data, "create", this);
        ////如果返回Null,则表示不加载数据了
        if (beforeData.canceled) return { successed: false, errorcode: 1, errormessage: "canceled" };
        let result = yield this._daoModel.create(beforeData.sql, beforeData.sqlParams,req)
        let primaryKey;
        if (mapping && req.primary) {
            ///自动增长的主键字段
            if (req.primaryIsAutoIncrease == true) primaryKey = result.rows.insertId;
            else{
            if (typeof (req.primary) === "string") primaryKey = beforeData.sqlParams[req.primary];
            if (typeof (req.primary) === "object")
                primaryKey = req.primary.map(element => { return beforeData.sqlParams[element]; });
            }
        }
        return { successed: true, data: resultItem.data, id: primaryKey };
    }
    /*
    * 修改实体记录的方法
    */
    *update(req, dataKey, sqlCommand, id) {
        if (id == null) id = req.params.id;
        let mapping = utility.checkValue(req.query.Mapping, true);
        var resultItem = { successed: true, data: req.body };
        ///是否需要将data中的key-value值到配置文件中进行转换
        if (mapping == true) {
            req.dataKey = dataKey;
            rcp.getDetailInfo(req);
            ///从Request中获取到用户提交的数据
            resultItem = yield parse.transferMapping2Name(req, req.fieldsMapping, "update");
        }
        ///如果不需要转换，则直接使用前端提交上来的值
        let beforeData = yield this.beforeAccessDB(req, sqlCommand || this._daoModel.updateSql, resultItem.data, "update", this);
        ////如果返回Null,则表示不加载数据了
        if (beforeData.canceled) return { successed: false, errorcode: 1, errormessage: "canceled" };
        let result = yield this._daoModel.update(beforeData.sql, beforeData.sqlParams, id);
        ///更新成功
        if (result.rows.affectedRows == 1) return { successed: true, data: resultItem.data, id: id };
        ///更新失败
        return apiResult.DB_NO_EFFECTIVE; //{successed:false,errorcode:errorcode.DATABASE_ERROR.NO_RECORD_EFFECTED,data:resultItem.data};
    }

    /*
    * 删除实体记录的方法
    */
    *delete(req, id, sqlCommand) {
        //return new Promise((success,failed)=>{
        ///从Request中获取到用户提交的数据
        let beforeData = yield this.beforeAccessDB(req, sqlCommand || this._daoModel.deleteSql, id, "delete", this);

        ////如果返回Null,则表示不加载数据了
        if (beforeData.canceled) return { successed: false, errorcode: 1, errormessage: "canceled" };
        let result = yield this._daoModel.delete(beforeData.sql, beforeData.sqlParams)
        return { successed: true, id: id };
        //if (result.rows.affectedRows >= 1) return { successed: true, id: id };
        ///删除失败
        //return apiResult.DB_NO_EFFECTIVE;

    }
}
exports = module.exports = controllerBase;