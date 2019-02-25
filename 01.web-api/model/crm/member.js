/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../core/database/daoBase');
var utility = require('../../core/utilities/utilities');
const GET_USER_TOTAL_CONSUME = "select sum(pay_total) as total from fw_payment where user_id=? and pay_status=1 "
class MemberModel extends daoBase {
    get getByIdSql() {
        return "select * from vw_users where id=?" ;}
    ///根据主键获取一条记录
    getBykey(Sql,id) {
        return this.database.executeSql(Sql, id);
    }
    get updateSql() {return "update crm_user set user_mobile=? where user_id=?";}
    ////获取用户的总计消费
    getUserTotalConsume(id,type,startDate,endDate){
        var whereClause ='';
        if (!utility.isNullOrEmpty(type)) whereClause+=' and order_type ='+type;
        if (!utility.isNullOrEmpty(startDate)) whereClause+=" and pay_date >='"+startDate+" 00:00:00' ";
        if (!utility.isNullOrEmpty(endDate)) whereClause+=" and pay_date <='"+endDate+" 23:59:59' ";
        return this.database.executeSql(GET_USER_TOTAL_CONSUME+whereClause,id);
    }
     ///更新用户手机
    updateUserMobile(id,phoneNumber){
        let sqlCommand = "update crm_user set user_mobile=? where user_id=?"
        return  this.database.executeSql(sqlCommand,[phoneNumber,id]);
    }

    ///设置用户的上级用户
    setUserParent(id,parentId){
        let sqlCommand = "update crm_user set parent_id=? where user_id=?"
        return  this.database.executeSql(sqlCommand,[parentId,id]);
    }
    ///添加用户的下线用户
    addUserChild(id,childs){
        let sqlCommand = "update crm_user set parent_id=? where find_in_set(user_id,?)"
        return  this.database.executeSql(sqlCommand,[id,childs]);
    }
}
exports = module.exports = MemberModel;