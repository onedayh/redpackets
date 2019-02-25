/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../../core/database/daoBase');
var utility = require('../../../core/utilities/utilities');

class OrderModel extends daoBase {
    ///创建商城订单
    createMallOrder(param) {
        let sqlCommand = "call proc_mall_createorder(?,?,?,?,?,?,?,?);"
        return this.database.executeSql(sqlCommand, [param.orderid,param.appid,param.userid,param.uservoucher,param.credit || 0, param.deliver,param.paytype||0,param.password])
            .then(result => {
                ///最后一组返回的信息是订单的真正信息
                let orderinfo =result.rows[0][0];
                ///订单免于支付，需要将其他的信息带出，如团购的人员和分销的人员
                ///用于发送消息
                if (orderinfo.orderstatus==1){
                    let payedInfo = result.rows[1][0];
                    orderinfo = Object.assign({},orderinfo,payedInfo);
                }
                return {
                    successed: orderinfo.result==0,
                    result:orderinfo.result,
                    orderinfo:orderinfo,
                };
            })
    }

     ///创建购物卡订单
     createCardOrder(param) {
        let sqlCommand = "call proc_mall_createcardorder(?,?,?);"
        return this.database.executeSql(sqlCommand, [param.appid,param.userid,param.cardid])
            .then(result => {
                return {
                    successed: true,
                    orderinfo: result.rows[0][0],
                };
            })
    }
     ///创建余额充值订单
     createRechargeOrder(param) {
        let sqlCommand = "call proc_mall_createrechargeorder(?,?,?);"
        return this.database.executeSql(sqlCommand, [param.appid,param.userid,param.rechargeid])
            .then(result => {
                return {
                    successed: result.rows[0][0].result==0,
                    orderinfo: result.rows[0][0]
                };
            })
    }
    /*
    * 获取商品订单，唤起支付
    */
   getMallOrder4Pay(param){
        let sqlCommand = "call proc_mall_getorder4pay(?,?,?,?)";
        return this.database.executeSql(sqlCommand,[param.orderno,param.deliver,param.paytype||0,param.password])
                .then(result=> {
                    if ( result.rows[0].length!=1) return {successed:false};
                    let orderinfo = result.rows[0][0];
                    return {successed:orderinfo.result==0, orderinfo:orderinfo};
                });
    }
    /*
    *创建订单,唤起订单支付
    */
    pay4Order(param){
        switch(parseInt(param.type)){
            ///创建产品购买订单
            case 1:
                if (!utility.checkValue(param.orderno,null)) return this.createMallOrder(param);
                return this.getMallOrder4Pay(param);
            ///创建购物卡订单
            case 2: return this.createCardOrder(param);
            ///创建余额充值订单
            case 3: return this.createRechargeOrder(param);

                
        }
    }
    /*
    *完成支付进入的回调
    */
    payCallBack(param){
        // let sqlCommand = "call proc_mall_orderpayed(?)";
        // return this.database.executeSql(sqlCommand,[param.orderno])
        //       .then(result=> {
        //             return {successed:true};
        //         });
        switch(parseInt(param.type)){
            ///产品购买订单回调
            case 1:  return this.mallOrderCallback(param);
            ///购物卡订单回调
            case 2:  return this.cardOrderCallback(param);
            ///用户余额充值订单
            case 3:  return this.rechargeOrderCallback(param);
        }
        return {successed:true};
    }
    ///商城购物订单回调
    mallOrderCallback(param) {
        let sqlCommand = "call proc_mall_orderpayed(?,?)";
        return this.database.executeSql(sqlCommand,[param.orderno,param.paytype || 0])
              .then(result=> {
                    let payinfo = result.rows[0][0];
                    return {successed:payinfo.result==0,...payinfo};
                });
    }

    ///购物卡订单回调
    cardOrderCallback(param) {
        let sqlCommand = "call proc_mall_cardorderpayed(?)";
        return this.database.executeSql(sqlCommand,[param.orderno])
              .then(result=> {
                    return {successed:true};
                });
    }
    ///充值订单回调
    rechargeOrderCallback(param) {
        let sqlCommand = "call proc_mall_rechargeorderpayed(?)";
        return this.database.executeSql(sqlCommand,[param.orderno])
              .then(result=> {
                    return {successed:true};
                });
    }
            
    
}
exports = module.exports = OrderModel;