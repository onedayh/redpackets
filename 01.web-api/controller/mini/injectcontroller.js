/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co                  = require('co');
var controllerBase      = require('../../core/controllerBase');
var rediskey            = require('../../model/rediskey');
var moment              = require('moment');
var stringUtily         = require('../../core/utilities/stringUtility');
var redisHelper         = require('../../core/utilities/redisUtility');
class InjectController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application,null);
        this._redisHelper =new redisHelper();
    }
    /*
    * 初始化控制器中的路由
    * 以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
    * 根据实际情况可以继续添加其他路由，或删除现有路由
    */
    initializeRouter(instance) {
        var _self = instance;
        this._router.use('/', function (req, res, next) {
            var authorization       = ((req && req.headers) ? req.headers.authorization : "");
            var appid               = ((req && req.headers) ? req.headers.appid : "");
            req.user = req.user || {};
            req.user.authorization  = authorization;
            req.user.appid          = appid;
            
            if (req.body.formid!=null && authorization!="" ){
                let codes = req.body.formid.split(',');
                codes.forEach(element => {
                    if (element!="" && element!="the formId is a mock one") {
                        var formcode = {
                            formid:element,
                            ///7天后过期
                            expire:moment().add(7, 'days').valueOf()
                        }
                        _self._redisHelper.setlistValue(stringUtily.format(rediskey.FORMCODE_LIST,authorization),formcode);
                    }
                });
            }
            next();
        
        });
       
    }
}
exports = module.exports = InjectController;