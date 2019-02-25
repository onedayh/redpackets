/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../core/database/daoBase');

class FeedbackModel extends daoBase {
    get updateStatusSql() { return "update pf_feedback set feedback_status=? where rec_id=?"; }
    ///更新记录
    updateStatus(id,status) {
        return this.database.executeSql(this.updateStatusSql, [status,id]);
    }
}
exports = module.exports = FeedbackModel;