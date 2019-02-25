var co                  = require('co');
var utility             = require('../utilities/utilities');
var smsUtility          = require('../utilities/tencentSmsUtility');
var redisHelper         = require('../utilities/redisUtility');
var PHOMESMSCODEKEY     =  "key:PhoneSMSCode:"; 
var wechatApi           = require('../wechatapi/WechatApi');
class SMSUtility{

    constructor() {
        //this.sms = new  smsUtility(setting)    
       // this._redisHelper = new redisHelper();
    }
    // ////发送验证码
    // /*
    // *   msgid : 腾讯云的短消息模板
    // * */
    // sendVerifyCode(msgid,phoneNumber){
    //     var validCode = utility.generateRandomSerial(6, true);
    //     this._redisHelper.set((PHOMESMSCODEKEY+phoneNumber),validCode,60*3);
    //     console.log('redis saved sms key number :' +validCode +' for phone number : '+phoneNumber);
    //     this.sms.sendTemplateMessage2SinglePhone(phoneNumber, msgid,
    //         [validCode]
    //         , (res1, res2, res3) => {
    //         });
    //     return res.json({validCode,successed: true})
    // }
    /*
    * 发送短消息
    * **/
    static sendMessage(appid,msgTemplate,targetUsers,paramData){
        return new Promise(resolve=>{
            co(function*(){
                let wxApi   = new wechatApi(appid);
                let appinfo = yield wxApi.getAppInfo();
                console.log('appinfo for send message is ',appinfo);
                if (appinfo && appinfo.smsappid && appinfo.smsappkey){
                    ///获取到实例
                    let sms     = new  smsUtility({AppId:appinfo.smsappid,AppKey:appinfo.smsappkey});
                    let allUser = targetUsers.split(',');
                    for(var userIndex =0 ;userIndex<allUser.length;userIndex++){
                        console.log('send message to ',allUser[userIndex]);
                        sms.sendTemplateMessage2SinglePhone(allUser[userIndex], msgTemplate,
                            paramData
                            , (res1, res2, res3) => {
                            });
                    }
                }
                resolve({successed:true});
            })
        })
        
       
    }
    /*
    * 验证短消息验证码是否正确
    * */
    // static checkVerifyCode(phoneNumber,code){
    //     co(function*(){
    //         var smsCode = yield this._redisHelper.get((PHOMESMSCODEKEY+phoneNumber));
    //         console.log('get sms code :' +smsCode);
    //         return code == smsCode;
    //     })
       
    // }
}
exports = module.exports = SMSUtility;