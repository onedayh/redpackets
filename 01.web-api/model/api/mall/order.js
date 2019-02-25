/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var daoBase = require('../../../core/database/daoBase');
var utily   = require('../../../core/utilities/utilities');
const RECEIVE_GIFT = "call proc_order_receive(?,?,?)";
const REFUND_ORDER = "call proc_EC_ApplyRefund(?,?,?,?,?,?,@returnValue);";
const GET_RECEIVE_DATA_DETAIL = "call proc_EC_orderReceiveDetail(?,?)";

class orderModel extends daoBase {

   
    /**
    *  创建购物订单
    * @param {*} param 
    */
    createOrder(param) {
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

    ////预创建订单。
    prepareOrder(params){
        ////如果参数里面存在了orderid,则
        ////认为是用户发起再购买一次
        if (params.orderid){
            return this.repeatOrder(params)
        }
        let sqlCommand = "call proc_mall_ready4order(?,?,?,?,?,?,?);"
        return this.database.executeSql(sqlCommand, 
                [params.appid,
                params.userid,
                utily.checkValue(params.productid,null),
                utily.checkValue(params.groupid,null),
                params.skuid,
                params.countinfo,
                params.buytype || 100])
        .then(result => {
            //倒数第二个表是订单列表数据
            let orderinfo           = result.rows[0][0];   ///订单基础信息
            orderinfo.receiveinfo   = result.rows[1][0];
            orderinfo.items         = result.rows[2];
            ///此订单的团购链信息
            if (orderinfo.ordertype==2 && orderinfo.groupid>0)
                orderinfo.grouplink = result.rows[3]
            return {
                successed:true,
                data: orderinfo
            };
        })
    }
    ////订单再购买一次
    repeatOrder(params){
        let sqlCommand = "call proc_mall_repeatorder(?,?,?);"
        return this.database.executeSql(sqlCommand, 
                [params.appid,
                params.userid,
                params.orderid])
        .then(result => {
            //倒数第二个表是订单列表数据
            let orderinfo           = result.rows[0][0];   ///订单基础信息
            orderinfo.receiveinfo   = result.rows[1][0];
            orderinfo.items         = result.rows[2];
            ///此订单的团购链信息
            if (orderinfo.ordertype==2 && orderinfo.groupid>0)
                orderinfo.grouplink = result.rows[3]
            return {
                successed:true,
                data: orderinfo
            };
        })
    }
    
    /**
     * 订单详情
     * @param {*} orderData 
     */
    getOrderDetail(data) {
        let sqlCommand = "call proc_mall_getorderdetail(?,?,?,?)"
        return this.database.executeSql(sqlCommand, [data.appid, data.id, data.userid,data.recommend || 0])
            .then(result => {
                var orderinfo = result.rows[0];
                if (orderinfo.length!=1) return {successed:false,errmessage:"no order found"};
                var order = result.rows[0][0];
                order.details = result.rows[1];
                if (data.recommend==1) order.recommend = result.rows[2];
                return {
                    successed:true,
                    data: order
                };
            })
    }
    /**
     * 订单详情
     * @param {*} orderData
     */
    logisticsDetail(data) {
        let sqlCommand = "select log_company as company,log_comcode as code,log_no logno, log_fee logfee , log_date logdate from bus_order_logistics where order_id = ? and ifnull(log_no,'')<>'' order by log_date desc limit 1"
        return this.database.executeSql(sqlCommand, data)
            .then(result => {
                if (result.rows.length==1) return {successed:true,data:result.rows[0]}
                return {successed:true,data:null};
            })
    }
    ////用户确认收货
    receiveOrder(param){
        let sqlCommand = "update bus_order set order_status = 3 where order_id=? and user_id=?";
        return this.database.executeSql(sqlCommand, [param.id,param.userid]);
    }

    ///订单自动签收
    confirmSignIn(param){
        let sqlCommand = "call proc_mall_logisticsconfirm(?);"
        return this.database.executeSql(sqlCommand, param.logno);
    }

    ////根据用户获取他的订单列表
    getUserOrders(params) {
        var data = [params.appid,params.userid, params.page || 1, params.rows || 10, params.status || -1]
        let sqlCommand = "call proc_mall_getorders(?,?,?,?,?);"
        return this.database.executeSql(sqlCommand, data)
            .then(result => {
                let orders  = result.rows[0];
                let details = result.rows[1];   
                orders.forEach(element => {
                    let subItems        =  details.filter(item=>{return item.order_id==element.order_id});
                    element.itemcount   =  subItems.length;
                    element.items       =  details.filter(item=>{return item.order_id==element.order_id}).slice(0,3);
                });
                return {
                    successed:true,
                    data: orders
                };
            })
    }
    ///取消订单
    cancelOrder(data){
        let sqlCommand = "call proc_mall_cancelorder(?,?)"
        return this.database.executeSql(sqlCommand, [data.id, data.userid])
            .then(result => {
                var order = result.rows[0][0]
                return {successed: order.result == 0};
            })
    }

    ///订单退款
    refundOrder(param){
        let sqlCommand = "call proc_mall_refundsingleorder(?,?)"
        return this.database.executeSql(sqlCommand, [param.id, param.userid])
            .then(result => {
                var returnData = result.rows[0][0]
                return {successed: returnData.result == 0,...returnData};
            })
    }
    ///删除订单
    deleteUserOrder(data) {
        let sqlCommand = "call proc_mall_deleteorder(?,?)"
        return this.database.executeSql(sqlCommand, [data.id, data.userid])
            .then(result => {
                var order = result.rows[0][0]
                return {successed: order.result == 0};
            })
    }
    ///获取团购链条的进度信息
    getGroupBuyProgress(param){
        let sqlCommand = "call proc_mall_getgroupbuyprogress(?,?,?)";
        return this.database.executeSql(sqlCommand, [param.userid, param.groupid,param.recommend])
            .then(result => {
                if (result.rows[0].length!=1) return {successed:false,errmessage:"group not found"};
                var groupinfo = result.rows[0][0];
                groupinfo.users     =   result.rows[1];
                groupinfo.moregroup =   result.rows[2];
                if (param.recommend==1) groupinfo.recommend = result.rows[3];
                return {successed:true,data:groupinfo};
            })
    }
}
exports = module.exports = orderModel;