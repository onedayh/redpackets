/*
* 微信小程序客服消息接口
*/
var uuid            = require('node-uuid');
var MiniApi       = require('./MiniApi');
var uploadConfig    = require('../../uploadconfig.json');
var config          = require('../../configuration.json');
var qs              = require('qs');
var rpc             = require('../rpc/rpcUtility');
var utility         = require('../utilities/utilities');
class CustomerServiceMessageApi extends MiniApi{
    constructor(appid){
        super(appid);
    }
    /**
     * 解析用户上发的消息
     * @param {*} object 
     */
    /**
     * 推送小程序消息到用户
     * @param {*} dataOption 
     */
    *sendMessage(openid,msgType,msgContent){
        /*获取调用的token*/
        var tokenData = yield this.updateAccessToken();   
        console.log('tokenData',tokenData) 
        if (tokenData.access_token){
            var url =   `https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=${tokenData.access_token}`; 
            ///组织消息体
            let msgBody = Object.assign({},{
                access_token:tokenData.access_token,
                touser:openid,
            　　msgtype:msgType},msgContent);
            console.log('msgBody',msgBody) 
            var option = { url: url, json: true,method: "POST",body:msgBody};
            var returnData = yield rpc.request(option);
            return returnData;
        }    
        return {successed:false};
    }
    /**
     * 回复文本消息
     */
    *replyText(openid,textContent){
        return yield this.sendMessage(openid,'text',{text:{content:textContent}});
    }
    /**
     * 回复文本消息
     */
    *replyLink(openid,linkInfo){
        return yield  this.sendMessage(openid,'link',{link:{...linkInfo}});
    }
    /**
     * 回复图片消息
     */
    *replyImage(openid,imageid){
        return yield this.sendMessage(openid,'image',{image:{media_id:imageid}});
    }
}
exports = module.exports = CustomerServiceMessageApi;