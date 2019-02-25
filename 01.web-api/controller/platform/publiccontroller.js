/*
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co              = require('co');
var appDao          = require('../../model/mini/appinfo');
var controllerBase  = require('../../core/controllerBase');
var redisKey        =   require('../../model/rediskey');
var redisHelper     = require('../../core/utilities/redisUtility');
class PublicController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new appDao());
        this._redisHelper = new redisHelper();
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
        /**
         *  将公众号的信息缓存
         */
        this._router.post('/public/cache', function (req, res) {
            co(instance._daoModel.getAll())
                .then(result => {
                    result.items.forEach(element => {
                        instance._redisHelper.hset(redisKey.APP_INFO,element.appId,element);
                    });
                    res.json({successed:true})
                })     //.then(result=>res.render("user",result))     ///Or You can output Json 
                .catch(result =>res.json(result))
        });
        this._router.get('/public', function (req, res) {
            co(instance.getListData(req, "public"))
                .then(result => res.json(result))     //.then(result=>res.render("user",result))     ///Or You can output Json 
                .catch(result =>res.json(result))
        });
        //#处理提交新增实体记录的路由配置
        this._router.post('/public', function (req, res) {
            co(instance.create(req, "public"))
                .then(result =>res.json(result))
                .catch(result =>res.json(result));
        });
        //#获取详细记录的路由配置
        this._router.get('/public/:id/diversion', function (req, res) {
            co(instance.getListData(req, "diversion"))
                .then(result =>{ instance.responseResult(req,res,result); })
                .catch(result =>res.json(result));
        });
        //#获取详细记录的路由配置
        this._router.get('/public/:id', function (req, res) {
            co(instance.getDataById(req, "public"))
                .then(result => res.json(result))
                .catch(result =>res.json(result));
        });
        
        
        //#处理更新实体记录的路由配置
        this._router.put('/public/:id', function (req, res) {
            co(instance.update(req, "public"))
                .then(result =>res.json(result))
                .catch(result =>res.json(result));
        });
        //#处理删除实体记录的路由配置
        this._router.delete('/public/:id', function (req, res) {
            co(instance.delete(req, req.params.id))
                .then(result => res.json(result))
                .catch(result =>res.json(result));
        });
    }
}

exports = module.exports = PublicController;