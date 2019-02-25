/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co              = require('co');
var settingDao      = require('../../model/framework/systemsetting');
var controllerBase  = require('../../core/controllerBase');
var config          = require('../../core/configuration/frameworkConfig');
var stringUtil      = require('../../core/utilities/stringUtility');
var rediskey        = require('../../model/rediskey');
var redisHelper     = require('../../core/utilities/redisUtility');
var uuid            = require('node-uuid');
class SystemSettingController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new settingDao());
        this._redisHelper =new redisHelper();
    }
    /*
    * 初始化控制器中的路由
    * 以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
    * 根据实际情况可以继续添加其他路由，或删除现有路由
    */
    initializeRouter(instance) {
        var _self = this;
        //#获取详细记录的路由配置
        this._router.get('/systemsetting', function (req, res) {
            
            co(function*(){
                let setting = yield _self._redisHelper.hget(rediskey.SYSTEMSETTNG,rediskey.appid);
                if (!setting) return res.json({successed:true,json:null});
                res.json({successed:true,json:setting});

            })
            /*co(instance._daoModel.getSettingById(rediskey.appid))
                .then(result =>
                    res.json({successed:true,json:result.rows[0][0].settingjson})
                )
                .catch(result =>res.json(result));
                */
        });
        //#处理更新实体记录的路由配置
        this._router.put('/systemsetting', function (req, res) {
            let settingString = JSON.stringify(req.body);
            co(instance._daoModel.updateSetting(settingString,rediskey.appid))
                .then(result =>{
                    _self._redisHelper.hset(rediskey.SYSTEMSETTNG,rediskey.appid,req.body);
                    return res.json({successed:true})
                    }
                )
                .catch(result=> res.json(result));
        });
        
        
    }
}
exports = module.exports = SystemSettingController;