/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co                  = require('co');
var dao                 = require('../../model/redbag/background');
var controllerBase      = require('../../core/controllerBase');
var utility             = require('../../core/utilities/utilities');
//var redisHelper         = require('../../core/utilities/redisUtility');
//const BACKGROUND_KEY    = "key:background"
class BackgroundController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new dao());
        //this._redisHelper = new redisHelper();
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
        let self = instance;
        this._router.get('/background/choose', function (req, res) {
            co(instance.getListData(req, "bgmchoose"))
                .then(result =>res.json(result))
                .catch(result =>res.json(result))
        });
        this._router.get('/background', function (req, res) {
            co(instance.getListData(req, "background"))
                .then(result =>res.json(result))
                .catch(result =>res.json(result))
        });
         //#处理更新实体记录的路由配置
         this._router.post('/background/:id/enable', function (req, res) {
            co(instance._daoModel.setBackgroundStatus({id:req.params.id,status:req.body.status}))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });
         //#处理更新实体记录的路由配置
         this._router.post('/background/:id/default', function (req, res) {
            co(instance._daoModel.setBackgroundDefault(req.params.id))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });
         /**
          * 缓存所有的背景/音乐/和主题
          */
         this._router.post('/background/cache', function (req, res) {
            co(instance._daoModel.getBackground2Cache())
            .then(result =>{
                if (result.successed){
                    let savePath = '/redbag/config/cache/background.json';
                    let writeResult = utility.saveString2File(savePath,
                        JSON.stringify(result.data),
                        "tencentcos");
                }
                res.json(result)
            })
            .catch(result =>res.json(result))
        });
        //#处理提交新增实体记录的路由配置
        this._router.post('/background', function (req, res) {
            co(instance.create(req, "background"))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });

        //#获取详细记录的路由配置
        this._router.get('/background/:id', function (req, res) {
            co(instance.getDataById(req, "background"))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });
        //#处理更新实体记录的路由配置
        this._router.put('/background/:id', function (req, res) {
            co(instance.update(req, "background"))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });
        //#处理删除实体记录的路由配置
        this._router.delete('/background/:id', function (req, res) {
            co(instance.delete(req, req.params.id))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });
        
    }
}
exports = module.exports = BackgroundController;