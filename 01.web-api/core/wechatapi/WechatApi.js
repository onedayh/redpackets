
/**
* 封装了微信相关的接口调用
*/
var co              = require('co');
var qs              = require('qs');
var crypto          = require('crypto');
var xml2js          = require('xml2js');
var event           = require('events');
var rpc             = require('../rpc/rpcUtility');
var wxConfig        = require('./wechatconfig');
var appDao          = require('../../model/mini/appinfo')
var redisHelper     = require('../utilities/redisUtility');
var stringUtil      = require('../utilities/stringUtility');
const rediskey      = require('../../model/rediskey');
var moment          = require('moment');


var _INSTANCE       = null;
var api = {
    accessToken: wxConfig.accessTokenUrl,//token?grant_type=client_credential,  
    upload: `${wxConfig.prefix}media/upload?`
}
//2小时过期时间，60*60*2
var expireTime = (7200 - 600) * 1000;
var sessionData = {};
class WechatApi extends event.EventEmitter {
    constructor(appid) {
        super();
        ////如果没有传appid，则默认为本平台的appid
        if(!appid) appid        = wxConfig.appid;
        this.config             = wxConfig;
        this._redisHelper       = new redisHelper();
        this._APPID             = appid; 
        _INSTANCE               = this;
    }
    /**
     * 获取AppId对应的相关微信中的设置
     * @param {*} appid 
     */
    *getAppInfo(appid){
         if (this.appinfo) return this.appinfo;
         this.appinfo   =   yield this.getAppInfoSetting(appid || this._APPID);
         return this.appinfo;
    }
    /*
    * 根据不同的AppCode获取对应的Id和Key
    */
    *getAppInfoSetting(appid){
       // return wxConfig.merchantInfo;
        ///如果没有code则返回默认的app设置信息
        ///如果配置文件中没有多小程序配置节，返回默认的
        ///或者多配置中没有配置对应的appcode
        if (appid==null) return null;
        //先查看redis缓存中是否有该appid的相关信息
        let AppKeyValue =rediskey.APP_INFO;
        let appInfo     = yield _INSTANCE._redisHelper.hget(AppKeyValue,appid);
        //if (appInfo)     return JSON.parse(appInfo);
        //从数据库里面拿
        var dao         = new appDao();
        var appResult   = yield dao.getAppInfoById(appid);
        if (appResult.successed){
            let row     = appResult.appinfo;
            appInfo     = {
                appId           :appid,
                appSecret       :row.app_key,
                appName         :row.app_name,
                wxmerchantId    :row.merchant_wxid,
                wxmerchantKey   :row.merchant_key,
                wxmerchantCert  :row.merchant_cert,
                appType         :row.app_type,
                appPath         :row.app_path,
                appParam        :row.app_param,
                token           :null
            }
            _INSTANCE._redisHelper.hset(AppKeyValue,appid,appInfo);
            return appInfo;
       }
        return null;
    }


     /**
     * 解密微信用户数据
     * @param {*} 解码需要的用户sessionKey 
     * @param {*} 待解码的用户数据 
     * @param {*} iv 
     */
     decryptUserInfo(sessionKey,encryptedData,iv) {
        let newencryptedData    = new Buffer(encryptedData, 'base64')
        let key                 = new Buffer(sessionKey, 'base64')
        let newiv               = new Buffer(iv, 'base64')
        const decipher          = crypto.createDecipheriv('aes-128-cbc', key, newiv)
        let decoded             = decipher.update(newencryptedData, 'base64', 'utf8')
        decoded                 += decipher.final('utf8')
        return JSON.parse(decoded);
    }
    /*
    和微信验证握手
    */
    static validateSignature(req, res, next) {
        if (req.method != 'GET') {
            next();
            return;
        }
        // wechatConfig = wechatConfig || {};  
        var q = req.query;
        var token = wxConfig.token;
        var signature = q.signature; //微信加密签名  
        var nonce = q.nonce; //随机数  
        var timestamp = q.timestamp; //时间戳  
        var echostr = q.echostr; //随机字符串  
        /* 
            1）将token、timestamp、nonce三个参数进行字典序排序 
            2）将三个参数字符串拼接成一个字符串进行sha1加密 
            3）开发者获得加密后的字符串可与signature对比，标识该请求来源于微信 
        */
        var str = [token, timestamp, nonce].sort().join('');
        var sha1 = crypto.createHash('sha1');
        var sha = sha1.update(str).digest('hex');
        if (req.method == 'GET') {
            if (sha == signature) {
                res.send(echostr + '')
            } else {
                res.send('err');
            }
        }
        else if (req.method == 'POST') {
            if (sha != signature) {
                return;
            }
            next();
        }
    }
    /**
     * 取得当前的timestamp
     */
    getTimeStamp() { 
        return parseInt(new Date().getTime() / 1000) + ''; 
    }

