/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co                  = require('co');
var membership          = require('../../../model/api/member/membership');
//var rediskey            = require('../../../model/rediskey');
var controllerBase      = require('../../../core/controllerBase');
var miniApi             = require('../../../core/wechatapi/MiniApi');
var utility             = require('../../../core/utilities/utilities');
var constMessage        = require('../../../model/messagekey');
var uuid                = require('node-uuid'); 
var userCache           = require('../utility/usercache');
//var QRUtility           = require('../../../core/utilities/qrcodeUtility');
//var redisHelper         = require('../../../core/utilities/redisUtility');
class WechatController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application,null);
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
        // this._router.get('/redissize', function (req, res) {
        //     co(function*(){
        //        let result =  yield _self._usercache.getDbSize();
        //        return res.json(result);
               
        //     })
        // });
        // this._router.get('/clearredis', function (req, res) {
        //     _self._usercache.clearDB();
        //     return res.json({successed:true});
        // });
        /*
        * 用户简单注册，登记用户的openid，创建本地用户记录
        */
        this._router.post('/register', function (req, res) {
            co(function* () {
                ///appCode ： 前端小程序的名字，通过不同的名字到配置文件中换取对应的Key进行解码
                ///获得用户的UniodId
                const { code, encryptedData,released,iv, openGId} = req.body;
                ////默认为简单注册   registerype = authorization  表示授权获取用户的个人信息
                let registerype =  encryptedData?1:0;

                var mini        = new miniApi(req.user.appid);
                let appInfo     = yield mini.getAppInfo();
                var userResult  = yield mini.getSessionKey(code);
                ////获取用户的认证失败
                if (!userResult || userResult && userResult.errcode > 0) 
                    return res.json({successed: false,data: userResult})
                var sessionKey = userResult.sessionkey;
               //let registerype = 0;
                var   decryptUser =  {};

                ////如果只是简单注册,则不需要解码用户数据
                if (registerype==0)
                   decryptUser = {openId: userResult.openid,unionId: userResult.unionid}
                else{
                    decryptUser = mini.decryptUserInfo(sessionKey,encryptedData, iv);
                }
                const { avatarUrl, nickName, openId, gender,city, unionId } = decryptUser
                
                var params = {
                    ////防止同一主体下多个应用,为关联同一个用户，默认采用unionid作为用户的主键
                    ////如果没有unionId 则还是使用openId
                    wxunionid:openId,
                    logo: avatarUrl,
                    username: nickName,
                    gender:gender,
                    city:city
                };
                var mb = new membership();
                let memberinfo = null;
                 ////如果只是简单注册,则只需要登记用户在数据库中的信息
                if (registerype==0)
                    memberinfo = yield  mb.Register(params);
                else
                    ////否则获取用户的信息更新到数据库
                    memberinfo = yield  mb.setUserInfo(params);
                if (memberinfo.successed) {
                    var remoteUserData   = memberinfo.data;// memberinfo.rows[0][0];
                    let userData = {
                        openid:openId,
                        userid: remoteUserData.user_id,
                        token: remoteUserData.user_id,
                        avatarUrl:remoteUserData.user_logo,
                        nickName:remoteUserData.user_name,
                    };
                    ///将用户信息保存在redis
                    _self._usercache.cacheUser(openId,userData);
                    return res.json({
                        successed: true,
                        data: userData
                    })
                }
                return res.json({successed: false});
            })
        });
    }
}
exports = module.exports = WechatController;