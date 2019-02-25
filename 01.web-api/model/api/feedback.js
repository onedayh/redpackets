/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../core/database/daoBase');
const ADD_FEEDBACK = "call proc_feedback_create(?,?,?,?)";
const GET_FEEDBACK = "call proc_feedback_list(?,?,?)"

class FeedbackModel extends daoBase {
    get getByIdSql() { return "select * from pf_feedback where rec_id=? "; }
    get updateSql() { return "update pf_feedback set ? where rec_id=?"; }
    get insertSql() { return "insert into pf_feedback set ?"; }
    get deleteSql() { return "delete from pf_feedback where find_in_set(rec_id,?)"; }

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
    ///添加一件反馈
    add(data) {
        var params = [data.id, data.userid, data.content, data.type]
        return this.database.executeSql(ADD_FEEDBACK, params)
            .then(result => {
                var retValue = result.rows[0][0];
                return {
                    successed: result.successed && retValue.result == 0,
                    data: retValue || {}
                };
            })
    }
    ///查询用户的意见列表
    list(data) {
        var params = [data.userid, data.page, data.size];
        return this.database.executeSql(GET_FEEDBACK, params)
            .then(result => {
                var retValue = result.rows[0];
                return {
                    successed: result.successed,
                    data: retValue
                };
            })
    }
}
exports = module.exports = FeedbackModel;