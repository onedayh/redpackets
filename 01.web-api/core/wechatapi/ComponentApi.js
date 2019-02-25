/**
 * 基于微信开放平台的调用接口封装
 */
var wxCrypt     =   require('./WechatCrypt');
var co          =   require('co');
var wxconfig    =   require('./wechatconfig');
var xmlUtil     =   require('../utilities/xmlUtility');
var wechatApi   =   require('./WechatApi');
var rpc         =   require('../rpc/rpcUtility');
var utility     =   require('../utilities/utilities');
var redisHelper =   require('../utilities/redisUtility');
var stringUtil  =   require('../utilities/stringUtility');

//const componentConfig = wxconfig.thirdplatform;

class ComponentApi{
    constructor(config){
        this.ACCESS_TOKEN   = null;
        this._redis         =   new redisHelper();
        if (config){
            this.componentConfig = config;
            this.componentRedis = {
                TICKET:'key:ticket:'+config.appid,
                ACCESS_TOKEN:'key:access_token:'+config.appid,
            }
        }
    }
    /**
     * 获取第三方平台自身的AccessCode
     */
    *getComponentAccess(){
        if (!this.ACCESS_TOKEN)  return  yield this._redis.get(this.componentRedis.ACCESS_TOKEN);
        return this.ACCESS_TOKEN;
    }
    /**
    * 解密微信定时发送过来的ticket
    */
    handleComponentMessage(requestMessage, query){
        let that = this;
        return new Promise((resolve,reject)=>{
            co(function*(){
                let signature = query.msg_signature;
                let timestamp = query.timestamp;
                let nonce = query.nonce;
                let cryptor = new wxCrypt(
                /// 真实的token, 真实的encodingAESKey, 真实的第三方平台appID
                    componentConfig.token,
                    componentConfig.aeskey,
                    componentConfig.appid
                );
                let encryptMessage = requestMessage.encrypt;
                let decryptMessage = cryptor.decrypt(encryptMessage);
                //logger.debug('Receive messasge from weixin decrypted :' + JSON.stringify(decryptMessage));
                var message = yield wechatApi.toJSON(decryptMessage.message);
                if (message){
                    let infoType = message.InfoType[0];
                    switch(infoType){
                        case 'component_verify_ticket':
                            var ticket = message.ComponentVerifyTicket[0];
                            ////将最近收到的ticket保存到redis中
                            that._redis.set(that.componentRedis.TICKET,ticket);
                            ////同时更新一下AccessToken
                            let accesstoken =   yield that.getComponentAccessToken(ticket);
                            if (accesstoken.successed==true){
                                ////将最近收到的ticket保存到redis中
                                
                            }
                        break;
                        case 'authorized':
                        case 'unauthorized':
                        case 'refresh':
                            ////TODO : process this event message
                        break;
                    }
                }
                resolve(message);
            })
        })
    }
    /**
     * 获取第三方平台调用的access token
     * @param {*} ticket 
     */
    *getComponentAccessToken(ticket) {
        var componentTokenPostData = {
            component_appid :this.componentConfig.appid,
            component_appsecret : this.componentConfig.appkey,
            component_verify_ticket : ticket
        };
        var option = { 
            url: 'https://api.weixin.qq.com/cgi-bin/component/api_component_token', 
            json: true,
            method: "post",
            body:componentTokenPostData
        };
        let component_access_token_result = yield rpc.request(option);
        if (component_access_token_result.successed!=true || !utility.isNullOrEmpty(component_access_token_result.body.errcode))
            return {successed:false};
        ////保存最近的access_token
        this.ACCESS_TOKEN = accesstoken.access_token;
        this._redis.set(that.componentRedis.ACCESS_TOKEN,accesstoken.access_token);
        return {successed:true,access_token:component_access_token_result.body.component_access_token};
        
    }
    /**
     * 获取到授权的Key
     * @param {*} ticket 
     */
    *getComponentAuthCode() {
        let accesstoken = yield this.getComponentAccess();
        var componentAuthCodePostData = {
            component_appid : this.componentConfig.appid,
        };
        var option = { 
            url: 'https://api.weixin.qq.com/cgi-bin/component/api_create_preauthcode?component_access_token='+accesstoken, 
            json: true,
            method: "post",
            body:componentAuthCodePostData
        };
        let component_preauthcode_result = yield rpc.request(option);
        if (component_preauthcode_result.successed!=true || !utility.isNullOrEmpty(component_preauthcode_result.body.errcode))
            return {successed:false};
        return {successed:true,auth_code:component_preauthcode_result.body.pre_auth_code};
    }
    /**
     * 获取引导用户跳转的url
     * @param {*} authcode 
     * @param {*} callbackurl 
     */
    getAuthorizeUrl(authcode,merchantid,applicationid) {
        let url = 'https://mp.weixin.qq.com/cgi-bin/componentloginpage?component_appid='+
                    wxconfig.thirdplatform.appid+
                    '&pre_auth_code='+authcode
                    +'&redirect_uri='+wxconfig.thirdplatform.authorizeurl+merchantid+'/'+applicationid;
        return url;
    }
    
    /**
     * 第三方授权后首次获取到的信息
     * @param {*} access_token 
     * @param {*} auth_code 
     */
    *queryAuthorizeInfo(auth_code){
        var queryAuthorizePostData = {
            component_appid : this.componentConfig.appid,
            authorization_code : auth_code
        };
        let access_token =yield this.getComponentAccess();
        var option = { 
            url: 'https://api.weixin.qq.com/cgi-bin/component/api_query_auth?component_access_token='+access_token,
            json: true,
            method: "post",
            body:queryAuthorizePostData
        };
        let queryAuthorizeResult = yield rpc.request(option);
        if (queryAuthorizeResult.successed==true && utility.isNullOrEmpty(queryAuthorizeResult.body.errcode)){
            let authorization_info = queryAuthorizeResult.body.authorization_info;
            return {successed:true,
                appid:authorization_info.authorizer_appid,
                access_token:authorization_info.authorizer_access_token,
                refresh_token:authorization_info.authorizer_refresh_token,
                func_info:authorization_info.func_info
            }
        }
        return {successed:false}
    }
    /**
     * 刷新授权的第三方小程序的access_token
     * @param {*} component_access_token : 平台的appid 
     * @param {*} authorizer_appid : 授权的第三方小程序appid
     * @param {*} refresh_token:授权的第三方小程序的刷新code
     */
     *refreshAuthorizerAccessToken(authorizer_appid, refresh_token){
        let component_access_token = this.getComponentAccess();
        var authorizerAccessTokenPostData = {
            component_appid :this.componentConfig.appid,
            authorizer_appid : authorizer_appid,
            authorizer_refresh_token : refresh_token
        };
        var option = { 
            url: 'https://api.weixin.qq.com/cgi-bin/component/api_authorizer_token?component_access_token='+component_access_token,
            json: true,
            method: "post",
            body:authorizerAccessTokenPostData
        };
        let authorizer_token_result = yield rpc.request(option);
        if (authorizer_token_result.successed && 
            utility.isNullOrEmpty(authorizer_token_result.body.errcode)){
            return {successed:true,
                    access_token:authorizer_token_result.body.authorizer_access_token,
                    refresh_token:authorizer_token_result.body.authorizer_refresh_token,
                    expires_in:authorizer_token_result.body.expires_in
                }
        }
        return {successed:false};
    }
}
//var comApi = new ComponentApi(wxconfig.thirdplatform);
exports = module.exports = ComponentApi;