/*
* 自动生成代码(Auto-generated)
* 实体业务模型的控制器类
* 该类由代码自动生成
* 各种业务处理的控制写在此处
*/
var co                  = require('co');
var membershipDao       = require('../../../model/api/member/membership');
var controllerBase      = require('../../../core/controllerBase');
var crypto              = require('crypto');
var csMessage           = require('../../../core/wechatapi/CustomerServiceMessageApi');
let msgApi              = new csMessage();
class MessageController extends controllerBase {
    /*
    * 类构造函数
    * 设置类需要的数据实体操作实例
    */
    constructor(application) {
        ///将对应的数据库实体对象传递至基类
        super(application);
        
    }
    /*
    * 初始化控制器中的路由
    * 以下由代码生成器默认添加了增删改查的几个路由处理器，开发人员
    * 根据实际情况可以继续添加其他路由，或删除现有路由
    */
    initializeRouter(instance) {
        let _self = instance;
        /**
         * 接收微信消息的认证题
         */
        this._router.get('/', function (req, res) {
                console.log('come in');
                const {signature,timestamp,nonce,echostr} = req.query;
                const token = 'doomisoftmessage';
                console.log(token);
                let array = [timestamp,nonce,token].sort().join('');
                let sha1 = crypto.createHash('sha1');
                console.log('sha1',sha1);
                var str = sha1.update(array).digest('hex');
                console.log('signature',signature);
                console.log('str',str);
                if (str==signature)  return res.send(echostr);
                res.send("error")
        
            }
        )
        /**
         * 后台接收到用户进入小程序客服所接收到的用户消息进行处理
         */
        this._router.post('/',function(req,res){
            let message = req.body;
            // {
            //     "ToUserName": "toUser",　　　　　　//小程序的原始ID
            //     "FromUserName": "fromUser",　　　　//发送者的openid
            //     "CreateTime": 1482048670,　　　　　//事件创建时间(整型）
            //     "MsgType": "event",　　　　　　　　//消息类型
            //     "Event": "user_enter_tempsession", //事件类型，user_enter_tempsession
            //     "SessionFrom": "sessionFrom"　　　 //开发者在客服会话按钮设置的session-from属性
            // }
            console.log('I got message',message);
            let userOpenId = message.FromUserName,appid = message.ToUserName;
            
            let result ;
            co(function*(){
                switch(message.MsgType){
                    case "event":   ////用户进入了小程序客服事件
                    result= yield msgApi.replyText(userOpenId,'你好,我是芝麻客服哆小咪,有什么问题欢迎咨询');
                    break;
                    case "text":    ////处理用户发送的文本消息
                    result=yield msgApi.replyText(userOpenId,`我重复一遍您的内容:${message.Content}`);
                    break;
                    case "image":    ////处理客户发送的图片消息
                    result=yield msgApi.replyText(userOpenId,`这个是什么意思呢？`);
                    break;
                }
                console.log('result',result);
                res.send('success')
            })
        })
    }
}
exports = module.exports = MessageController;