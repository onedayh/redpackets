/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
* 红包背景数据实体
*/
var daoBase = require('../../core/database/daoBase');
class TopicModel extends daoBase {
    get getByIdSql() {return "select * from bas_red_topic where topic_id=? ";}
    get updateSql() {return "update bas_red_topic set ? where topic_id=?";}
    get insertSql() {return "insert into bas_red_topic set ?";}
    get deleteSql() {return "delete from bas_red_topic where topic_id=?";}

    getBykey(Sql,id) {
        return this.database.executeSql(Sql, id);
    }
    ///插入记录
    create(Sql,model){
        return this.database.executeSql(Sql, model);
    }
    ///更新记录
    update(Sql,model,id){
        return  this.database.executeSql(Sql,[model,id]);
    }
    ///删除记录
    delete(Sql,id){
        return this.database.executeSql(Sql,id);
    }
    /**
     * 设置背景的有效性
     * @param {*} param 
     */
    setTopicStatus(param){
        let sqlCommand = "update bas_red_topic set topic_enabled=? where topic_id=?";
        return this.database.executeSql(sqlCommand,[param.status || 1,param.id]);
    }
    
    /**
     * 设置背景的默认
     * @param {*} param 
     */
    setTopicDefault(id){
        let sqlCommand = "call proc_background_setdefault(?,?)";
        return this.database.executeSql(sqlCommand,[2,id])
                .then(result=>{
                    let defaultRow = result.rows[0][0];
                    return {successed:true,...defaultRow};
                })
    }
}
exports = module.exports = TopicModel;