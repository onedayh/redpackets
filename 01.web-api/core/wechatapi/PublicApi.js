/**
 * 基于微信公众号号开发的H5的一些接口封装
 */
var wechatApi   = require('./WechatApi');
var qs          = require('qs');
var rpc         = require('../rpc/rpcUtility');
var moment      = require('moment');
const   PUBLIC_ACCESS_TOKEN_SET    = "set:publictoken";
class PublicApi extends wechatApi{
    constructor(appid){
        super(appid);
    }
    /**
     * 公众号获取用户授权的url
     * @param {*} code 
     */
    getAuthorizeUrl(param){
        param = param || {};
        if (!param.appid) param.appid = this._APPID;
        let urlParam = {
            appid:param.appid,
            //scope:param.scope || 'snsapi_base',         ////只需要获取要基本的openid
            userid:param.userid
        }
        
        ////将一些附加的参数都填入到回调地址里面
        let redirect_uri_param =qs.stringify(urlParam);
        let redirect_uri =encodeURIComponent(this.config.webAuthCallbackUrl+'?'+redirect_uri_param);
        redirect_uri = `https://open.weixin.qq.com/connect/oauth2/authorize?appid=${param.appid}&redirect_uri=${redirect_uri}&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect`;
        return redirect_uri;
        }
    /**
    * 根据公众号授权获取到code，通过code获取到认证的token
    */
   *getAuthorizationToken(code) {
        let reqUrl = 'https://api.weixin.qq.com/sns/oauth2/access_token?';
        let appinfo = yield this.getAppInfo();
        let params = {
            appid: appinfo.appId,
            secret: appinfo.appSecret,
            code: code,
            grant_type: 'authorization_code'
        };

        let options = {
            method: 'get',
            url: reqUrl + qs.stringify(params),
            json: true
        };
        console.log(options.url);
        let callData = yield rpc.request(options);
        //console.log(callData);
        if (callData.successed==true){
            var sessionResult =callData.body; //JSON.parse(callData.body);
            let sessionData ={successed:true,
                                expires_in:sessionResult.expires_in, 
                                access_token:sessionResult.access_token,
                                refresh_token:sessionResult.refresh_token,
                                openid:sessionResult.openid};
            return sessionData;
        }
       
        return {successed:false};
    }

    /**
     * 根据Token 和 openid 获取用户的信息
     * @param {*} 调用者的token 
     * @param {*} 用户的openid 
     */
    *getUserInfo(openid,token) {
        if (!token){
            let access_token = yield this.updateAccessToken();
            if (access_token.successed==true) token = access_token.access_token;
        } 
        if (token){       
            let reqUrl = 'https://api.weixin.qq.com/cgi-bin/user/info?';
            let params = { access_token: token, openid: openid, lang: 'zh_CN' };
            let options = {method: 'get',url: reqUrl + qs.stringify(params)};
            let userResult= yield rpc.request(options);
            return {successed:userResult.successed,userinfo:JSON.parse(userResult.body)};
        }
        return {successed:false}
    }
    /**
     * 检查用户是否已经关注了公众号
     * @param {*} openid : 用户的
     */
    *userSubscribed(openid,token){
        if (!token){
            let access_token = yield this.updateAccessToken();
            token = access_token.access_token;
        }
        console.log('now token is',token);
        if (token){
            console.log('getUserInfo',openid,token);
            let result = yield this.getUserInfo(openid,token);
            console.log('userSubscribed',result);
            if (result.successed==false) return false;
            console.log('result.userinfo.subscribe',result.userinfo.subscribe);
            return result.userinfo.subscribe===1;
        }
        return false;
    }
    /**
    * 获取网页端所需的jsapi-ticket
    */
    *getJSApiTicket() {
        this.jsapiTicketData = this.jsapiTicketData || {};
        // 先判断内存（缓存）中是否已有jsapi-ticket数据
        if (this.jsapiTicketData && this.jsapiTicketData.timestamp) {
            var t = this.getTimeStamp() - jsapiTicketData.timestamp;
            console.log('the gap of last time to get jsapi-ticket is : ', t);
            // 数据是否过期判断，如果没有过期直接返回
            if (t < expireTime) {
                console.log('get the cache access-token data!');
                return { ticket: jsapiTicketData.ticket };
            }
        }
        var tokenData = yield this.updateAccessToken();
        var url = this.config.tiketUrl + tokenData.access_token + '&type=jsapi';
        var option = { url: url, json: true };
        var ticketData = yield rpc.request(option);
        var _ticket = JSON.parse(ticketData).ticket;
        // 将取得的ticket保存到内存
        this.jsapiTicketData = { token: tokenData.access_token, ticket: _ticket, timestamp: this.getTimeStamp() };
        return { ticket: jsapiTicketData.ticket };
    };

   /** 
        使用微信模板消息推送消息给用户
        openid : 用户的openid
        templateid : 消息模板ID
        params:传递给模板消息的参数
   */
   *sendMessage(dataOption){
    /*获取调用的token*/
        let tokenData = yield this.updateAccessToken();   
        if (tokenData.access_token){
            let wxMessageUrl = 'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=';
            var url = wxMessageUrl + tokenData.access_token;
            var option = { url: url, json: true,method: "POST",body:{
                touser: dataOption.open_id,
                template_id: dataOption.template_id,
                //miniprogram:dataOption.miniprogram,
                //appid:dataOption.appid,
                //page:dataOption.page,
                data:dataOption.data
            }};
            var returnData = yield rpc.request(option);
            return returnData;
        }
        return {successed:false};
    }

    /**
    * 获取微信接口调用的access_token
    * 每次调用微信接口必须带上AccessToken , 所以缓存
    */
   *updateAccessToken() {
    let appinfo     = yield this.getAppInfo();
    ///检查该公众号的access_token是否过期
     ////将最新获取到的access_token一起保存下来
    let accesstokeninfo =yield this._redisHelper.hget(PUBLIC_ACCESS_TOKEN_SET,appinfo.appId);
    if (accesstokeninfo) accesstokeninfo = JSON.parse(accesstokeninfo);
    console.log('updateAccessToken load from redis',accesstokeninfo);
    ///检查最近获取到的公众号的Token是否已经过期,如果没有过期，直接返回token
    if (accesstokeninfo && moment().valueOf()<accesstokeninfo.token_expired ){
        return {access_token:accesstokeninfo.access_token};
    }
    ////否则重新获取token
    var url         = `${this.config.accessTokenUrl}&appid=${appinfo.appId}&secret=${appinfo.appSecret}`;
    var option      = { url: url, json: true };
    var tokenData   = yield rpc.request(option);
    console.log('reload public token',tokenData);
    if (tokenData.successed==true){
        appinfo.access_token =  tokenData.body.access_token;
        appinfo.token_expired = moment().add(tokenData.body.expires_in, 'second').valueOf();
        //let appKeyValue = stringUtil.format(rediskey.APP_INFO,appinfo.appId);
        ///将信息缓存，便于下次调用时快速获取
        this._redisHelper.hset(PUBLIC_ACCESS_TOKEN_SET,appinfo.appId,appinfo);
        return { access_token: appinfo.access_token};
    }
    return {access_token:null}
}
}
exports = module.exports = PublicApi;