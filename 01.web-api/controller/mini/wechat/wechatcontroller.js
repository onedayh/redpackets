/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co                  = require('co');
var moment              = require('moment');
var rediskey            = require('../../../model/rediskey');
var controllerBase      = require('../../../core/controllerBase');
var publicApi           = require('../../../core/wechatapi/PublicApi');
//var redisHelper         = require('../../../core/utilities/redisUtility');
var userCache          = require('../utility/usercache');
var bodyParser          = require('body-parser');
var qs                  = require('qs');

require('body-parser-xml')(bodyParser);


class WechatController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, null);
        this._usercache = new userCache();
        //this._redisHelper =new redisHelper();
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
        /*
        /* Web 授权后的回调
        */
       /**
         * 用户授权后跳转的页面
         */
        this._router.get('/web/authorized', function (req, res) {
            co(function*(){
                let param = qs.parse(req.query);
                console.log('hello ,I am here authorized',param);
                let pubApi = new publicApi(param.appid);
                ////获得这个公众号下当前用户的accesstoken和openid
                let userResult =yield pubApi.getAuthorizationToken(param.code);
                console.log('userResult :',userResult);
                if (userResult.successed==true){
                    _self._usercache.setWechatPublicAuthoried(param.userid,{appid:param.appid,openid:userResult.openid})
                    ////将我们的用户结合对方公众号的appid，将用户的openid存储起来
                    ///param.userid  这个属性是红包用户的userid
                    //let subscribed = pubApi.userSubscribed(userResult.access_token,userResult.openid);
                    // _self._redisHelper.hset(
                    //     PUBLIC_USERS_SET+param.appid,
                    //     param.userid,
                    //     userResult.openid
                    // );
                }
                return res.send('success')
            })
        });
        
    }
}
exports = module.exports = WechatController;