/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co                  = require('co');
var walletDao           = require('../../../model/api/redbag/wallet');
var controllerBase      = require('../../../core/controllerBase');
var wxPay               = require('../../../core/wechatapi/WechatPay');
var messageUtility      = require('../../../core/utilities/messageUtility');
var constMessage        = require('../../../model/messagekey');
class WalletController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new walletDao());
    }
    /*
    * 初始化控制器中的路由
    * 以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
    * 根据实际情况可以继续添加其他路由，或删除现有路由
    */
    initializeRouter(instance) {
        let self = instance;
        /**
         * 获取用户的钱包流水记录清单
         */
        this._router.get('/wallet', function (req, res) {
            let param = {userid:req.user.authorization,page:req.query.page || 1,rows:req.query.rows||20}
            co(instance._daoModel.list(param))
            .then(result=>res.json(result))
            .catch(result=>res.json(result))
        });
        

         //用户发起申请余额提现  
         this._router.post('/wallet/withdraw', function (req, res) {
            ///没有传提现的金额
            if (!req.body.money || req.body.money<1){
                return res.json({successed:false,errcode:100,errmsg:'缺失提现金额或提现金额不足1元'});
            }
            let realmoney =parseFloat(req.body.money).toFixed(2);
            var param = {
                    userid: req.user.authorization,
                    money:realmoney || 0,
                    openid:req.body.openid || req.user.authorization
                };
            co(instance._daoModel.withDraw(param))
                .then(result =>{
                        co(function*(){
                            ///通过微信的企业账号转账
                            if(result.successed===true){
                                let payApi =  new wxPay(req.user.appid);
                                var transferResult = yield payApi.transferMoneyToUser(param.openid,result.orderno,Math.floor(param.money*100));
                                var statusInfo = {
                                    orderno:transferResult.orderno,
                                    status:transferResult.successed==true?1:0,
                                    code:transferResult.errorcode
                                }
                                instance._daoModel.withDrawOver(statusInfo);

                                ///转账成功发送微信模板消息给用户
                                if(transferResult.successed){
                                    messageUtility.sendMessage(req.user.appid,1,
                                        constMessage.MINI_MESSAGE.transfer, 
                                        req.user.authorization,
                                        {
                                            keyword1:{value:realmoney},
                                            keyword2:{value:'微信零钱'},
                                            keyword3:{value:'红包金额已提现至您的微信零钱'}
                                        },
                                        'pages/index/index');
                                }
                                return res.json({successed:statusInfo.status==1,errorcode:statusInfo.status,orderid:result.orderid,orderno:result.orderno});
                            }
                            return res.json(result);
                        })
                    }
                )
                .catch(result =>res.json(result))
        });
    }


}
exports = module.exports = WalletController;