    /**
    * 获取微信接口调用的access_token
    * 每次调用微信接口必须带上AccessToken , 所以缓存
    */
    *updateAccessToken() {
        let appinfo     = yield this.getAppInfo();
        console.log('appinfo',appinfo);
        if (!appinfo) return {access_token:null};
        ///检查之前拿过的token有否过期，如果没有过期则继续使用之前的token
        if (appinfo.token && appinfo.token_expired &&  appinfo.token_expired > Date.now()){
            return { access_token: appinfo.token};
        }
        ///已经过期了，则需要重新来
        var url         = `${api.accessToken}&appid=${appinfo.appId}&secret=${appinfo.appSecret}`;
        var option      = { url: url, json: true };
        var tokenData   = yield rpc.request(option);
        if (tokenData.successed==true){
            appinfo.token =  tokenData.body.access_token;
            appinfo.token_expired = moment().add(7200, 'second').valueOf();
            //let appKeyValue = stringUtil.format(rediskey.APP_INFO,appinfo.appId);
            ///将信息缓存，便于下次调用时快速获取
            _INSTANCE._redisHelper.hset(rediskey.APP_INFO,appinfo.appId,appinfo);
            return { access_token: appinfo.token};
        }
        return {access_token:null}
    }
    

    

    // /**
    //  *  小程序 code 换取 session_key
    //  */
    // *getSessionKey(code) {
    //     var that = this;
    //     const url = 'https://api.weixin.qq.com/sns/jscode2session?';
    //     let appinfo = yield this.getAppInfo();
    //     var params = {
    //         appid: appinfo.appId,
    //         secret:appinfo.appSecret,
    //         js_code: code,
    //         grant_type: "authorization_code"
    //     }
    //     var options = {
    //         method: 'get',
    //         url: url + qs.stringify(params)
    //     }
    //     let callData = yield rpc.request(options);
    //     if (callData.successed==true){
    //         var sessionResult = JSON.parse(callData.body);
    //         sessionData = Object.assign({ sessionkey: sessionResult.session_key, timestamp: that.getTimeStamp() }, sessionResult);
    //         return Object.assign({}, sessionData);
    //     }
    //     return {successed:false};

    // }
    /*
    将XML消息转为Json格式的对象
    */
    static toJSON(xml) {
        return new Promise((resolve,reject)=>{
            xml2js.parseString(xml, {trim: true}, (err, result) => {
                if (err)
                    reject(err,result);
                else
                    resolve(result.xml);   
            })
            })
            .then(result=>{return result;});
    }

    /*
    将json对象根据微信的格式转为XML
    */
    toXML(data) {
        var MsgType = "";
        if (!data.MsgType) {
            if (data.hasOwnProperty("Content")) MsgType = "text";
            if (data.hasOwnProperty("MusicUrl")) MsgType = "music";
            if (data.hasOwnProperty("Articles")) MsgType = "news";
        } else {
            MsgType = data.MsgType;
        }
        var msg = "" +
            "<xml>" +
            "<ToUserName><![CDATA[" + data.ToUserName + "]]></ToUserName>" +
            "<FromUserName><![CDATA[" + data.FromUserName + "]]></FromUserName>" +
            "<CreateTime>" + Math.round(Date.now() / 1000) + "</CreateTime>" +
            "<MsgType><![CDATA[" + MsgType + "]]></MsgType>";

        switch (MsgType) {
            case 'text': msg += "" + "<Content><![CDATA[" + (data.Content || '') + "]]></Content>" + "</xml>";
                return msg;
            case 'image':
                msg += "" +
                    "<Image>" +
                    "<MediaId><![CDATA[" + data.MediaId + "]]></MediaId>" +
                    "</Image>" +
                    "</xml>";
                console.log(msg);
                return msg;
            case 'voice':
                msg += "" +
                    "<Voice>" +
                    "<MediaId><![CDATA[" + data.MediaId + "]]></MediaId>" +
                    "<Title><![CDATA[" + data.Title + "]]></Title>" +
                    "<Description><![CDATA[" + data.Description + "]]></Description>" +
                    "</Voice>" +
                    "</xml>";
                return msg;
            case 'video':
                msg += "" +
                    "<Video>" +
                    "<MediaId><![CDATA[" + data.MediaId + "]]></MediaId>" +
                    "</Video>" +
                    "</xml>";
                return msg;
            case 'music':
                msg += "" +
                    "<Music>" +
                    "<Title><![CDATA[" + (data.Title || '') + "]]></Title>" +
                    "<Description><![CDATA[" + (data.Description || '') + "]]></Description>" +
                    "<MusicUrl><![CDATA[" + (data.MusicUrl || '') + "]]></MusicUrl>" +
                    "<HQMusicUrl><![CDATA[" + (data.HQMusicUrl || data.MusicUrl || '') + "]]></HQMusicUrl>" +
                    "<ThumbMediaId><![CDATA[" + (data.ThumbMediaId || '') + "]]></ThumbMediaId>" +
                    "</Music>" +
                    "</xml>";
                console.log(msg);
                return msg;
            case 'news':
                var ArticlesStr = "";
                var ArticleCount = data.Articles.length;
                for (var i in data.Articles) {
                    ArticlesStr += "" +
                        "<item>" +
                        "<Title><![CDATA[" + (data.Articles[i].Title || '') + "]]></Title>" +
                        "<Description><![CDATA[" + (data.Articles[i].Description || '') + "]]></Description>" +
                        "<PicUrl><![CDATA[" + (data.Articles[i].PicUrl || '') + "]]></PicUrl>" +
                        "<Url><![CDATA[" + (data.Articles[i].Url || '') + "]]></Url>" +
                        "</item>";
                }
                msg += "<ArticleCount>" + ArticleCount + "</ArticleCount><Articles>" + ArticlesStr + "</Articles></xml>";
                return msg;
        }
    }
}


exports = module.exports = WechatApi;