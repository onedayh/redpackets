/*
* 消息发送的工具类
* 集成了微信模板消息和手机短信消息发送为一体
*/
var co              = require('co');
var utility         = require('./utilities');
var uuid            = require('node-uuid'); 
var constVariable   = require('../../model/messagekey');
var redisKey        = require('../../model/rediskey');
var stringUtility   = require('./stringUtility');
var redisHelper     = require('./redisUtility');
var _redisHelper    = new redisHelper();

class MessageUtility
{

    /*
    * 发送消息
    * msgkey:消息对应的key
    *   -->type: 消息的类型(1 ：小程序  2：SMS短信)
    * targets: 消息发送的目标
    * params:消息发送的参数体
    */
    static sendMessage(appid,type,msgkey,targetUser,params,redirect2Page) {
        return new Promise(reslove=>{
            console.log('start sendMessage');
            co(function*(){
                let templateid  = yield _redisHelper.hget(stringUtility.format(redisKey.APP_MESSAGE_KEY,appid),msgkey);
                console.log('template id is ',templateid);
                if (templateid && targetUser){
                    var messageSender   = type==1?require('./miniMessageUtility'):require('./smsUtility');
                    let result = yield messageSender.sendMessage(appid,templateid,targetUser,params,redirect2Page);
                }
                return reslove({successed:true});
            })
        })
    }
}
exports = module.exports=MessageUtility;