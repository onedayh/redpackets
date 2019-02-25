/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var util        = require('util'); 
var daoBase     = require('../../core/database/daoBase');
var utility     = require('../../core/utilities/utilities');
var config      = require('../../core/configuration/frameworkConfig');
class ApplicationModel extends daoBase {
    ///根据登录账号获取商户信息
    getApplications() {
        let sqlCommand="call proc_component_getapplications()";
        return this.database.executeSql(sqlCommand);
    }
    ///根据主键获取一条记录
    getBykey(Sql,id) {
        let miniid = config.getSetting("applicationid")
        return this.database.executeSql(Sql, [id,miniid]);
    }
    /**
     * 注册商家用户
     * @param {*} param 
     */
    createMerchant(param){
        let sqlCommand = "call proc_mini_registermerchant(?,?,?,?)";
        return this.database.executeSql(sqlCommand, [param.name,param.account,param.password,param.mobile])
                .then(result=>{
                        let retRow = result.rows[0][0];
                        return {successed:retRow.merchantid!=null,id:retRow.merchantid};                        
                })
    }

    /**
     * 根据AppId获取商家的小程序配置
     * @param {*} appid : 微信公众号appid
     */
    getAppInfoByAppId(appid) {
        let sqlCommand = "call proc_mini_getappinfo(?)"
        return this.database.executeSql(sqlCommand, appid);
    }
     /**
      * 商户前端登录
      * @param {*} param 
      */
     merchantLogin(param) {
        let sqlCommand = "call proc_mini_merchantfrontlogin(?,?,?)";
        return this.database.executeSql(sqlCommand, [param.name,param.account,param.password])
            .then(result => {
                let row = result.rows[0][0];
                if (row.result==1) return {successed:false};
                ///否则返回商户的信息和他已经授权的小程序应用
                return {successed:true,mini:result.rows[1]};
            })
            .catch(result => { return result; });

    }

    //客户后台登录
    login(merchantname,account, password,programid) {
        let sqlCommand = "call proc_mini_merchantlogin(?,?,?,?);";
        return this.database.executeSql(sqlCommand, [merchantname,account, password,programid])
            .then(result => {
                ///return errored login
                //var retValuePosition = result.rows.length - 2;
                let row = result.rows[0][0];
                if (row.result!=0) return { successed: false, errorcode: row.result };
                //var retValue = result.rows[retValuePosition][0].result;
                //if (retValue != 0) return { successed: false, errorcode: retValue };
                return { successed: true, data : {
                    id:row.merchantid,
                    name:row.name,
                    logo:row.logo,
                    appid:row.appid,
                    super:row.superadmin,       ////用户是否是超级用户（商户登录）
                    admin:row.admin,            ////用户有管理员权限（同超级用户）
                    functions: result.rows[1],  ////用户所拥有的权限功能
                    roles: result.rows[2]   ////用户所拥有的角色
                }};
            })
            .catch(result => { return result; });

    }

    ///获取登录的商户简单信息
    getLoggedInMerchantInfo(id){
        let sqlCommand = "select 0 as type,merchant_id as id,merchant_name as name,merchant_logo as logo from mini_merchant where merchant_id=?"+
                         " union "+
                         " select 1 as type,user_id as id,user_name as name,user_photo as logo from mini_merchant_user where user_id=? "+
                         " order by type limit 1";
        return this.database.executeSql(sqlCommand,[id,id])
            .then(result=>{
                if (result.rows.length!=1) return {successed:false};
                let data = result.rows[0];
                return {successed:true,id:id,name:data.name,logo:data.logo};
            })

    }
    /**
     * 商户授权小程序应用
     * @param {} param 
     */
    authorizationApplication(param){

    }

    ///更新记录
    update(Sql,model,id){
        return  this.database.executeSql(Sql,[model,id]);
    }
    ///删除记录
    delete(Sql,id){
        return this.database.executeSql(Sql,id);
    }

    changePassword(id,oldpassword,newpassword){
        let sqlCommand="update mini_merchant set merchant_password=? where merchant_id=? and merchant_password=?";
        return this.database.executeSql(sqlCommand,[newpassword,id,oldpassword]);
    }

}
exports = module.exports = ApplicationModel;