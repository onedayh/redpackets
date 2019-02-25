//微信公开接口常用帮助工具类
/**
***create order by Stephen 2018/6/25     
 **/
var crypto = require('crypto')
module.exports = {
    //取得微信端返回来的xml标签里的value
    getXMLNodeValue:function(node_name, xml, flag = false) {
        var _reNodeValue = '';
        var tmp = xml.split('<' + node_name + '>');
        if (tmp) {
            var _tmp = tmp[1].split('</' + node_name + '>')[0];
            if (!flag) {
                var _tmp1 = _tmp.split('[');
                _reNodeValue = _tmp1[2].split(']')[0]
            } else {
                _reNodeValue = _tmp;
            }
        }
        return _reNodeValue;
    },
    // object-->string
    object2raw: function (args) {
        var keys = Object.keys(args)
        keys = keys.sort()
        var newArgs = {}
        keys.forEach(function (key) {
            newArgs[key] = args[key]
        })
        var string = ''
        for (var k in newArgs) {
            string += '&' + k + '=' + newArgs[k]
        }
        string = string.substr(1)
        return string
    },
     //object - > XML
     object2Xml(_array,apikey) {
        var keys = Object.keys(_array);
        var _xmlData = '<xml>';
        keys.forEach(function(key) {
            _xmlData += '<' + key + '>' + _array[key] + '</' + key + '>';
        });

        //取得签名加密字符串
        var    _paySign = this.sign(_array,apikey);        
        _xmlData += '<sign>' + _paySign + '</sign>';
        _xmlData += '</xml>';
        // console.log('xml data ===', _xmlData);
        return _xmlData;
    },
    // 随机字符串产生函数  
    createNonceStr: function () {
        return Math.random().toString(36).substr(2, 15)
    },
    // 时间戳产生函数  
    createTimeStamp: function () {
        return parseInt(new Date().getTime() / 1000) + ''
    },
    // 支付md5加密获取sign
    paysignjs: function (appid,merchantKey,nonceStr, package, signType, timeStamp) {
        var ret = {
            appId: appid,
            nonceStr: nonceStr,
            package: package,
            signType: signType,
            timeStamp: timeStamp
        }
        var string = this.object2raw(ret)
        string = string + '&key=' + merchantKey
        var sign = crypto.createHash('md5').update(string, 'utf8').digest('hex')
        return sign.toUpperCase()
    },
    // 统一下单接口加密获取sign
    paysignjsapi: function (appid,merchantKey, attach, body, mch_id, nonce_str, notify_url, openid, out_trade_no, spbill_create_ip, total_fee, trade_type) {
        var ret = {
            appid: appid,
            attach: attach,
            body: body,
            mch_id: mch_id,
            nonce_str: nonce_str,
            notify_url: notify_url,
            openid: openid,
            out_trade_no: out_trade_no,
            spbill_create_ip: spbill_create_ip,
            total_fee: total_fee,
            trade_type: trade_type
        }
        var string = this.object2raw(ret)
        string = string + '&key=' + merchantKey
        var crypto = require('crypto')
        var sign = crypto.createHash('md5').update(string, 'utf8').digest('hex')
        return sign.toUpperCase()
    },
    sign: function (data,merchantKey) {
        var string = this.object2raw(data)
        string = string + '&key=' + merchantKey
        var crypto = require('crypto')
        var sign = crypto.createHash('md5').update(string, 'utf8').digest('hex')
        return sign.toUpperCase()
    },
    querysign: function (appid,merchantKey, mch_id, nonce_str, transaction_id) {
        return this.sign({
            appid: appid,
            mch_id: mch_id,
            nonce_str: nonce_str,
            transaction_id: transaction_id
        },merchantKey)
    },
    refundsign: function (appid,merchantKey, mch_id, nonce_str, out_trade_no, total_fee, refund_fee, out_refund_no, op_user_id) {
        return this.sign({
            appid: appid,
            mch_id: mch_id,
            nonce_str: nonce_str,
            total_fee: total_fee,
            refund_fee: refund_fee,
            out_trade_no: out_trade_no,
            out_refund_no: out_refund_no,
            op_user_id: op_user_id,
        },merchantKey)
    }
    
}