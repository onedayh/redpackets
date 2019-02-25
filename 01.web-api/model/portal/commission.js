/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../core/database/daoBase');
class CommissionModel extends daoBase {
    ///获取当前最新的返佣设置
    get getCommission() {return "call proc_pf_getCommission(?)";}
    get setCommission() {return "call proc_pf_setCommission(?,?,?,?,?)";}
   
    ///获取返佣设置
    getLatestCommission(activityid) {
        return this.database.executeSql(this.getCommission, activityid);
    }
    ///更新返佣设置
    updateCommission(activityid,type,level1,level2,level3){
        return this.database.executeSql(this.setCommission, [activityid,type,level1,level2,level3]);
    }
}
exports = module.exports = CommissionModel;