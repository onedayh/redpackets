/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co = require('co');
var templateMessageDao = require('../../model/platform/templatemessage');
var controllerBase = require('../../core/controllerBase');
var utility = require('../../core/utilities/utilities');
var stringUtil      = require('../../core/utilities/stringUtility');
const rediskey = require('../../model/rediskey');
const redisHelper     = require('../../core/utilities/redisUtility');
class FeedbackController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new templateMessageDao());
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
        // this._router.get('/department', function (req, res) {
        //     co(instance.getListData(req, "department"))
        //         .then(result =>instance.responseResult(req,res,result))
        //         .catch(result => { console.log(result); instance.responseResult(req,res,result); })
        // });
        let _self = this;
        //#处理提交新增实体记录的路由配置
        this._router.post('/templatemessage', function (req, res) {
            co(instance.create(req, "templatemessage"))
                .then(async result => {
                    //let robj = {};
                    //robj[req.body.key] = req.body.msgid;
                    _self._redisHelper.hset(stringUtil.format(rediskey.APP_MESSAGE_KEY,rediskey.appid),req.body.key, req.body.msgid);
                    res.json(result);
                } )
                .catch(result =>{ instance.responseResult(req,res,result) });
        });

        this._router.get('/templatemessage', function (req, res) {
            co(instance.getListData(req, "templatemessage"))
                .then(result => res.json(result))
                .catch(result => res.json(result))
        });

        //#获取详细记录的路由配置
        this._router.get('/templatemessage/:id', function (req, res) {
            co(instance.getDataById(req, "templatemessage"))
                .then(async result => {
                    // let ret = await _self._redisHelper.hmgetsub(stringUtil.format(rediskey.APP_MESSAGE_KEY,req.user.appid), 'getverifycode');
                    // console.log(ret);
                    instance.responseResult(req,res,result)})
                .catch(result => {
                    res.json(result)
                });
        });
        //编辑
        this._router.put('/templatemessage/:id', function (req, res) {
            co(instance.update(req, 'templatemessage'))
                .then(async result => {
                    //let robj = {};
                    //robj[req.body.key] = req.body.msgid;
                    _self._redisHelper.hset(stringUtil.format(rediskey.APP_MESSAGE_KEY,rediskey.appid),req.body.key, req.body.msgid);
                    res.json(result)
                })
                .catch(result => res.json(result))
        });
        //删除
        this._router.delete('/templatemessage/:id', function (req, res) {
            co(instance.delete(req, req.params.id))
                .then(async result => {
                    let ret = await _self._redisHelper.hdel(stringUtil.format(rediskey.APP_MESSAGE_KEY,rediskey.appid), req.body.key);
                    console.log('ret:%j', ret);
                    res.json(result)
                })
                .catch(result => res.json(result))
        });
        //刷新消息缓存
        this._router.delete('/templatemessage/messagedelete', function (req, res) {
            let key = req.body.key;
            co(instance.delete(req, req.body.id))
                .then(async result => {
                    let ret = await _self._redisHelper.hdel(stringUtil.format(rediskey.APP_MESSAGE_KEY,rediskey.appid), key);
                    console.log('ret:%j', ret);
                    res.json(result)
                })
                .catch(result => res.json(result))
        });

    }
}
exports = module.exports = FeedbackController;