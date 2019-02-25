/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../../core/database/daoBase');
class MembershipModel extends daoBase {

    /**
     * 登记用户的信息
     * @param {*} userinfo 
     */
    Register(userinfo) {
        let sqlCommand = "call proc_member_register(?); ";
        return this.database.executeSql(sqlCommand, userinfo.wxunionid)
            .then(result => {
                var retValue = result.rows[0][0];
                return { successed: true, data: retValue};
            })
            .catch(result => {
                return { successed: false, errorcode: 10000 };
            });
    }
    /*
    *
    *  更新用户的个人信息
    * */
    setUserInfo(userinfo) {
        var params = [
            userinfo.wxunionid,
            userinfo.username,
            userinfo.logo,
            userinfo.gender,
            userinfo.city
        ];
        let sqlCommand = "call proc_member_setinfo(?,?,?,?,?); ";
        return this.database.executeSql(sqlCommand, params)
            .then(result => {
                var retValue = result.rows[0][0];
                return { successed: true, data: retValue };
            })
            .catch(result => {
                return { successed: false, errorcode: 10000 };
            });
    }
    ///获取应用上用户的信息
    getProfileData(userid){
        let sqlCommand = "call proc_user_getprofiledata(?)";
        return this.database.executeSql(sqlCommand, userid)
            .then(result => {
                if ( result.rows[0].length!=1) return {successed:false,errcode:-1,errmessage:"user not found!"};
                var userdata = result.rows[0][0];
                return { successed: true,errcode:0,errmsg:"ok",...userdata };
            })
    }

    /*
    * 获取用户的当前的余额
    * * */
   getUserBalance(userid){    
    let sqlCommand ="call proc_user_getbalance(?)";
    return this.database.executeSql(sqlCommand, userid)
        .then(result => {
            if (result.rows[0].length!=1) return {successed:false,errcode:-1,errmsg:"没有找到用户"}
            return {
                successed: true,
                balance:result.rows[0][0].balance
            };
        })
    }
    /*
    *  获取用户的红包活动记录
    * */
   userGrabbed(params) {
    let sqlCommand = "call proc_redbag_grabbyuser(?,?,?)";
    return this.database.executeSql(sqlCommand, [params.userid,params.page,params.rows])
        .then(result => {
            return {
                successed:true,
                data:result.rows[0]
            };
        })
    }
    /**
     * 获取用户的红包汇总
     * @param {*} param 
     */
    userTotalRedbag(param){
        let sqlCommand = "call proc_user_getredbagtotal(?,?)";
        return this.database.executeSql(sqlCommand, [param.userid,param.type])
        .then(result => {
            let retRow = result.rows[0][0];
            return {
                successed:true,
                errcode:0,
                errmsg:"ok",
                ...retRow
            };
        })
    }
      ////获取用户创建的红包活动
      getOwnerByUser(param) {
        let sqlCommand = "call proc_redbag_getbyowner(?,?,?);"
        return this.database.executeSql(sqlCommand,[param.userid,param.page,param.rows])
            .then(result => {
                return {
                    successed:true,
                    data:result.rows[0]
                };
            })
    }
}
exports = module.exports = MembershipModel;