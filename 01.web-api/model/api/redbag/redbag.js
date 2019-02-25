/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../../core/database/daoBase');
var utility = require('../../../core/utilities/utilities');
class RedBagModel extends daoBase {
    /**
     * 获取广场上的所有红包
     */
    redpacketInPublic(userid){
        let sqlCommand = "call proc_redbag_public(?)";
        return this.database.executeSql(sqlCommand,userid)
                .then(result=>{
                    return {successed:true,data:result.rows[0]};
                })
    }
    /**
     * 获取红包的支付订单信息
     * @param {*} Sql 
     * @param {*} id 
     */
    getRedBagOrderInfo(redid) {
        let sqlCommand = "call proc_redbag_getorderinfo(?)";
        return this.database.executeSql(sqlCommand, redid)
                .then(result=>{
                    if (result.rows[0].length!=1) return {successed:false,errcode:-1,errmsg:"no record"};
                    let info = result.rows[0][0];
                    return {successed:true,rows:info,id:redid};
                })
    }
    /**
     * 创建红包活动
     * @param {*} userinfo 
     */
    create(param) {
        let sqlCommand = "call proc_redbag_create(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); ";
        return this.database.executeSql(sqlCommand, 
                                        [param.topic,
                                         param.logo,
                                         param.bless,
                                         param.userid,
                                         param.bgimage,
                                         param.bgmusic,
                                         param.layout,
                                         param.poster,
                                         param.playtype  || 0,
                                         param.groupcount|| 2,
                                         param.amount,
                                         param.total,
                                         param.paytype   || 0,
                                         param.alloctype || 0,
                                         utility.checkValue(param.minimal,null),
                                         utility.checkValue(param.maximum,null),
                                         param.startdate || null,
                                         param.enddate   || null,
                                         param.userlimit || 0,
                                         param.follow    || 0,
                                         param.appid,
                                         param.appname,
                                         param.public    || 0,
                                         param.share     || 0,
                                         param.shareimage
                                        ])
            .then(result => {
                var retValue = result.rows[0][0];
                if (retValue.result!=0) return {successed:false};
                return {successed:true,...retValue}
            })
            .catch(result => {
                return { successed: false, errorcode: 10000 };
            });
    }
    /**
     * 编辑红包活动
     * @param {*} userinfo 
     */
    edit(id,param) {
        let sqlCommand = "call proc_redbag_update(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?); ";
        return this.database.executeSql(sqlCommand, 
                                        [
                                         id,
                                         param.topic,
                                         param.logo,
                                         param.bless,
                                         param.userid,
                                         param.bgimage,
                                         param.bgmusic,
                                         param.layout,
                                         param.poster,
                                         param.playtype  || 0,
                                         param.groupcount|| 2,
                                         param.amount,
                                         param.total,
                                         param.paytype   || 0,
                                         param.alloctype || 0,
                                         utility.checkValue(param.minimal,null),
                                         utility.checkValue(param.maximum,null),                                        
                                         param.startdate || null,
                                         param.enddate   || null,
                                         param.userlimit || 0,
                                         param.follow    || 0,
                                         param.appid,
                                         param.appname,
                                         param.public    || 0,
                                         param.share     || 0,
                                         param.shareimage
                                        ])
            .then(result => {
                var retValue = result.rows[0][0];
                if (retValue.result!=0) return {successed:false};
                return {successed:true,...retValue}
            })
            .catch(result => {
                return { successed: false, errorcode: 10000 };
            });
    }
    /*
    *
    *  红包支付完毕，创建成功。【该方法用于微信回调】
    * */
    payedOver(param) {
        let sqlCommand = "call proc_redbag_orderpayed(?,?);";
        return this.database.executeSql(sqlCommand, [param.orderno,param.qrcode])
            .then(result => {
                var retValue = result.rows[0][0];
                ////确认完成了支付,将红包分配的方式返回
                if (retValue.result==0)  return { successed: true,...retValue};
                return { successed: false};
            })
            .catch(result => {
                return { successed: false, errorcode: 10000 };
            });
    }
    /**
     * 针对未支付的红包活动重新发起支付
     * @param {} 红包id 
     */
    repayRedbag(param){
        let sqlCommand = "call proc_redbag_payredbag(?)";
        return this.database.executeSql(sqlCommand, [param.id])
            .then(result => {
                var retValue = result.rows[0][0];
                if (retValue.result!=0) return {successed:false};
                return {successed:true,...retValue}
            })
            .catch(result => {return { successed: false, errorcode: 10000 };});
    }
    /**
     * 撤回红包金额
     * @param {*} param 
     */
    rollback(param){
        let sqlCommand = "call proc_redbag_rollback(?,?)";
        return this.database.executeSql(sqlCommand, [param.id,param.userid])
            .then(result => {
                var retValue = result.rows[0][0];
                return {successed:retValue.result==0,...retValue}
            })
            .catch(result => {return { successed: false, errorcode: 10000 };});
    }
    /**
     * 线下支付红包及服务费
     * @param {*} param 
     */
    offlinePayRedBag(param){
        let sqlCommand = "call proc_redbag_offlinepay(?,?,?,?,?,?,?); ";
        return this.database.executeSql(sqlCommand, 
                                        [
                                         param.id,
                                         param.paydate,
                                         param.service || 0,
                                         param.image,
                                         param.qrcode,
                                         param.checker,
                                         param.memo
                                        ])
            .then(result => {
                var retValue = result.rows[0][0];
                if (retValue.result!=0) return {successed:false};
                return {successed:true,...retValue}
            })
            .catch(result => {
                return { successed: false, errorcode: 10000 };
            });
    }
    /**
     * 登记用户参与了某个红包活动
     * @param {*} param 
     */
    joined(param){
        let sqlCommand = "insert into bus_redbag_join(red_id,user_id,join_date,param) values(?,?,now(),?)";
        return this.database.executeSql(sqlCommand,[param.id,param.userid,param.param]);
    }

