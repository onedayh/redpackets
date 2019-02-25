/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co                  = require('co');
var systemDao           = require('../../../model/api/system/system');
var controllerBase      = require('../../../core/controllerBase');
var rediskey            = require('../../../model/rediskey');
var utility             = require('../../../core/utilities/utilities');
var stringUtility       = require('../../../core/utilities/stringUtility');
var redisHelper         = require('../../../core/utilities/redisUtility');
class SystemController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new systemDao());
        this._redisHelper =new redisHelper();
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
        this._router.get('/globalsetting', function (req, res) {
            co(function*(){
                let setting =yield _self._redisHelper.hget(rediskey.SYSTEMSETTNG,req.user.appid);
                if (setting!=null) return res.json({successed:true,setting:JSON.parse(setting)});
                return res.json({successed:true,setting:null});
            })
        });
        /*
        /*应用获取当前页面的分享配置
        **/
        this._router.get('/share', function (req, res) {
            var param = {
                route:req.query.route
            }
            co(instance._daoModel.getShareInfo(param))
                .then(result =>{
                    if (result.rows[0].length==1) return res.json({successed:true,shareinfo:result.rows[0][0]});
                    return res.json({successed:true,shareinfo:null}); 
                })
                .catch(result => { res.json(result);})
        });
        /*
        * 创建一条分享记录信息
        */
        this._router.post('/share', function (req, res) {
            var param = Object.assign({}, req.body, {
                userid: req.user.authorization
            });
            co(instance._daoModel.createShare(param))
                .then(result => res.json(result))
                .catch(result => { res.json(result);})
        });
        /********** */
        this._router.get('/search', function (req, res) {
            var param = {
                appid:req.user.appid,
                userid: req.user.authorization
            }
            co(function*(){
                let searchSetting = {};
                ////获取平台的搜索热词
                let setting =yield _self._redisHelper.hmget(stringUtility.format(rediskey.SYSTEMSETTNG,param.appid));
                if (setting!=null && !utility.isNullOrEmpty(setting.hotsearch)){
                    searchSetting.globalsearch = setting.hotsearch.split(',');
                    
                }
                else{
                    let searchKeyWords = yield  _self._redisHelper.getOSValueDesc(
                        stringUtility.format(rediskey.GLOBAL_SEARCH,param.appid));
                    searchSetting.globalsearch = searchKeyWords;
                }
                ////获取用户的搜索历史
                let userSearchKeyWords = yield  _self._redisHelper.getOSValueDesc(
                                stringUtility.format(rediskey.USER_SEARCH,param.userid));
                searchSetting.usersearch = userSearchKeyWords;         
                return res.json({successed:true,search:searchSetting});
            }) 
        });

        ////提交应用反馈
        this._router.post('/feedback', function (req, res) {
            var params = {
                userid: req.user.authorization,
                content:req.body.content,
                type:req.body.type
            }
            co(instance._daoModel.createFeedback(params))
                .then(result =>res.json(result))
                .catch(result =>res.json(result))
        });
        /**
         * 空接口，主要是用来收集formid
         */
        this._router.post('/form', function (req, res) {
            res.json({successed:true,errcode:0,errmsg:"ok"})
        });

        /*
        /* 识别当前进入小程序的二维码scene值
        **/
        this._router.get('/identifyscene', function (req, res) {
            if(!utility.checkValue(req.query.scene,null)) return res.json({successed:false});
            co(function*(){
                let param = {scene:req.query.scene};
                let result =yield instance._daoModel.getShareScene(param);
                if (result.successed==false) return res.json(result);
                if (result.param){
                    let params = {
                        userid:req.user.authorization,
                        type:result.param.type,
                        json:JSON.stringify(result.param)
                    }
                    ///写入用户的key value
                    instance._daoModel.setUserComeInKeyByScene(params);
                }
                return res.json(result);
            })
        });

        /*
        /* 记录用户从分享者进入的shareid
        **/
       this._router.post('/setappshare', function (req, res) {
            if (!utility.checkValue(req.body.shareid,null)) return res.json({successed:true});
            let param = {
                userid: req.user.authorization,
                shareid:req.body.shareid
            }
            instance._daoModel.setAppShare(param);
            return res.json({successed:true});
        });

    }
}
exports = module.exports = SystemController;