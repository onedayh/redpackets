/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../core/database/daoBase');
class RebateConfigModel extends daoBase {
    get getByIdSql() {return "select * from pf_rebate_config where config_rebate=? ";}
    get updateSql() {return "update pf_rebate_config set ? where config_rebate=?";}
    get setRebateEnabledSql() {return "update from pf_rebate_config set config_enable=? where config_rebate=?";}
    ///根据主键获取一条记录
    getBykey(Sql,id) {
        return this.database.executeSql(Sql, id);
    }
    ///更新记录
    update(Sql,model,id){
        return  this.database.executeSql(Sql,[model,id]);
    }
    ///删除记录
    setRebateStatus(id,enabled=1){
        return this.database.executeSql(this.setRebateEnabledSql,[enabled,id]);
    }
}
exports = module.exports = RebateConfigModel;