/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co                  = require('co');
var orderDao            = require('../../../model/api/mall/order');
var controllerBase      = require('../../../core/controllerBase');
var utility             = require('../../../core/utilities/utilities');
var logisticsUtility    = require('../utility/logisticsUtility');
var orderUtility        = require('../utility/orderUtility');
var uuid                = require('node-uuid');
var WechatPay           = require('../../../core/wechatapi/WechatPay');
class OrderController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new orderDao());
    }
    /*
    * 初始化控制器中的路由
    * 以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
    * 根据实际情况可以继续添加其他路由，或删除现有路由
    */
    initializeRouter(instance) {
        ///以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
        ///根据实际情况可以继续添加其他路由，或删除现有路由
        //#处理获取实体列表的路由函数
        var _self = instance;
        
        ///获取团购进度信息
        this._router.get('/group/:id', function (req, res) {
            var params = {userid:req.user.authorization, groupid:req.params.id,recommend:req.query.recommend || 0};
            co(instance._daoModel.getGroupBuyProgress(params))
                .then(result => res.json(result))
                .catch(result => res.json(result))
        });
        ////获取用户所有的订单
        this._router.get('/order', function (req, res) {
            var userid = req.user.authorization
            var params = {
                appid:req.user.appid,
                userid:req.user.authorization,
                page:req.query.page || 1,
                rows:req.query.rows || 20,
                status:req.query.status || -1,
            }
            co(instance._daoModel.getUserOrders(params))
                .then(result => res.json(result))
                .catch(result => res.json(result))
        });
        //物流详情
        this._router.get('/orderlogistics/:id', function (req, res) {
            var params = {
                id: req.params.id,
                userid:req.user.authorization
            }
            co(instance._daoModel.logisticsDetail(params.id))
                .then(result => {
                    co(function*(){
                        let dataInfo = result.data;
                        if (dataInfo) {
                            let loginfo = yield logisticsUtility.query({logno:dataInfo.logno,type:dataInfo.code});
                            if (loginfo.successed==true) {
                                result.loginfo = loginfo.info;
                                ////  签收订单
                                if ( loginfo.info.issign==1) instance._daoModel.confirmSignIn(dataInfo.logno);
                            }
                        }
                        return res.json(result);
                    })
                }
                )
                .catch(result => res.json(result))
        });
        this._router.get('/order/:id', function (req, res) {
            var params = {
                appid:req.user.appid,
                id: req.params.id,
                userid:req.user.authorization,
                recommend:req.query.recommend || 0,
            }
            co(instance._daoModel.getOrderDetail(params))
                .then(result => res.json(result))
                .catch(result => res.json(result))
        });
        ////用户确认收货
        this._router.post('/order/:id/receive', function (req, res) {
            var params = {
                id: req.params.id,
                userid:req.user.authorization,
            }
            co(instance._daoModel.receiveOrder(params))
                .then(result => res.json(result))
                .catch(result => res.json(result))
        });

         ////用户申请退款
         this._router.post('/order/:id/refund', function (req, res) {
            var params = {
                appid:req.user.appid,
                id: req.params.id,
                userid:req.user.authorization,
            }
            co(instance._daoModel.refundOrder(params))
            .then(result => {
                ///订单可以退款
                co(function*(){
                    if (result.successed===true){
                        ///如果支付方式是通过微信支付的，则需要调用商户功能退款到用户零钱
                        if(result.paytype==0 && result.refundtotal>0){
                            let refundApi   = new WechatPay(params.appid);
                            ////如果是微信支付，则需要调用微信的退款
                            var ret = yield refundApi.refundOrder(
                                Math.round(result.refundtotal * 100),       ////订单用户支付的费用
                                Math.round(result.refundtotal * 100),       ////需要退款的具体费用
                                result.txno,                                ////原订单的交易流水号
                                result.refundno,                            ////退款交易流水
                                params.appid,                                ////操作者id
                                null
                                //OrderUtility.refundOrder                   ////退款结束的处理
                            );
                            console.log('ret:%j', ret);
                        }
                    } 
                    res.json(result)
                })
                
            })
            .catch(result => res.json(result))
        });
        
        ////预创建订单，当用户从商品详情或购物车点击买单
        this._router.post('/order/prepare', function (req, res) {
            var params = Object.assign({}, req.body, {
                    appid :req.user.appid,
                    userid: req.user.authorization
                })
            co(instance._daoModel.prepareOrder(params))
                .then(result => res.json(result))
                .catch(result => res.json(result))
        });
       
        // ///重新发起订单支付
        // this._router.post('/order/:id/pay', function (req, res) {
        //     var params = {
        //         id: req.params.id,
        //         userid: req.user.authorization
        //     }
        //     co(instance._daoModel.cancelOrder
        //         (params))
        //         .then(result => res.json(result))
        //         .catch(result => res.json(result))
        // });





        this._router.post('/order/:id/cancel', function (req, res) {
            var params = {
                id: req.params.id,
                userid: req.user.authorization
            }
            co(instance._daoModel.cancelOrder(params))
                .then(result => {
                    orderUtility.clearOrderExpiredKey({appid:req.user.appid,id:req.params.id});
                    res.json(result)
                })
                .catch(result => res.json(result))
        });

        /**
         * 发起订单支付
         */
        this._router.post('/order', function (req, res) {
            var params = Object.assign({}, req.body, {
                    type    :   1,
                    appid   :   req.user.appid,
                    userid  :   req.user.authorization
                })
            co(instance._daoModel.createOrder(params))
                .then(result => {
                    co(function*(){
                        result.successed=result.result ==0;
                        if(result.result==0){
                            let payResult = orderUtility.payOrder(result);
                        }
                        res.json(payResult)
                    })
                })
                .catch(result => res.json(result))
        });

        this._router.delete('/order/:id', function (req, res) {
            var params = {
                id: req.params.id,
                userid: req.user.authorization
            }
            co(instance._daoModel.deleteUserOrder(params))
                .then(result => res.json(result))
                .catch(result => res.json(result))
        });
    }
}
exports = module.exports = OrderController;