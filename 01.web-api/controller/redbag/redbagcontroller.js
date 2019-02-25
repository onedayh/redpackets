/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co              = require('co');
var redbagDao       = require('../../model/api/redbag/redbag');
var controllerBase  = require('../../core/controllerBase');
var redHelper       = require('../mini/utility/redbagUtility');
class RedbagController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        let redDao = new redbagDao();
        super(application, redDao);
        this._redUtility = new redHelper(redDao);
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
        this._router.get('/redbags', function (req, res) {
            co(instance.getListData(req, "redbags"))
                .then(result =>res.json(result))
                .catch(result =>res.json(result))
        });
        this._router.get('/redbags/income', function (req, res) {
            co(instance.getListData(req, "income"))
                .then(result =>res.json(result))
                .catch(result =>res.json(result))
        });
        this._router.get('/redbags/:id/alloc', function (req, res) {
            co(instance.getListData(req, "allocuser"))
                .then(result =>res.json(result))
                .catch(result=>res.json(result))
        });
         //#获取红包活动的支付订单信息
         this._router.get('/redbags/pay/:id', function (req, res) {
            co(instance._daoModel.getRedBagOrderInfo(req.params.id))
                 .then(result=>res.json(result))
                 .catch(result=>res.json(result))
         });
        /**
         * 获取红包详情
         */
        this._router.get('/redbags/:id', function (req, res) {
           co(function*(){
               let redData = yield self._redUtility.getRedBagInfo(req.params.id);
               if (redData){
                   return res.json({successed:true,rows:redData, id: req.params.id})
               }
           })
        });
        /**
         *撤回红包，红包不可再被领取或编辑
         */
        this._router.post('/redbags/:id/rollback', function (req, res) {
            let param = {id:req.params.id,userid:'admin'};
            co(self._redUtility.rollback(param))
            .then(result=>{
                ///撤回成功，清理掉红包活动占用的redis数据
                    if (result.successed==true) self._redUtility.clearRedBagCache(req.params.id);
                    return res.json({successed:true})
                })
                .catch(result=>res.json({successed:false}))
        });
        //#处理提交新增实体记录的路由配置
        this._router.post('/redbags', function (req, res) {
            let param = req.body;
            co(function*(){
                let result = yield self._redUtility.createRedBag(param);
                return res.json(result);
            })
        });
         //#线下支付红包
         this._router.put('/redbags/pay/:id', function (req, res) {
            let param =Object.assign({},req.body,{id:req.params.id,checker:req.user.id});
            co(function*(){
                let result = yield self._redUtility.offlinePay(param);
                return res.json(result)
            })
        });
        //#修改红包状态
        this._router.put('/redbags/:id', function (req, res) {
            let param = req.body;
            co(function*(){
                let result = yield self._redUtility.editRedBag(req.params.id,param);
                return res.json(result)
            })
        });
        
        
        //#处理删除实体记录的路由配置
        this._router.delete('/redbags/:id', function (req, res) {
            co(instance.delete(req, req.params.id))
                .then(result => instance.responseResult(req,res,result))
                .catch(result=>{instance.responseResult(req,res,result);});
        });
    }
}
exports = module.exports = RedbagController;