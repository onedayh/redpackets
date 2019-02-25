/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co              = require('co');
var controllerBase  = require('../../core/controllerBase');
var utility         = require('../../core/utilities/utilities');
var redisHelper     = require('../../core/utilities/redisUtility');
var redisKey        = require('../../model/rediskey');
var xmlUtil         = require('../../core/utilities/xmlUtility');
var componentApi    = require('../../core/wechatapi/MiniComponentApi');
var wechatapi       = require('../../core/wechatapi/WechatApi');
var stringUtil      = require('../../core/utilities/stringUtility');
class ComponentController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, null);
        this._redisHelper = new redisHelper();
    }
    /*
    * 初始化控制器中的路由
    * 以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
    * 根据实际情况可以继续添加其他路由，或删除现有路由
    */
    initializeRouter(instance) {
        var _self = instance;
        //#微信第三方平台定时推送过来的ticket接收
        this._router.post('/notify', function (req, res) {
            let query       =  req.query;
            let bodyXml     =  req.body.xml;//// JSON.parse("{"+req.body.xml+"}");//yield  wechatapi.toJSON(req.body.xml);
            componentApi.handleComponentMessage(bodyXml,query);
            res.send('successed');
        });
       
        //#获取详细记录的路由配置
        this._router.get('/listener', function (req, res) {
            co(function*(){
                let data =  {
                    access_token: yield componentApi.getComponentAccess(),
                }
                return res.json(data)
            })
        });

        /**
         * 获取引导用户跳转授权的url
         */
        this._router.get('/authorizeurl', function (req, res) {
            co(function*(){
                ////授权码每次请求此接口都需要刷新
                let preauthcode =   yield componentApi.getComponentAuthCode();
                if (preauthcode.successed==true){
                    let url = componentApi.getAuthorizeUrl(preauthcode.auth_code,req.query.merchantid,req.query.applicationid);
                    return res.json({successed:true,url:url})
                }
                return res.json({successed:false})
            })
        });

        /**
         * 用户授权后跳转的页面
         */
        this._router.get('/authorized/:mid/:appid', function (req, res) {
            co(function*(){
                console.log('merchantid:',req.params.mid);
                console.log('applicationid:',req.params.appid);
                let auth_code = req.query.auth_code;
                let access_token  =  yield _self._redisHelper.get(stringUtil.format(redisKey.COMPONENT_INFO.ACCESS_TOKEN,wxconfig.thirdplatform.appid));
                console.log('accesstoken :',access_token);
                console.log('auth_code :',auth_code);
                if (access_token && auth_code){
                    let authorizeInfo = yield componentApi.queryAuthorizeInfo(access_token,auth_code);
                    console.log('authorizeInfo',authorizeInfo);
                    if (authorizeInfo.successed==true){
                        let html = '<html><body>'
                        + '<p>auth_code = ' + req.query.auth_code + '</p>'
                        + '<p>authorizer_appid = ' + authorizeInfo.appid + '</p>'
                        + '<p>access_token = ' + authorizeInfo.access_token + '</p>'
                        + '<p>refresh_token = ' + authorizeInfo.refresh_token + '</p>'
                        + '<p>func_info = ' + JSON.stringify(authorizeInfo.func_info) + '</p>'
                        + '<p>expires_in = ' + req.query.expires_in + '</p>'
                        + '</body></html>';
                        ////TODO : write info to merchant_relation表
                        return res.send(html)
                    }
                }
                return res.send('failed')
            })
        });


    }
}
exports = module.exports = ComponentController;