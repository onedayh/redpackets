/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co                  = require('co');
var membershipDao       = require('../../../model/api/member/membership');
var controllerBase      = require('../../../core/controllerBase');
var utility             = require('../../../core/utilities/utilities');
var uuid                = require('node-uuid');
var redisHelper         = require('../../../core/utilities/redisUtility');
var rediskey            = require('../../../model/rediskey');
class MemberController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new membershipDao());
        this._redisHelper = new redisHelper();
    }
    /*
    * 初始化控制器中的路由
    * 以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
    * 根据实际情况可以继续添加其他路由，或删除现有路由
    */
    initializeRouter(instance) {
        let _self = instance;
        ///获取用户我的页面数据
        this._router.get('/profile', function (req, res) {
            co(instance._daoModel.getProfileData(req.user.authorization))
                .then(result => res.json(result))
                .catch(result => res.json(result));
            });
        /**
         * 获取用户的钱包余额
         */
        this._router.get('/balance', function (req, res) {
            co(instance._daoModel.getUserBalance(req.user.authorization))
                .then(result=>{
                    co(function*(){
                        ////获取最低的余额提现金额
                        let setting =yield _self._redisHelper.hget(rediskey.SYSTEMSETTNG,req.user.appid);
                        if (setting) 
                            result.min_withdraw = JSON.parse(setting).withdraw || 1;
                        else
                            result.min_withdraw = 1;
                        return res.json(result)
                    })
                    
                })
                .catch(result=>res.json(result))
        })
        /**
         * 获取用户的红包汇总信息
         * type = 0 : 发出的红包汇总
         * type = 1 : 抢到的红包汇总
         */
        this._router.get('/redbagtotal', function (req, res) {
            let param = {userid:req.user.authorization,type:req.query.type || 0}
            co(instance._daoModel.userTotalRedbag(param))
                .then(result=>res.json(result))
                .catch(result=>res.json(result))
        })
        /**
         * 获取用户抢到的红包记录
         */
        this._router.get('/grabbed', function (req, res) {
            co(instance._daoModel.userGrabbed({
                    userid:req.user.authorization,
                    page:req.query.page || 1,
                    rows:req.query.rows || 20,
                }))
                .then(result=>{
                    return res.json(result)
                })
                .catch(result=>res.json(result))
        })
        /**
         * 获取用户发出的红包记录
         */
        this._router.get('/ownerredbag', function (req, res) {
            co(instance._daoModel.getOwnerByUser({
                    userid:req.user.authorization,
                    page:req.query.page || 1,
                    rows:req.query.rows || 20,
                }))
                .then(result=>{
                    return res.json(result)
                })
                .catch(result=>res.json(result))
        })
        
    }
}
exports = module.exports = MemberController;