/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../core/database/daoBase');

class MiniFormCode extends daoBase {
    get deleteExpiredSql() {return "delete from mini_formcode where now()>=expire_date;";}
    get deleteByformcode() {return "delete from mini_formcode where find_in_set(form_id,?)";}
    ///删除所有过期的记录
    deleteExpiredForm() {
        return this.database.executeSql(this.deleteExpiredSql);
    }
    ///插入记录
    deleteByFormId(Sql,model){
        return this.database.executeSql(this.deleteByformcode);
    }
}
exports = module.exports = MiniFormCode;