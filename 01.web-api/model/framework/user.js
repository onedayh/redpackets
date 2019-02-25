/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var util = require('util');
var daoBase = require('../../core/database/daoBase');
const getUserFunctionsSql = "call proc_GetSystemFunctions4User(?,?)";
const getSecurityForUser = "call proc_GetSecurityForUser(?)";
const getUserRoles = "select ur.rec_id as id,r.role_id as roleid,r.role_name as name from fw_userrole ur inner join fw_roles r on ur.role_id=r.role_id where user_id=?";

const SET_USER_DISABLED = "update fw_users set user_disabled=? where  find_in_set(user_id,?)";
const SET_USER_PASSWORD = "update fw_users set user_password=? where  find_in_set(user_id,?)";
const CHANGE_PASSWORD = "update fw_users set user_password=? where user_id=? and user_password=?";
//connection config
class UserModel extends daoBase {
    get getByIdSql() { return "select fw_users.* from fw_users where user_id = ? and fw_users.rec_isdeleted=0"; }
    get updateSql() { return "update fw_users set ? where user_id=?"; }
    get insertSql() { return "insert into fw_users set ?"; }
    get deleteSql() { return "update fw_users set rec_isdeleted=1 where find_in_set(user_id,?)"; }
    ///根据用户登录账号获取用户
    get getUserByAccount() {
        return "select user_id,user_name,user_password,user_photo " +
            "from fw_users where user_account=? and rec_isdeleted=0"
    }
    ///根据主键获取一条记录
    getBykey(Sql, id) {
        return this.database.executeSql(Sql, id);
    }
    ///插入记录
    create(Sql, model) {
        return this.database.executeSql(Sql, model);
    }
    ///更新记录
    update(Sql, model, id) {
        return this.database.executeSql(Sql, [model, id]);
    }
    ///删除记录
    delete(Sql, id) {
        return this.database.executeSql(Sql, id);
    }
    //根据登录账号找用户
    findUserByAccount(account) {
        return this.database.executeSql(this.getUserByAccount, account);
    }
    //用户登录
    userLogin(account, password) {
        let sqlCommand =  "call proc_Login(?,?);";
        return this.database.executeSql(sqlCommand, [account, password])
            .then(result => {
                let successed = result.rows[0][0].result == 0;
                if (successed==false) return { successed: false, errorcode: result.rows[0][0].result };
                return { successed: true, 
                            user: result.rows[1][0], 
                            functions: result.rows[2]
                            //privilege: result.rows[3] 
                        };
            })
            .catch(result => { return result; });

    }
    ///根据用户的id 获取到用户允许操作的功能链接菜单
    getUserFunctions(id, fulldir = 0) {
        return this.database.executeSql(getUserFunctionsSql, [id, fulldir]);
    }
    ///根据用户的id 获取到用户允许操作的功能链接菜单
    getUserRoles(userUid) {
        return this.database.executeSql(getUserRoles, userUid);
    }
    getSecuritiesSetting(id) {
        return this.database.executeSql(getSecurityForUser, id);
    }
    ///设置用户的可用状态
    setUserDisbled(userUid,disable=1){
        return this.database.executeSql(SET_USER_DISABLED,[disable,userUid]);
    }
    ///重设用户的密码
    resetUserPassword(userUid,password){
        return this.database.executeSql(SET_USER_PASSWORD,[password,userUid]);
    }
    ///用户自己重设的密码
    changePassword(userUid,oldpassword,newpassword){
        return this.database.executeSql(CHANGE_PASSWORD,[newpassword,userUid,oldpassword]);
    }

    ///获取登录的商户简单信息
    getLoggedUserInfo(id){
        let sqlCommand = "select user_name as name,user_photo as logo,user_account from fw_users where user_id=?";
        return this.database.executeSql(sqlCommand,id)
            .then(result=>{
                if (result.rows.length!=1) return {successed:false};
                let data = result.rows[0];
                return {successed:true,id:id,name:data.name,logo:data.logo};
            })

    }
}
exports = module.exports = UserModel;