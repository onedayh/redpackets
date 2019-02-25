/*
* 消息发送的工具类
* 集成了微信模板消息和手机短信消息发送为一体
*/
var co              = require('co');
var moment          = require('moment');
var utility         = require('../../../core/utilities/utilities');
var messageUtility  = require('../../../core/utilities/messageUtility');
var constMessage    = require('../../../model/messagekey');
var redisKey        = require('../../../model/rediskey');
var stringUtility   = require('../../../core/utilities/stringUtility');
var redisHelper     = require('../../../core/utilities/redisUtility');
var orderDao        = require('../../../model/mall/order');
var WechatPay       = require('../../../core/wechatapi/WechatPay');
var paymentUtility  = require('../../../core/wechatapi/PaymentUtility');
var _redis          = new redisHelper();
class OrderUtility
{
    /**
     * 注册团购订单在redis中的过期消息
     */
    static registerGrouporderExpiredMessage(){
        //var _groupExpiredRedis = new redisHelper();
        this.listenner = new redisHelper();
        let messageChannel = stringUtility.format("__keyevent@{0}__:expired",this.listenner.getDbIndex());
        this.listenner.subscribe(messageChannel,OrderUtility.processOrderExpiredMessage);
    }
    /**
     * 退出订单过期的监听
     */
    static unRegisterChannel(){
        if(this.listenner){
            let messageChannel = stringUtility.format("__keyevent@{0}__:expired",this.listenner.getDbIndex());
            this.listenner.quit(messageChannel);
        }
    }
    /*
    *   清除团购链在Redis中的key
    * */
    static clearGroupOrderKey(param){
        let redisGroupKey = stringUtility.format(redisKey.GROUP_LINK_KEY,param.appid,param.groupid);
        _redis.delete(redisGroupKey);
    }
    /**
     * 设置存储在redis中的团购,监听过期
     * @param {*} param 
     */
    static setGroupOrderKey(param){
        console.log('set grouporder key expired',param);
        let redisGroupKey = stringUtility.format(redisKey.GROUP_LINK_KEY,param.appid,param.groupid);
        _redis.set(redisGroupKey,JSON.stringify(param),param.expire);
    }

    /**
     * 设置订单的过期,redis一旦过期进行回调消除订单
     * @param {*} param 
     */
    static setOrderExpiredKey(param){
        console.log('set order expired time',param);
        let redisOrderKey = stringUtility.format(redisKey.ORDER_EXPIRE_KEY,param.appid,param.orderid);
        _redis.set(redisOrderKey,JSON.stringify(param),param.expire);
    }
    /**
     * 清除订单的过期键值
     * @param {*} param 
     */
    static clearOrderExpiredKey(param){
        console.log('clear order expired key');
        let redisOrderKey = stringUtility.format(redisKey.ORDER_EXPIRE_KEY,param.appid,param.orderid);
        _redis.delete(redisOrderKey);
    }
    /*
    * 订单支付成功后，推送消息给用户
    * msgkey:消息对应的key
    *   -->type: 消息的类型(1 ：小程序  2：SMS短信)
    * targets: 消息发送的目标
    * params:消息发送的参数体
    */
    static pushMessage(appid,orderinfo) {
        return new Promise(function (resolve){
            co(function*(){
                //发送短消息给管理员
                if (orderinfo.notifymobile && orderinfo.notifymobile.length>0){
                    messageUtility.sendMessage(appid,2,constMessage.SMS_MESSAGE.ordernotifyadmin, orderinfo.notifymobile,[orderinfo.paytotal]);
                }
                ///如果订单时团购，推送成团消息给成员
                if (orderinfo.ordertype==2  && orderinfo.groupusers && orderinfo.groupusers.length>0){
                    ////拼团成功了，发送拼团成功的消息
                    if (orderinfo.groupsuccess==1){
                            //成功后，删除Redis中此团购链的键
                            //_redis.delete(redisGroupKey);
                            OrderUtility.clearGroupOrderKey({appid:appid,groupid:orderinfo.groupid});
                            ////发送拼团成功的消息
                            messageUtility.sendMessage(appid,1,
                                            constMessage.MINI_MESSAGE.group_success, 
                                            orderinfo.groupusers,
                                            {
                                                keyword1:{value:orderinfo.productname},
                                                keyword2:{value: moment().format('YYYY年MM月DD日 h:mm')},
                                                keyword3:{value:orderinfo.groupusernames},
                                                keyword4:{value:'拼团成功啦,订单请到我的-订单中查看'},
                                            },
                                            'pages/index/index');
                            
                    }
                    else{
                        ////创建团购的过期键值，等待过期通知
                        OrderUtility.setGroupOrderKey({appid:appid,groupid:orderinfo.groupid,expire:orderinfo.groupendsec});
                        let buyCount = orderinfo.groupusers.split(',').length;
                        let remainUser = orderinfo.groupmax -buyCount;

                        let hintMsg = '您发起了商品拼团,快分享您的团购给好友,祝您早日成团!' 
                        if (buyCount>1) hintMsg = stringUtility.format('有兄弟加入团购了,当前团购还差{0}',remainUser)
                        messageUtility.sendMessage(appid,1,
                            constMessage.MINI_MESSAGE.group_progress, 
                            orderinfo.groupusers,
                            {
                                keyword1:{value:orderinfo.productname},
                                keyword2:{value:orderinfo.groupmax},
                                keyword3:{value:orderinfo.groupusernames},
                                keyword4:{value:hintMsg},
                            },
                            'pages/index/index');
                        
                    }
                }
                resolve({successed:true});
            })
        });
    }

