 /**
* 腾讯云发送短消息工具
**/

var QcloudSms = require('qcloudsms_js');
//var qcloudsms ;//= QcloudSms(config.tencentApi.AppId, config.tencentApi.AppKey);
class TencentSmsUtility {
    /*
     * 发送单条短消息
     * 短信内容需要审核（没有模板）
     * callback 回调函数
     */
    constructor(setting){
        this.qcloudsms = QcloudSms(setting.AppId, setting.AppKey);
    }
    sendMessage2SinglePhone(phonenumber,message,callback=null) {
        if (!this.qcloudsms) {
            console.log('please set the SMS setting first');
            return;
        }
        var sender = this.qcloudsms.SmsSingleSender();
        sender.send(0, 86, phonenumber,message, "", "", callback);
    }
    /*
    群发短信
    */
    sendMessage2MultiPhone(phonenumbers,message,callback=null) {
        if (!this.qcloudsms) {
            console.log('please set the SMS setting first');
            return;
        }
        var sender = this.qcloudsms.SmsMultiSender();
        sender.send(0, "86", phonenumbers,message, "", "", callback);
    }
    /*
    使用模板发送短信
    */
    sendTemplateMessage2SinglePhone(phonenumber,tempid,params=null,callback=null) {
        if (!this.qcloudsms) {
            console.log('please set the SMS setting first');
            return;
        }
        var sender = this.qcloudsms.SmsSingleSender();
        console.log('send sms message to %s with templateid %s,params is %s',phonenumber,tempid,JSON.stringify(params));
        sender.sendWithParam(86, phonenumber, tempid,
            params, "", "", "", callback);
    }
    /*
    使用模板群发短信
    */
    sendTemplateMessage2MultiPhone(phonenumbers,tempid,params=null,callback=null) {
        if (!this.qcloudsms) {
            console.log('please set the SMS setting first');
            return;
        }
        var sender = this.qcloudsms.SmsMultiSender();
        sender.sendWithParam(86, phonenumbers, tempid,
            params, "", "", "", callback);
    }
    
}
exports = module.exports = TencentSmsUtility;