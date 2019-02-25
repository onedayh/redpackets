﻿/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../core/database/daoBase');
class RedBagModel extends daoBase {
    get getByIdSql() {return "select * from vw_redbag where id=? ";}
    get updateSql() {return "update bus_redbag set ? where red_id=?";}
    //get insertSql() {return "insert into pf_redbag set ?";}
    get deleteSql() {return "delete from bus_redbag where red_id=?";}

    ///根据主键获取一条记录
    getBykey(Sql,id) {
        return this.database.executeSql(Sql, id);
    }
    ///删除记录
    delete(Sql,id){
        return this.database.executeSql(Sql,id);
    }
    
}
exports = module.exports = RedBagModel;