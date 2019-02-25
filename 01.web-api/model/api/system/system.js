/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../../core/database/daoBase');
var utility = require('../../../core/utilities/utilities');
class SystemModel extends daoBase {
    /****** 平台分享 ******/
    /*
    * 插入分享记录
    */
   createShare(param){
    let sqlCommand = "insert into pf_share(share_id,parent_id,user_id,share_date,share_url,share_scene,share_param)"+
                     "values(?,?,?,now(),?,?,?)";
    param.parent=utility.checkValue(param.parent,null);
    return this.database.executeSql(sqlCommand, [param.shareid,param.parent,param.userid,param.route,param.scene,param.param]);
    }

    /*
    * 获取二维码scene的值对应的设置
    */
   getShareScene(param){
        let sqlCommand = "call proc_share_identifyscene(?)";
        return this.database.executeSql(sqlCommand, [param.scene])
                .then(result=>{
                    if (result.rows[0].length!=1) return {successed:true};
                    let retData = result.rows[0][0];
                    //let param = {shareid:retData.id,param:null};
                    if (!utility.isNullOrEmpty(retData.param)) 
                        return {successed:true,param:JSON.parse(retData.param)};
                    return {successed:true};
                })
                .catch(result=>{return {successed:false}})
    }
    /*
    *通过识别到的二维码中的scene信息，设置用户的关键信息，
    * */
    setUserComeInKeyByScene(param){
        ///如果没有类型，则不调用
        if (!param.type) return null;
        let sqlCommand = "call proc_share_setscenekey(?,?,?)";
        return this.database.executeSql(sqlCommand, [param.userid,param.type,param.json]);
    }
    /*
    * 获取分享配置
    */
    getShareInfo(param){
        let sqlCommand = "call proc_system_getsharesetting(?)";
        return this.database.executeSql(sqlCommand, param.route);
    }

    /*
    * 创建一条应用反馈
    * */
    createFeedback(params) {
        let sqlCommand = "call proc_system_createfeedback(?,?,?)";
        return this.database.executeSql(sqlCommand, [params.userid, params.content, params.type])
            .then(result => {
                return {successed:true};
            })
    }
    /*
    * 记录用户进入小程序的分享者id
    * */
    setAppShare(param){
        let sqlCommand = "call proc_share_setusershareid(?,?)";
        return this.database.executeSql(sqlCommand, [params.userid, params.shareid]);
    }

}
exports = module.exports = SystemModel;