    /**
     * 退款整个团购链上的所有参与者订单
     * @param {*} param 
     */
    static RefundGroupLink(param){
        return new Promise((reslove,reject)=>{
            co(function*(){
                let orderInstance = new orderDao();
                let refundOrderResult = yield orderInstance.getGroupOrders2Refund({groupid:param.groupid})
                if (refundOrderResult.successed==true){
                        let grouporders = refundOrderResult.orders;
                        let refundApi   = new WechatPay(param.appid);
                        for(var nIndex = 0;nIndex<grouporders.length;nIndex++){
                            let element = grouporders[nIndex];
                            console.log('element.trade_no:', element.trade_no);
                            ////如果是微信支付，则需要调用微信的退款
                            if (element.pay_type==0 && element.total_fee>0)   {
                                var ret = yield refundApi.refundOrder(
                                    Math.round(element.total_fee * 100),       ////订单用户支付的费用
                                    Math.round(element.total_fee * 100),       ////需要退款的具体费用
                                    element.trade_no,                          ////原订单的编号
                                    'R-'+new Date().getTime(),                 ////生成一个退款单编号
                                    param.appid,               ////操作者id
                                    OrderUtility.refundOrder                   ////退款结束的处理
                                );
                            }
                            else{    ////用户是余额支付的，则退回到用户的余额钱包
                                OrderUtility.refundOrder(null,null,{appid:param.appid,tradeno:element.trade_no,refundno:element.trade_no})
                            }
                        }
                        return reslove({successed:true})
                }
                reject({successed:false});
            })
        })
    }


    /**
     * 当接收到团购订单过期的redis通知时，处理团购链的失败消息
    /* 处理过期的订单消息
     * @param {*} orderMessage 
     */
    static processOrderExpiredMessage(orderMessage){
        let param = orderMessage.split(':');
        ///key:grouporder:{0}:{1}"
        if (param[1]==="grouporder"){
           ////获取该订单下的商户是如何定义团购失败的模式
           ////是自动失败还是手动的，如果自动的则在此处理
           console.log('接收到团购链拼团失败的过期通知:',orderMessage)
           co(function*(){
                let appid = param[2];
                let setting =yield _redis.hmget(stringUtility.format(redisKey.SYSTEMSETTNG,appid));
                ////如果该商户的全局设置中配置了团购失败自动退款，则执行退款操作
                if (setting && setting.grouporderrefund==0){
                    OrderUtility.RefundGroupLink({groupid:param[3],appid: param[2],userid: param[2]})         
                }
           })
        }
        ////key:order:{0}:{1}"
        else if(param[1]==="order"){

            console.log('接收到订单支付过期的消息了',orderMessage);
            let orderInstance =  new orderDao();
            orderInstance.cancelOrder({id:param[3]});
        }

    }
    /**
     * 订单发起微信退款后的回调
     * @param {*} err 
     * @param {*} message 
     * @param {*} data 
     */
    static refundOrder(err,message,data){
        ////微信退款成功
        if (err==null){
            let orderInstance =  new orderDao();
            co(orderInstance.refundOrder(data))
            .then(result=>{
                messageUtility.sendMessage(data.appid,2,constMessage.MINI_MESSAGE.group_failed,result.userid,{
                    keyword1:{value:result.productname},
                    keyword2:{value:'拼团失败,订单金额已原路退回'},
                    keyword3:{value:'限定的时间内没有成团'},
                });
                ////send message to user
            })
        }
    }

    /******************以下为平台订单支付方法 **********************/
    /**
     * 支付订单
     */
    static *payOrder(param){
        // orderinfo.successed = orderinfo.result==0;
        ////如果订单的状态为未支付
        if (params.orderstatus==0 ) {
            ///订单设置了支付自动过期
            if(param.type==1 && param.expireminute>0)
                orderUtility.setOrderExpiredKey({
                        appid:param.appid,
                        orderid:orderinfo.orderid,
                        expire:orderinfo.expireminute*60
                        }
                );
            let payResult = yield paymentUtility.wechatPay(param)
            if (payResult.successed===true)
                return Object.assign({},param,payResult);
            return payResult;
        }
        else{
            ////TODO:如果订单免于支付,则需要根据最后的信息推送消息给相关用户
            orderUtility.pushMessage(param.appid,orderinfo);
            return param;
        }
    }
}
exports = module.exports=OrderUtility;