/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co                  = require('co');
var moment              = require('moment');
var redbagDao           = require('../../../model/api/redbag/redbag');
var controllerBase      = require('../../../core/controllerBase');
var utility             = require('../../../core/utilities/utilities');
var uuid                = require('node-uuid');
var wxPay               = require('../../../core/wechatapi/WechatPay');
var redisHelper         = require('../../../core/utilities/redisUtility');
//var wxPublic            = require('../../../core/wechatapi/PublicApi');
var redbagUtility       = require('../utility/redbagUtility');
//var rpc                 = require('../../../core/rpc/rpcUtility');
var messageUtility      = require('../../../core/utilities/messageUtility');
var constMessage        = require('../../../model/messagekey');
const MIN_RED_AMOUNT    = 1;
class RedBagController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        let dao = new redbagDao();
        super(application, dao);
        this._redBagHelper = new redbagUtility(dao);
    }
    /*
    * 初始化控制器中的路由
    * 以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
    * 根据实际情况可以继续添加其他路由，或删除现有路由
    */
    initializeRouter(instance) {
        let self = instance;
        /**
         * 获取广场中的红包
         */
        this._router.get('/', function (req, res) {
            // co(function*(){
            //     let redinfos = yield self._redBagHelper.getUserRedbags(req.user.authorization);
            //     let result = yield self._daoModel.redpacketInPublic(redinfos.join(','));
            //     return res.json(result);
            // })
            co(self._daoModel.redpacketInPublic(req.user.authorization))
                .then(result=>res.json(result))
                .catch(result=>res.json(result))
         });
         ///获取背景封面或音乐
         this._router.get('/background', function (req, res) {
            co(self._daoModel.getBackground(req.query.type || 0))
                .then(result=>res.json(result))
                .catch(result=>res.json(result))
         });
         /**
          * 记录引流跳转
          */
         this._router.post('/:id/diversion', function (req, res) {
             let param = {appid:req.body.appid,userid:req.user.authorization,id:req.params.id};
              self._daoModel.diversion(param);
              return res.json({successed:true})
         })
         /**
         * 用户抢红包
         */
        this._router.post('/:id/grab', function (req, res) {
           co(function*(){
                let result =yield self._redBagHelper.grabRedBag(req.params.id,req.query.groupid,req.user.authorization);
                if (result.successed==true && result.errcode==0){
                    ///TODO :推送消息给用户，中奖通知
                   
                    ////直接开模式的红包消息推送
                    if (!result.groupid){
                        messageUtility.sendMessage(req.user.appid,1,
                        constMessage.MINI_MESSAGE.bingo, 
                        req.user.authorization,
                        {
                            keyword1:{value:result.topic},
                            keyword2:{value:moment().format('YYYY年MM月DD日 h:mm')},
                            keyword3:{value:result.money.toFixed(2)},
                            keyword4:{value:`恭喜您抢到${result.money}元红包`},
                        },
                        'pages/index/index?id='+req.params.id);
                    }
                    else{
                       
                        if (result.groupinfo.user.length>0){
                            let selfmessage = `恭喜您抢到${result.money}元红包`;
                            let notselfmessage = `新成员${result.groupinfo.user[result.groupinfo.current-1].nickName}参与了拼红包`;
                            let suffixMessage = result.groupsuccess==true?',活动邀请数量已达成,您的红包已转入您的余额。':(`,还差${result.groupcount-result.groupinfo.current}人即可获得红包,赶紧再去邀请吧`);
                            for(var iUser =0 ;iUser<result.groupinfo.user.length;iUser++){
                                let user = result.groupinfo.user[iUser];
                                console.log('user id result',user.userid);
                                messageUtility.sendMessage(req.user.appid,1,
                                    constMessage.MINI_MESSAGE.bingo, 
                                    user.userid,
                                    {
                                        keyword1:{value:result.topic},
                                        keyword2:{value:moment().format('YYYY年MM月DD日 h:mm')},
                                        keyword3:{value:parseFloat(user.money).toFixed(2)},
                                        keyword4:{value:(user.userid==req.user.authorization?selfmessage:notselfmessage)+suffixMessage},
                                    },
                                    'pages/index/index?id='+req.params.id);

                            }
                        }
                        
                    }
                }
                return res.json(result)
           })
        });
        /**
        * 进入红包活动页面，展示红包活动详情
        */
       this._router.get('/:id/play', function (req, res) {
            co(function*(){
                let activityResult =yield self._redBagHelper.redBagIsValid(req.params.id);
                ////红包数据没有发现,或者红包主尚未支付红包金额
                
                ////红包活动可以玩
                ////如果红包活动需要关注一个公众号，则返回到前端一个requestUrl,让前端请求一个
                ///这个公众号，获取到用户在这个公众号下的openid
                if(activityResult.valid==true){
                    ///检查用户是否有参与过
                    let joinResult = yield self._redBagHelper.userHasbeenPlayed(req.params.id,req.user.authorization,activityResult.groupcount);
                    //activityResult.userjoin = joinResult;
                    activityResult = Object.assign({},activityResult,{
                        groupid:joinResult.groupid,
                        groupsuccess:joinResult.groupsuccess,
                        groupinfo:joinResult.groupinfo,
                        money:joinResult.money, 
                        played:joinResult.played
                    })
                     ///获取到当前红包活动所有获奖的用户
                     activityResult.allocedusers = yield  self._redBagHelper.getAllocedUser(req.params.id);
                    ////用户已经参与过了
                    if (joinResult.played===true){
                        ///如果已经参与,check是否需要有小程序跳转
                        if (activityResult.follow=="1" && activityResult.appid && activityResult.appinfo && activityResult.appinfo.appType==1){
                            activityResult.navigateMini = {
                                appid:activityResult.appid,
                                appname:activityResult.appinfo.appName,
                                path:activityResult.appinfo.appPath,
                                param:activityResult.appinfo.appParam?JSON.parse(activityResult.appinfo.appParam):null
                            }
                        }
                        return res.json({successed:true,...activityResult});
                    }
                     ///红包全部被抢光了
                    if (activityResult.isover==1)  {
                        activityResult.errcode =-1;
                        activityResult.errmsg ="红包已经被抢光了";
                        return res.json({successed:true,...activityResult});
                    }
                }
                /**
                 * 红包是否需要关注公众号或跳转小程序
                 */
                if (activityResult.errcode!=100){
                    if (activityResult.follow=="1" && activityResult.appid && activityResult.appinfo && activityResult.appinfo.appType==0){
                        activityResult.requesturl = `https://red.doomisoft.com/wechatauth/index.html?appid=${activityResult.appid}&userid=${req.user.authorization}`;
                    }
                }
                return res.json({successed:true,...activityResult});
               
            })
        });
         /**
         * 获取某个活动的汇总的数据
         */
        this._router.get('/:id/allocinfo', function (req, res) {
            let param = {
                         id:req.params.id,
                         type:req.query.type || 0,
                         page:req.query.page || 1,
                         rows:req.query.rows||20}
            co(instance._daoModel.getAllocInfo(param))
                .then(result=>res.json(result))
                .catch(result=>res.json(result))
        });
        /**
         * 获取某个活动下所有获奖的用户
         */
        this._router.get('/:id/bonususer', function (req, res) {
            co(function*(){
                let allocUsers =yield self._redBagHelper.getAllocedUser(req.params.id);
                return res.json({successed:true,allocedusers:allocUsers});
            })
        });

        /**
        * 生成红包海报时，需要获取的红包活动信息
        */
       this._router.get('/:id/poster', function (req, res) {
        co(function*(){
            let redbaginfo = yield self._redBagHelper.getRedBagInfo(req.params.id);
            console.log('poster',redbaginfo);
            ////红包数据没有发现,或者红包不是当前请求者创建的
            if (!redbaginfo || redbaginfo.status!=1 || redbaginfo.userid!=req.user.authorization) return res.json({success:false,errcode:-1,errmsg:'该红包活动不存在'});
            return res.json({successed:true,...redbaginfo});
        })
        });
        /**
        * 进入红包活动编辑，展示红包活动详情
        */
        this._router.get('/:id/edit', function (req, res) {
            co(function*(){
                let redbaginfo = this._redBagHelper.getRedBagInfo(req.params.id);
                ////红包数据没有发现,或者红包不是当前请求者创建的
                if (!redbaginfo || redbaginfo.userid!=req.user.authorization) return res.json({success:false,errmsg:'该红包活动不存在'});
                return res.json({successed:true,...redbaginfo});
            })
        });
        
        /**
         * 创建红包活动的接口
        //  */
        // this._router.post('/download', function (req, res) {
        //     ///小程序调用的接口直接调用微信支付
        //     co(function*(){
        //         let result = yield self._redBagHelper.testDownloadFile(req.body.url);
        //         return res.json(result);
        //     })
        // });
        /**
         * 创建红包活动的接口
         */
        this._router.post('/', function (req, res) {
            let param = Object.assign({},req.body,{paynow:1,userid:req.user.authorization})
            if (param.total<=0) return res.json({successed:false,errcode:10001,errmsg:"红包数量不能为0"})
            if (param.amount>200||param.amount<1 ) return res.json({successed:false,errcode:10003,errmsg:"红包金额[1.00~200.00]"})
            ///如果是裂变红包，则开启分享
            if (param.playtype==1 || param.public==1) param.share = 1;
            //如果分配是普通红包
            // if (param.alloctype==1) param.amount = (param.amount * param.total).toFixed(2);

            if (100*param.amount/param.total<MIN_RED_AMOUNT) return res.json({successed:false,errcode:10002,errmsg:"红包金额不足"})

            ///小程序调用的接口直接调用微信支付
            co(function*(){
                let result = yield self._redBagHelper.createRedBag(param);
                if (result.successed==true) {
                    return res.json(result);
                }
                return res.json({successed:false,errmsg:'创建红包失败'});
            })
        });


        /**
         * 前端支付时取消了支付，发送消息提醒用户支付
         */
        this._router.post('/:id/cancelpay', function (req, res) {
            ///小程序调用的接口直接调用微信支付
            co(self._redBagHelper.getRedBagInfo(req.params.id))
                .then(result=>{
                    console.log('result',result);
                    messageUtility.sendMessage(req.user.appid,1,
                        constMessage.MINI_MESSAGE.waitpay, 
                        req.user.authorization,
                        {
                            keyword1:{value:parseFloat(result.amount).toFixed(2)},
                            keyword2:{value:`您创建的『${result.topic}』主题红包还未塞钱进红包,赶紧去塞钱发红包喽`}
                        },
                        'pages/record/record');
                })
            return res.json({successed:true})
        });

        /**
         * 用户发起了撤回红包
         */
        this._router.post('/:id/rollback', function (req, res) {
            ///小程序调用的接口直接调用微信支付
            let param = {id:req.params.id,userid:req.user.authorization};
            co(self._redBagHelper.rollback(param))
                .then(result=>{
                    ///撤回成功，清理掉红包活动占用的redis数据
                    if (result.successed==true){
                        self._redBagHelper.clearRedBagCache(req.params.id);
                    }
                    // if (result.successed==true){
                    //     messageUtility.sendMessage(req.user.appid,1,
                    //         constMessage.MINI_MESSAGE.waitpay, 
                    //         req.user.authorization,
                    //         {
                    //             keyword1:{value:result.amount.toFixed(2)},
                    //             keyword2:{value:`您创建的『${result.topic}』主题红包还未塞钱进红包,赶紧去塞钱发红包喽`}
                    //         },
                    //         'pages/record/record');
                    // }
                    return res.json({successed:true})
                })
                .catch(result=>res.json(result))
            
        });
        /**
         * 对红包活动发起支付
         */
        this._router.post('/:id/pay', function (req, res) {
            let param = {id:req.params.id,userid:req.user.authorization};
            co(function*(){
                let result = yield self._redBagHelper.payRedBag(param);
                if (result.successed==true) return res.json(result);
                return res.json({successed:false,errmsg:'支付红包失败'});
            })
        });
        /**
         * 
         */
        this._router.use('/callback', function (req, res) {
                co(function* () {
                    //返回来的XML数据，现在是以express4.X的返回数据为例子，实际中要以实际数据进行解析
                    let wxApi = new wxPay();
                    let callbackData =yield wxApi.responsePayCallBack(req);
                    //回调成功，更改订单状态
                    if (callbackData.successed===true){
                        ///根据订单编号获得订单类型
                        let redid = callbackData.attach;
                        let qrresult = yield self._redBagHelper.gererateRedbagQr(redid);
                        var params ={orderno:callbackData.orderno,qrcode:qrresult.qrcode};// {orderno:callbackData.orderno};
                        var payResult =  yield self._daoModel.payedOver(params);
                        if (payResult.successed===true){
                            ////修改红包活动的属性
                            let baginfo = yield self._redBagHelper.getRedBagInfo(payResult.redid);
                            baginfo.status = 1;
                            baginfo.qrcode = qrresult.qrcode;
                            self._redBagHelper.storeRedbag(payResult.redid,baginfo);
                            let allocResult = yield self._redBagHelper.allocRedbag(payResult.redid,payResult.amount,payResult.total,payResult.alloctype,payResult.minimal,payResult.maximum);
                            ///如果红包活动已产生，则需要将分配的结果放置到redis中
                            //let redisResult = yield self._redisHelper.batchList(REDBAG_ALLOC_LIST+payResult.redid,payResult.alloc)
                        }
                    }
                    return res.send(callbackData.xml);
                })
            });
    }


}
exports = module.exports = RedBagController;