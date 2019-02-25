/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co = require('co');
var feedbackDao = require('../../model/platform/feedback');
var controllerBase = require('../../core/controllerBase');
var utility = require('../../core/utilities/utilities');
class FeedbackController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new feedbackDao());
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
        ///获得顶级分类
        this._router.get('/feedback', function (req, res) {
            co(instance.getListData(req, "feedback"))
                .then(result => res.json(result))
                .catch(result => res.json(result))
        });
        this._router.put('/feedback/:id', function (req, res) {
            co(instance._daoModel.updateStatus(req.params.id,req.body.status || 1))
                .then(result => res.json(result))
                .catch(result => res.json(result))
        });
       
    }
}
exports = module.exports = FeedbackController;