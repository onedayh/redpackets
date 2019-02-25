/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co                  = require('co');
var dao                 = require('../../model/redbag/music');
var controllerBase      = require('../../core/controllerBase');
// var redisHelper         = require('../../core/utilities/redisUtility');
// const BACKGROUND_KEY    = "key:background"
class MusicController extends controllerBase {
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
        let self = instance;
        ///以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
        ///根据实际情况可以继续添加其他路由，或删除现有路由
        //#处理获取实体列表的路由函数
        this._router.get('/music', function (req, res) {
            co(instance.getListData(req, "music"))
                .then(result =>res.json(result))
                .catch(result =>res.json(result))
        });
         //#处理更新实体记录的路由配置
         this._router.post('/music/:id/enable', function (req, res) {
            co(instance._daoModel.setMusicStatus({id:req.params.id,status:req.body.status}))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });
        //#处理更新实体记录的路由配置
        this._router.post('/music/:id/default', function (req, res) {
            co(instance._daoModel.setMusicDefault(req.params.id))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });
        //#处理提交新增实体记录的路由配置
        this._router.post('/music', function (req, res) {
            co(instance.create(req, "music"))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });

        //#获取详细记录的路由配置
        this._router.get('/music/:id', function (req, res) {
            co(instance.getDataById(req, "music"))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });
        //#处理更新实体记录的路由配置
        this._router.put('/music/:id', function (req, res) {
            co(instance.update(req, "music"))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });
        //#处理删除实体记录的路由配置
        this._router.delete('/music/:id', function (req, res) {
            co(instance.delete(req, req.params.id))
            .then(result =>res.json(result))
            .catch(result =>res.json(result))
        });
        
    }
}
exports = module.exports = MusicController;