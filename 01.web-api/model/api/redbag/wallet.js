/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../../core/database/daoBase');
class WalletModel extends daoBase {
    /*
    * 用户收益提现
    * 
    * */
    withDraw(params){
        let sqlCommand = "call proc_wallet_withdraw(?,?,?)";
        return this.database.executeSql(sqlCommand,  [params.userid,params.money,params.openid])
            .then(result => {
                let retData = result.rows[0][0];
                return {
                    successed:retData.result==0,
                    errcode:retData.result,
                    orderno:retData.orderno,
                    orderid:retData.orderid,
                    errmsg:retData.msg
                };
            })
    }

    /*
    * 用户钱包流水明细
    * 
    * */
   list(params){
    let sqlCommand = "call proc_wallet_list(?,?,?)";
    return this.database.executeSql(sqlCommand,  [params.userid,params.page,params.rows])
        .then(result => {
            return {
                successed:true,
                data:result.rows[0]
            };
        })
}

    /*
    * 收益提现返回结果更新
    * */
   withDrawOver(params){
    let sqlCommand = "call proc_wallet_widthdrawover(?,?,?)";
    return this.database.executeSql(sqlCommand,  [params.orderno,params.status,params.code])
        .then(result => {
            return {successed:true};
        })
    }
}
exports = module.exports = WalletModel;