    ////用户抢到了红包,记录到数据库
    grabbed(param){
        if (param.grabinfo && param.grabinfo.length>0){
            let sqlCommand  = "insert into bus_redbag_alloc(red_id,user_id,seq_price) values ";
            return this.database.executeSql(sqlCommand+param.grabinfo.join(','));
        }

    }

    

    /**
     * 红包引流跳转小程序
     * @param {*} param 
     */
    diversion(param){
        let sqlCommand = "call proc_app_diversion(?,?,?,?)";
        return this.database.executeSql(sqlCommand,[param.appid,param.userid,param.openid,param.id]);
    }

    /**
     * 获取红包的分配信息
     * @param {*} param 
     */
    getAllocInfo(param){
        if (param.type==0) return this.getAllocSummary(param);
        return this.getAllocList(param)
    }
     /**
     * 获取红包的发放汇总信息
     * @param {*} id 
     */
    getAllocSummary(param){
        let sqlCommand = "call proc_redbag_summaryinfo(?)";
        return this.database.executeSql(sqlCommand,param.id)
                .then(result=>{
                    if(result.rows[0].length!=1) return {successed:false,errcode:-1,errmsg:"not found"};
                    let row = result.rows[0][0];
                    return {successed:true,errcode:0,errmsg:"ok",...row}
                })
    }
     /**
     * 获取红包的获取到的用户列表
     * @param {*} id 
     */
    getAllocList(param){
        let sqlCommand = "call proc_redbag_getallocinfo(?,?,?)";
        return this.database.executeSql(sqlCommand,[param.id,param.page,param.rows])
                    .then(result=>{
                        return {successed:true,errcode:0,errmsg:"ok",data:result.rows[0]}
                    })
    }
    /**
     * 设置红包数据清理状态
     * @param {*} id 
     */
    clear(id){
        let sqlCommand = "update bus_redbag set red_cleared = 1 where red_id=?";
        return this.database.executeSql(sqlCommand,id);
    }
    /**
     * 获取红包可供选择的背景
     * type = 0: 背景封面
     * type = 1: 背景音乐
     */
    getBackground(type){
        let sqlCommand = "call proc_redbag_background(?)";
        return this.database.executeSql(sqlCommand,type)
            .then(result=>{
                return {successed:true,errcode:0,errmsg:"ok",data:result.rows[0]}
            })
    }
    /**
     * 广场上的弹幕
     */
    getAllBarrageData(){
        let sqlCommand = "call proc_redbag_barrage()";
        return this.database.executeSql(sqlCommand)
            .then(result=>{
                return {successed:true,data:result.rows[0]}
            })
    }
    /**
     * 记录实际发放的金额和个数
     * @param {*} param 
     */
    actualDistribute(param){
        let sqlCommand = "call proc_red_actualrecord(?,?,?)";
        return this.database.executeSql(sqlCommand,[param.id,param.amount,param.total]);
    }
}
exports = module.exports = RedBagModel;