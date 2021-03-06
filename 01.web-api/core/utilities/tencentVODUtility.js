var querystring = require("querystring")
var crypto = require('crypto');
var config = require('../../configuration.json')
module.exports.getSignature =function(){
    var secret_id =config.tencentApi.SecretId;
    var secret_key = config.tencentApi.SecretKey;
    // 确定签名的当前时间和失效时间
    var current = parseInt((new Date()).getTime() / 1000)
    var expired = current + 86400;  // 签名有效期：1天
    // 向参数列表填入参数
    var arg_list = {
        secretId : secret_id,
        currentTimeStamp : current,
        expireTime : expired,
        random : Math.round(Math.random() * Math.pow(2, 32))
    }
    // 计算签名
    var orignal = querystring.stringify(arg_list);
    var orignal_buffer = new Buffer(orignal, "utf8");
    var hmac = crypto.createHmac("sha1", secret_key);
    var hmac_buffer = hmac.update(orignal_buffer).digest();
    var signature = Buffer.concat([hmac_buffer, orignal_buffer]).toString("base64");
    // 确定 app 的云 API 密钥
    return signature;
}
