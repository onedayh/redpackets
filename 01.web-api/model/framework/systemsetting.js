/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../core/database/daoBase');

class SystemSettingModel extends daoBase {
   
    get updateSql() {return "update fw_setting set ? where app=?";}
    ///根据主键获取一条记录
    getSettingById(appid) {
        let sqlCommand = "call proc_merchant_getminisetting(?);"
        return this.database.executeSql(sqlCommand,appid);
    }
    ///更新记录
    updateSetting(jsonstring,appid){
        let sqlCommand = "replace into fw_setting(app_id,setting_json) values (?,?)";
        return  this.database.executeSql(sqlCommand,[appid,jsonstring]);
    }

    
}
exports = module.exports = SystemSettingModel;