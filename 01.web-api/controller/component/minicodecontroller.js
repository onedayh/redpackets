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
class MiniCodeController extends controllerBase {
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
        //获取草稿箱中的代码
        this._router.get('/mini/draft', function (req, res) {
            co(function*(){
               let draft = yield componentApi.queryDraftMiniProgram();
               res.json(draft)
            });
        });
       
        //获取模板库中的代码
        this._router.get('/mini/template', function (req, res) {
            co(function*(){
                let template = yield componentApi.queryTemplateMiniProgram();
                res.json(template)
             });
        });

        //草稿箱中的代码移至模板库
        this._router.post('/mini/draft2template/:id', function (req, res) {
            co(function*(){
                let result = yield componentApi.setDraft2Template(req.params.id);
                res.json(result)
             });
        });

        //删除模板库的模板
        this._router.delete('/mini/template/:id', function (req, res) {
            co(function*(){
                let result = yield componentApi.deleteTemplate(req.params.id);
                res.json(result)
             });
        });
    }
}
exports = module.exports = MiniCodeController;