/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../core/database/daoBase');
var utility = require('../../core/utilities/utilities');
const SHARE_MODIFY = "call proc_share_modify(?,?,?,?,?)";
const GET_SHARE_BY_ID = "call proc_share_byid(?)";

class ShareModel extends daoBase {
   
    modify(data) {
        var params = [data.shareid, data.parentid, data.userid, data.url, data.target]
        return this.database.executeSql(SHARE_MODIFY, params)
            .then(result => {
                var retValue = result.rows[0][0];
                return {
                    successed: result.successed,
                    data: retValue
                };
            })
    }
    detail(data) {
        var params = [data.id]
        return this.database.executeSql(GET_SHARE_BY_ID, params)
            .then(result => {
                var retValue = result.rows[0];
                return {
                    successed: result.successed,
                    data: retValue
                };
            })
    }
}
exports = module.exports = ShareModel;