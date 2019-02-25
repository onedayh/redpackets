var dateFormat = require('dateformat');
var fileUtility = require('./fileUtility');
var aLiYunOSSUtility = require('./aLiYunOSSUtility');
var urlUtility  =  require('url');
var path        =require("path");
class Utilities {
    static getCurrentUserId(req) {
        return ((req && req.headers) ? req.headers.authorization : "");
    }
    static startWith(str, prefix) {
		return(str.substr(0, prefix.length) === prefix);
    }
    static endsWith(str, suffix) {
		return(str.substr(str.length - suffix.length) === suffix);
	}
    /*
    * 判断对象是否为空
    */
    static isNullOrEmpty(value) {
        if (typeof (value) == "undefined" || value == null || value == "" || value == "undefined") return true;
        return false;
    }
    /*
    随机生成字符串
    */
    static generateRandomSerial(length = 4, onlyNumber = true) {
        var serial = '';
        if (onlyNumber) {
            for (var i = 0; i < length; i++) serial += Math.floor(Math.random() * 10);
            return serial;
        }
        var $chars = 'ABCDEFGHJKMNPQRSTWXYZabcdefhijkmnprstwxyz2345678';    /****默认去掉了容易混淆的字符oOLl,9gq,Vv,Uu,I1****/
        var maxPos = $chars.length;
        for (i = 0; i < length; i++)
            serial += $chars.charAt(Math.floor(Math.random() * maxPos));
        return serial;
    }

    /*

    * 文字替换
    */
    static replace(originalStr, replFrom, replTo, ingoreCase = true) {
        // let regex = new RegExp(replFrom, "i", "g");
        // return originalStr.replace(regex, replTo);
        if (!RegExp.prototype.isPrototypeOf(replFrom)) {
            return originalStr.replace(new RegExp(replFrom, (ingoreCase ? "gi" : "g")), replTo);
        }
        return originalStr.replace(replFrom, replTo);
    }

    /*
    * 文字替换
    */
    static checkValue(value, nullValue) {
        if (value == null || value == "undefined" || value == "null" || (typeof value != "boolean" && value == "")) return nullValue;
        return value;
    }
    static now(fmt) {
        let date = new Date();
        return dateFormat(date, fmt);
    }
    static getParam(req, name, defaultvalue) {
        let result = req.params[name];
        if (result == undefined) result = req.body[name];
        if (result == undefined) result = req.query[name];
        if (result == undefined) result = defaultvalue;
        return result;
    }
    /*
        * 层级化一个原始对象
        * 从数据库中查询出来的都是一层的数组，需要将它变换为层级化的json结构
        * originObj : 原始数据 （一般指数据库返回的原始数据)
        * idField : （默认为id）
        * pIdField : 用于分层的依据字段 （默认为pid）
        * props : 要输出的属性，默认跟原始数据一致的属性
        * topNode ： 是否需要一个顶级的Node 
        */
    static hierarchyItems(originObj, idField, pIdField, props, topNode) {
        return new Promise((success, failed) => {
            let retObject = [];
            if (!idField) idField = "id";
            if (!pIdField) pIdField = "pid";
            ///首先将顶级的层先Map出来
            originObj.forEach(function (element) {
                if (!element[pIdField]) {
                    let topItem = {};
                    ///需要返回什么属性
                    if (props && props.length > 0)
                        props.forEach(function (field) {
                            topItem[field] = element[field];
                        });
                    else
                        topItem = element;
                    Utilities.recursionItems(originObj, topItem, idField, pIdField, props);
                    retObject.push(topItem);
                }
            });
            if (topNode && Array.isArray(topNode) && topNode.length > 0) {
                topNode[0].children = retObject;
                return success(topNode);
            }
            else
                success(retObject);
        });
    }
    ///分层递归生成子集
    static recursionItems(originObj, parentItem, idField, pIdField, props) {
        let children = [];
        originObj.forEach(function (element) {
            if (element[pIdField] == parentItem[idField]) {
                let item = {};
                if (props && props.length > 0)
                    props.forEach(function (field) {
                        item[field] = element[field];
                    });
                else
                    item = element;
                Utilities.recursionItems(originObj, item, idField, pIdField, props);
                children.push(item);
            }
        });
        if (children.length > 0) parentItem.children = children;
    }

