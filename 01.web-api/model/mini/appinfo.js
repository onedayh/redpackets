/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase     = require('../../core/database/daoBase');
class AppInfoModel extends daoBase {

    get getByIdSql() {return "select * from bas_wechat_publicinfo where app_id=? ";}
    get updateSql() {return "update bas_wechat_publicinfo set ? where app_id=?";}
    get insertSql() {return "insert into bas_wechat_publicinfo set ?";}
    get deleteSql() {return "delete from bas_wechat_publicinfo where app_id=?";}
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
     * 根据公众号或小程序的appid获取相关信息
     */
    getAppInfoById(id){
        let sqlCommand="select app_id,app_name,app_key,merchant_wxid,merchant_key,merchant_cert,app_type,app_path,app_param from bas_wechat_publicinfo where app_id=?";
        return this.database.executeSql(sqlCommand,id)
            .then(result=>{
                if (result.rows != null && result.rows.length == 1) {
                    ///将从数据库中获得的结果集根据dataconfig中的配置进行映射转换
                    return { successed: true, appinfo: result.rows[0] };
                }
                return { successed:false};
            })
    }
    getAll(){
        let sqlCommand="select app_id,app_name,app_key,merchant_wxid,merchant_key,merchant_cert,app_type,app_path,app_param from bas_wechat_publicinfo";
        return this.database.executeSql(sqlCommand)
            .then(result=>{
                let pubInfos = [];
                result.rows.forEach(row => {
                    pubInfos.push({
                        appId           :row.app_id,
                        appSecret       :row.app_key,
                        appName         :row.app_name,
                        wxmerchantId    :row.merchant_wxid,
                        wxmerchantKey   :row.merchant_key,
                        wxmerchantCert  :row.merchant_cert,
                        appType         :row.app_type,
                        appPath         :row.app_path,
                        appParam        :row.app_param,
                        token           :null
                    })
                });
                return { successed:true,items:pubInfos};
            })
    }

}
exports = module.exports = AppInfoModel;