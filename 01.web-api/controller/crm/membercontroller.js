/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co = require('co');
var memberDao = require('../../model/crm/member');
var controllerBase = require('../../core/controllerBase');
var utility =require('../../core/utilities/utilities');
class MemberController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application, new memberDao());
    }
    /*
    * 初始化控制器中的路由
    * 以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
    * 根据实际情况可以继续添加其他路由，或删除现有路由
    */
    initializeRouter(instance) {
        ///以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
        ///根据实际情况可以继续添加其他路由，或删除现有路由
        //#处理删除实体记录的路由配置
        //#获取会员消费记录
        this._router.get('/member/:id/orders', function (req, res) {
           co(instance.getListData(req, "order"))
                .then(result => res.json(result))
                .catch(result => res.json(result))
        });
 
        //#处理获取实体列表的路由函数
        this._router.get('/member', function (req, res) {
            co(instance.getListData(req, "member"))
                .then(result =>instance.responseResult(req,res,result))
                .catch(result => { console.log(result); instance.responseResult(req,res,result); })
        });
        //#获取详细记录的路由配置
        this._router.get('/member/:id', function (req, res) {
            co(instance.getDataById(req, "member"))
                .then(result => res.json(result))
                .catch(result => res.json(result));
        });
  
         //#处理更新实体记录的路由配置
        this._router.put('/member/:id', function (req, res) {
            co(instance._daoModel.updateUserMobile(req.params.id,req.body.phone))
                .then(result =>res.json(result))
                .catch(result=>res.json(result));
        });
         
      
    }
}
exports = module.exports = MemberController;