    //判断是否为方法
    static isFunction(obj) {
        return obj != null && typeof (obj) === "function";
    }
    static getSaveFileHandler(destination){
        switch(destination.toLowerCase()){
            case "local": return require('./fileUtility'); 
            case "alioss": return require('./aLiYunOSSUtility');
            case "tencentcos": return require('./tencentCOSUtility'); 
            default: return require('./fileUtility'); 
        }
    }
    ///将上传的文件保存到OSS
    static uploadFile(saveDestination,fileName, file, saveOption, userInfo, callback){
        let fileHandler =  Utilities.getSaveFileHandler(saveDestination);
        fileHandler.saveFileStream(fileName, file, saveOption, userInfo, callback);
    }
     ///写字符串内容到存储对象保存为文件
    static saveString2File(filePath,strData,saveDestination="local"){
        let fileHandler =  Utilities.getSaveFileHandler(saveDestination);
        return fileHandler.saveString2File(filePath,strData);
    //    if (savelocal) return fileUtility.saveStr2Local(filePath,strData);
    //    return aLiYunOSSUtility.saveFileForStr(filePath,strData);
   }
    /**
     * 从远程下载文件并保存到腾讯云本地
     * @param {*} saveDestination 
     * @param {*} fileUrl 
     * @param {*} savesetting 
     * @param {*} keyid 
     */
    static downloadFile4upload(saveDestination,fileUrl,savesetting,keyid) {
        let fileOption      = urlUtility.parse(fileUrl);
        let filename        = path.basename(fileOption.path);
        var http =fileOption.protocol==='https:'? require('https'):require('http'); //require("../rpc/rpcUtility");
        var options         = {
            method: "GET",
            url:fileUrl,
            timeout:10000
        };
        return new Promise((resolve, reject) => {
            try{
                http.get(fileUrl,(res) => {
                    var dataArr = [], len = 0;
                    res.on('data',(chunk)=>{
                        dataArr.push(chunk);
                        len += chunk.length;
                    })
                    res.on("end", function (err) {
                        Utilities.uploadFile(saveDestination, filename, Buffer.concat(dataArr, len),savesetting,null, function (file, result) {
                            resolve(result);
                        });
                    });
                })
            }
            catch(err){
                console.log('download file error :',err);
                reject({successed:false,error:err});
            }
        })
    }
}
exports = module.exports = Utilities;



/* 范例调用
var rows = [
    { id: "1", pid: "", text: "lanmeihui", icon: "test", data: "123" },
    { id: "2", pid: "1", text: "总经理办公室", icon: "GM", data: "GM123" },
    { id: "3", pid: "1", text: "技术开发部", icon: "R&D", data: "R&D123" },
    { id: "4", pid: "1", text: "商务部", icon: "BD", data: "BD123" },
    { id: "5", pid: "2", text: "人事行政", icon: "Human", data: "Human123" },
    { id: "6", pid: "2", text: "董事会", icon: "Direct", data: "Direct123" },
    { id: "7", pid: "3", text: "App开发组", icon: "App", data: "App123" },
    { id: "8", pid: "3", text: "后台开发", icon: "BK", data: "BK123" },
    { id: "9", pid: "4", text: "对外事业拓展", icon: "Outer", data: "Outer123" },
    { id: "10", pid: "4", text: "投资部门", icon: "Invest", data: "Invest123" }];
var utility = require('./core/Utilities');
utility.hierarchyItems(rows, null, null, ["id", "text", "icon"]).then(result => console.log(result));
**/