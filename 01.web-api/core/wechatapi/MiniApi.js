/*
* 微信小程序相关的接口调用封装
*/
var uuid            = require('node-uuid');
var WechatApi       = require('./WechatApi');
var uploadConfig    = require('../../uploadconfig.json');
var config          = require('../../configuration.json');
var qs              = require('qs');
var rpc             = require('../rpc/rpcUtility');
var utility         = require('../utilities/utilities');
class MiniApi extends WechatApi{
    constructor(appid){
        super(appid);
    }
    /**
     *  小程序 code 换取 session_key
     */
    *getSessionKey(code) {
        var that = this;
        const url = 'https://api.weixin.qq.com/sns/jscode2session?';
        let appinfo = yield this.getAppInfo();
        var params = {
            appid: appinfo.appId,
            secret:appinfo.appSecret,
            js_code: code,
            grant_type: "authorization_code"
        }
        var options = {method: 'get',url: url + qs.stringify(params)}
        let callData = yield rpc.request(options);
        if (callData.successed==true){
            var sessionResult = JSON.parse(callData.body);
            let sessionData = Object.assign({ sessionkey: sessionResult.session_key, timestamp: that.getTimeStamp() }, sessionResult);
            return Object.assign({}, sessionData);
        }
        return {successed:false};
    }
    /**
     * 推送小程序消息到用户
     * @param {*} dataOption 
     */
    *sendMessage(dataOption){
        /*获取调用的token*/
        var tokenData = yield this.updateAccessToken();    
        if (tokenData.access_token){
            var url =   'https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=' + 
            tokenData.access_token;
            var option = { url: url, json: true,method: "POST",body:{
                touser: dataOption.open_id,
                template_id: dataOption.template_id,
                page:dataOption.page,
                form_id: dataOption.form_id,
                data:dataOption.data
            }};
            var returnData = yield rpc.request(option);
            return returnData;
        }    
        return {successed:false};
    }
    /**
    * 生成小程序的二维码
    * @param {*} param 二维码中涉及的参数 
    */
    *getQRCode(param) {
        
        var codeParams = {
            scene:param.scene || "1",
            path:param.page,
            width:param.width || 430,
            auto_color:param.auto_color || false,
            line_color:param.line_color || { "r": "0", "g": "0", "b": "0" }
        }
        console.log('codeParams',codeParams);
        var tokenData = yield this.updateAccessToken(this);
        var appinfo   = yield this.getAppInfo();
        var http = require("http"),
            data = JSON.stringify(codeParams);
        var options = {
            method: "POST",
            host: "api.weixin.qq.com",
            path: "/wxa/getwxacode?access_token=" + tokenData.access_token,
            headers: {
                "Content-Type": "application/json",
                "Content-Length": data.length
            },
            body:codeParams
        };
        return new Promise((resolve, reject) => {
            var qrcodeReq = http.request(options, function (qrcodeRes) {
                var dataArr = [],
                    len = 0;
                qrcodeRes.on('data', function (chunk) {
                    dataArr.push(chunk);
                    len += chunk.length;
                });
                qrcodeRes.on("end", function (err) {
                    ////生成失败
                    if (err)
                        reject({successed: false});
                    else
                    /////小程序码生成完毕，上传至文件对象存储中
                        utility.uploadFile(config.appsetting.fileDestination, 
                                        uuid.v4() + '.png', 
                                        Buffer.concat(dataArr, len), 
                                        uploadConfig[(param.upload_config || "miniqrcode")], 
                                        appinfo, 
                                        function (file, result) {
                                            resolve({successed: true,data: result});
                        });
                });
            });
            qrcodeReq.write(data);
            qrcodeReq.end();
        })
    }
}
exports = module.exports = MiniApi;