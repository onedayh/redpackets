var miniApi       = require('../wechatapi/MiniApi');
var co                  = require('co');
var stringUtily         = require('./stringUtility');
var redisHelper         = require('./redisUtility');
var _redis              = new redisHelper();
var rediskey            = require('../../model/rediskey');
class MiniMessageUtility {
    ////推送小程序模板消息
    static sendMessage(appid,msgTemplate,targetUsers,data,page){
        return new Promise((resolve,reject)=>{
            co(function*(){
                if (msgTemplate==null) reject({successed:true});
                let validformid = [];
                ////拿取到待发送用户的可用的formid出来
                let allUser  =  targetUsers.split(',');
                let userIndex   =   0;
                while(userIndex<allUser.length){
                    let listValue = yield _redis.poplistValue(stringUtily.format(rediskey.FORMCODE_LIST,allUser[userIndex]));
                    if (listValue!=null){
                        let formcode = JSON.parse(listValue);
                        if (formcode.expire> Date.now()) {
                            validformid.push({
                                openid:allUser[userIndex],
                                formid:formcode.formid
                            });
                            userIndex++;   ///去取下一个用户有效的formid
                        }
                        continue;
                    }
                    ////用户已经没有可用的formid了
                    userIndex++
                }
                console.log('ready to push mini message to user, and formid is %s',validformid);
                for(var formIndex=0;formIndex<validformid.length;formIndex++){
                    var itemParam = validformid[formIndex];
                    let msg = {
                                template_id:msgTemplate,
                                form_id:itemParam.formid,
                                open_id:itemParam.openid,
                                data:data,
                                page:page
                            };
                    var msgSender = new miniApi(appid);
                    console.log('message is %s',msg);
                    var returnData = yield msgSender.sendMessage(msg);
                }
                resolve({successed:true});
            })
        })
    }
}
exports = module.exports = MiniMessageUtility;