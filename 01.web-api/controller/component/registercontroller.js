/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co              = require('co');
var controllerBase  = require('../../core/controllerBase');
var merchantDao     = require('../../model/mini/merchant');
var utility         = require('../../core/utilities/utilities');
var redisHelper     = require('../../core/utilities/redisUtility');
var redisKey        = require('../../model/rediskey');
var xmlUtil         = require('../../core/utilities/xmlUtility');
var componentApi    = require('../../core/wechatapi/ComponentApi');
var wechatapi       = require('../../core/wechatapi/WechatApi');
var stringUtil      = require('../../core/utilities/stringUtility');
var wxconfig        = require('../../core/wechatapi/wechatconfig');
class RegisterController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new merchantDao());
        this._redisHelper = new redisHelper();
    }
    /*
    * 初始化控制器中的路由
    * 以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
    * 根据实际情况可以继续添加其他路由，或删除现有路由
    */
    initializeRouter(instance) {
        var _self = instance;
        
        /**
        * 商户登录
        */
       this._router.post('/merchant/login', function (req, res) {
            let param = req.body;
            co(instance._daoModel.createMerchant(param))
                .then(result=> res.json(result))
                .catch(result=>res.json(result));
        });
        /**
        * 商户进来注册
        */
        this._router.post('/merchant/register', function (req, res) {
            let param = req.body;
            co(instance._daoModel.createMerchant(param))
                .then(result=> res.json(result))
                .catch(result=>res.json(result));
        });
       
        /**
         * 获取商户需要授权的url
         */
        this._router.get('/:id/authorizeurl', function (req, res) {
            co(function*(){
                ////获取平台的授权码
                let auth_code  =  yield _self._redisHelper.get(stringUtil.format(redisKey.COMPONENT_INFO.PRE_AUTH_CODE,wxconfig.thirdplatform.appid));
                if (auth_code){
                    let url = componentApi.getAuthorizeUrl(auth_code,req.params.id);
                    return res.json({successed:true,url:url})
                }
                return res.json({successed:false})
            })
        });

        /**
         * 获取引导用户跳转授权的url
         */
        this._router.get('/authorizeurl', function (req, res) {
            co(function*(){
                let auth_code  =  yield _self._redisHelper.get(stringUtil.format(redisKey.COMPONENT_INFO.PRE_AUTH_CODE,wxconfig.thirdplatform.appid));
                if (auth_code){
                    let url = componentApi.getAuthorizeUrl(auth_code);
                    return res.json({successed:true,url:url})
                }
                return res.json({successed:false})
            })
        });

        /**
         * 用户授权后跳转的页面
         */
        this._router.get('/authorized', function (req, res) {
            co(function*(){
                let access_token  =  yield _self._redisHelper.get(stringUtil.format(redisKey.COMPONENT_INFO.ACCESS_TOKEN,wxconfig.thirdplatform.appid));
                if (access_token){
                    let authorizeInfo = componentApi.queryAuthorizeInfo(access_token);
                    if (authorizeInfo.successed==true){
                        let html = '<html><body>'
                        + '<p>auth_code = ' + req.query.auth_code + '</p>'
                        + '<p>authorizer_appid = ' + authorizeInfo.appid + '</p>'
                        + '<p>access_token = ' + authorizeInfo.access_token + '</p>'
                        + '<p>refresh_token = ' + authorizeInfo.refresh_token + '</p>'
                        + '<p>func_info = ' + JSON.stringify(authorizeInfo.func_info) + '</p>'
                        + '<p>expires_in = ' + req.query.expires_in + '</p>'
                        + '</body></html>';
                        return res.send(html)
                    }
                }
                return res.send('failed')
            })
        });


    }
}
exports = module.exports = RegisterController;