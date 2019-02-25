/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
* 所有订单分销收益的接口
* 提现、查看收益流水
*/
var co              = require('co');
var rebateDao       = require('../../../model/api/rebate/rebate');
var controllerBase  = require('../../../core/controllerBase');
var utility         = require('../../../core/utilities/utilities');
var uuid            = require('node-uuid');
var wxPay           = require('../../../core/wechatapi/WechatPay');
class RebateController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new rebateDao());
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
        // this._router.get('/department', function (req, res) {
        //     co(instance.getListData(req, "department"))
        //         .then(result =>instance.responseResult(req,res,result))
        //         .catch(result => { console.log(result); instance.responseResult(req,res,result); })
        // });
         ////获取用户的余额流水清单
         this._router.get('/', function (req, res) {
            var params = {
                appid:req.user.appid,
                userid: req.user.authorization};
            co(instance._daoModel.getRebateInfo(params))
                .then(result => res.json(result))
                .catch(result => res.json({successed:false}))
        })
        ///获得用户的收益金流水明细
        this._router.get('/list', function (req, res) {
            var params = {
                page: req.query.page || 1,
                rows: req.query.rows || 20,
                userid: req.user.authorization
                }
            co(instance._daoModel.userRebate(params))
                .then(result => res.json(result))
                .catch(result => res.json(result))
        });

         //用户发起申请余额提现  
         this._router.post('/withdraw', function (req, res) {
            ///没有传提现的金额
            if (req.body.money==null || req.body.money<1){
                return res.json({successed:false,result:100,msg:'missing money'});
            }
            var param = {
                    userid: req.user.authorization,
                    money:req.body.money || 0,
                    appid:req.user.appid,
                    openid:req.body.openid || req.user.authorization
                };
            co(instance._daoModel.withDraw(param))
                .then(result =>{
                        co(function*(){
                            ///通过微信的企业账号转账
                            if(result.successed===true){
                                //var wechatTransfer = require('../../third_part/WechatTransfer');
                                let wxTransfer =  new wxPay(req.user.appid);
                                var transferResult = yield wxTransfer.transferMoneyToUser(param.appid,param.openid,result.orderno,Math.floor(param.money*100));
                                var statusInfo = {
                                    orderno:transferResult.orderno,
                                    status:transferResult.successed==true?1:0,
                                    code:transferResult.errorcode
                                }
                                instance._daoModel.withDrawOver(statusInfo);
                                return res.json({successed:statusInfo.status==1,errorcode:statusInfo.status,orderid:result.orderid,orderno:result.orderno});
                            }
                            return res.json(retData);
                        })
                    }
                )
                .catch(result =>res.json(result))
        });
    }
}
exports = module.exports = RebateController;