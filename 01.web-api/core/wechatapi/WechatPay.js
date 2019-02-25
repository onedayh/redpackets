/*
后台微信支付的相关代码
*/
var co              = require('co');
var WechatApi       = require('./WechatApi');
var fs              = require('fs');
var path            = require('path');
var rpc             = require('../rpc/rpcUtility');
var wxutility       = require('../utilities/wechatUtility');
var wxConfig        = require('./wechatconfig');
class WechatPay extends WechatApi{
    constructor(appid){
        super(appid);
    }
    /*
    * 支付订单，根据订单的信息
    * 调用微信支付，前端唤起微信支付窗口
    * */
    *payOrder(openid,orderno,attach,body,total_fee, notify_url) {
        ////获取当前唤起支付的商户必要信息
        let appinfo     = yield this.getAppInfo();
        var nonce_str   = wxutility.createNonceStr();
        var timeStamp   = wxutility.createTimeStamp();
        notify_url      = notify_url || wxConfig.notify_url;
        // console.log('appinfo',appinfo);
        var url = "https://api.mch.weixin.qq.com/pay/unifiedorder"
        var formData = "<xml>"
        formData +=         "<appid>" + appinfo.appId + "</appid>" //appid  
        formData +=         "<attach>" + attach + "</attach>" //附加数据  
        formData +=         "<body>" + body + "</body>"
        formData +=         "<mch_id>" + appinfo.wxmerchantId + "</mch_id>" //商户号  
        formData +=         "<nonce_str>" + nonce_str + "</nonce_str>" //随机字符串，不长于32位。  
        formData +=         "<notify_url>" + notify_url   + "</notify_url>"
        formData +=         "<openid>" + openid + "</openid>"
        formData +=         "<out_trade_no>" + orderno + "</out_trade_no>"
        formData +=         "<spbill_create_ip>61.50.221.43</spbill_create_ip>"
        formData +=         "<total_fee>" + total_fee + "</total_fee>"
        formData +=         "<trade_type>JSAPI</trade_type>"
        formData +=         "<sign>" + wxutility.paysignjsapi(appinfo.appId,appinfo.wxmerchantKey,attach, body,appinfo.wxmerchantId, nonce_str, notify_url, openid, orderno, '61.50.221.43', total_fee, 'JSAPI') + "</sign>"
        formData +=     "</xml>"

        var option = {url: url, method: 'POST', body: formData}
        var payData = yield rpc.request(option);
        if (payData.successed===true){
            var _reBodyXml = payData.body.toString('uft-8');
            // console.log('_reBodyXml',_reBodyXml);
            //取得return_code进行成功与否判断
            var _reCode = wxutility.getXMLNodeValue('return_code', _reBodyXml, false);
            if (_reCode == 'SUCCESS') {
                var prepay_id = wxutility.getXMLNodeValue('prepay_id', _reBodyXml, false);
                //签名  
                var _paySignjs = wxutility.paysignjs(appinfo.appId,appinfo.wxmerchantKey, nonce_str, 'prepay_id=' + prepay_id, 'MD5', timeStamp)
                var args = {
                    appId: appinfo.appId,
                    timeStamp: timeStamp,
                    nonceStr: nonce_str,
                    signType: "MD5",
                    package: 'prepay_id=' + prepay_id,
                    paySign: _paySignjs,
                    formData
                }
                return {successed:true,data: args}
            }
            else {
                return {successed:false,
                        message:wxutility.getXMLNodeValue('return_msg', _reBodyXml, false),
                        formData}
            }
        }
        return payData;
    }
    /*
    * 回应微信支付的结果回调
    * */
    *responsePayCallBack(req){
        //返回来的XML数据，现在是以express4.X的返回数据为例子，实际中要以实际数据进行解析
        var _reBody = req.body || req.rawBody;
        var _payInfo = _reBody.xml;
        var xml = `<xml>
            <return_code><![CDATA[FAIL]]></return_code>
            <return_msg><![CDATA[参数格式校验错误]]></return_msg>
        </xml>`;
        if (_payInfo) {
            if (_payInfo.return_code == 'SUCCESS') {
                //_payInfo.transaction_id
                var queryResult = yield this.queryOrder(_payInfo.appid, _payInfo.transaction_id);
                if (queryResult.successed       ==  true &&
                    queryResult.out_trade_no    == _payInfo.out_trade_no &&
                    queryResult.cash_fee        == _payInfo.cash_fee &&
                    queryResult.total_fee       == _payInfo.total_fee
                ){
                    xml = `
                        <xml>
                            <return_code><![CDATA[SUCCESS]]></return_code>
                            <return_msg><![CDATA[OK]]></return_msg>
                        </xml>`;
                    return {
                            successed:true,
                            xml,
                            appid:_payInfo.appid,
                            orderno:    _payInfo.out_trade_no,
                            paytotal:   _payInfo.cash_fee / 100.00,
                            attach:     _payInfo.attach
                            }
                }
            }
        }
        return {successed:false,xml}

    }
    /**
     * 
     * 订单金额
     * 退款金额
     * 商户订单号
     * 商户退款单号
     * 操作员
     * processRsult : 退款处理完毕后的回调
     */
    *refundOrder(total_fee,refund_fee,out_trade_no,out_refund_no,op_user_id,processRsult) {
        let appinfo    = yield this.getAppInfo()
        console.log('come in');
        var url = "https://api.mch.weixin.qq.com/secapi/pay/refund";
        var nonce_str = wxutility.createNonceStr();
        let certPath = path.join(__dirname,'../../cert/'+appinfo.wxmerchantCert);
        var pfx = fs.readFileSync(certPath);
        var formData = `
            <xml>
                <appid>`+ appinfo.appId + `</appid>
                <mch_id>`+ appinfo.wxmerchantId + `</mch_id>
                <nonce_str>`+ nonce_str + `</nonce_str>
                <op_user_id>`+ op_user_id + `</op_user_id>
                <out_refund_no>`+ out_refund_no + `</out_refund_no>
                <out_trade_no>`+ out_trade_no + `</out_trade_no>
                <refund_fee>`+ refund_fee + `</refund_fee>
                <total_fee>`+ total_fee + `</total_fee>
                <sign>`+ wxutility.refundsign(appinfo.appId,appinfo.wxmerchantKey, appinfo.wxmerchantId, nonce_str, out_trade_no, total_fee, refund_fee, out_refund_no, op_user_id) + `</sign>
            </xml>
        `;
        var option = {
            url: url,
            method: 'POST',
            body: formData,
            agentOptions: {
                pfx: pfx,
                passphrase: appinfo.wxmerchantId
            }
        };
        var refundData = yield rpc.request(option);

        if (refundData.successed===true){
            var _reBodyXml = refundData.body.toString('uft-8');
            //取得return_code进行成功与否判断
            var _reCode = wxutility.getXMLNodeValue('return_code', _reBodyXml, false);
            console.log('order query _reCode', _reCode)
            console.log('_reBodyXml', _reBodyXml)
            if (_reCode == 'SUCCESS') {
                var result_code = wxutility.getXMLNodeValue('result_code', _reBodyXml, false);
                if (result_code == 'SUCCESS') {
                    //var trade_state = wxutility.getXMLNodeValue('trade_state', _reBodyXml, false);
                    //console.log('order query trade_state', trade_state)
                    //if (trade_state == 'SUCCESS') {
                        var out_trade_no    = wxutility.getXMLNodeValue('out_trade_no', _reBodyXml, false);
                        var total_fee       = wxutility.getXMLNodeValue('total_fee', _reBodyXml, true);
                        var cash_fee        = wxutility.getXMLNodeValue('cash_fee', _reBodyXml, true);
                        ///退款成功后的处理
                        if (processRsult!=null && typeof(processRsult)==="function"){
                            processRsult(null,null,{appid: appinfo.appId, tradeno:out_trade_no,refundno:out_refund_no});
                        }
                        return {successed: true,out_trade_no,total_fee,cash_fee};
                    //}
                } else {
                    var err_code_des = wxutility.getXMLNodeValue('err_code_des', _reBodyXml, false);
                    console.log('err:', err_code_des);
                    ///退款成功后的处理
                    if (err_code_des=='订单已全额退款' && processRsult!=null && typeof(processRsult)==="function"){
                        processRsult(null,err_code_des,{appid: appinfo.appId, tradeno:out_trade_no,refundno:out_refund_no});
                    }
                    return {successed: false,msg:err_code_des};
                }
            }
            if (processRsult!=null && typeof(processRsult)==="function"){
                processRsult(true,
                         wxutility.getXMLNodeValue('return_msg', _reBodyXml, false),
                        {appid: appinfo.appId,tradeno:out_trade_no,refundno:out_refund_no});
            }
            return {successed: false,
                    message: wxutility.getXMLNodeValue('return_msg', _reBodyXml, false),
                    formData
                }
        }
        if (processRsult!=null && typeof(processRsult)==="function"){
            processRsult(true,
                    refundData.response,
                    {appid: appinfo.appId,tradeno:out_trade_no,refundno:out_refund_no});
        }
        return refundData;
    }
    /////查询订单
    *queryOrder(appid,transactionid) {
        let appinfo  = yield this.getAppInfo(appid)
        var url = "https://api.mch.weixin.qq.com/pay/orderquery";
        var nonce_str = wxutility.createNonceStr();
        var formData = `
            <xml>
                <appid>`+ appinfo.appId + `</appid>
                <mch_id>`+ appinfo.wxmerchantId + `</mch_id>
                <nonce_str>`+ nonce_str + `</nonce_str>
                <transaction_id>`+ transactionid + `</transaction_id>
                <sign>`+ wxutility.querysign(appinfo.appId,appinfo.wxmerchantKey, appinfo.wxmerchantId, nonce_str, transactionid) + `</sign>
            </xml>
        `;
        var option = {url: url, method: 'POST', body: formData}
        var queryData = yield rpc.request(option);
        if (queryData.successed===true){
            var _reBodyXml = queryData.body.toString('uft-8');
            //取得return_code进行成功与否判断
            var _reCode = wxutility.getXMLNodeValue('return_code', _reBodyXml, false);
            if (_reCode == 'SUCCESS') {
                var result_code = wxutility.getXMLNodeValue('result_code', _reBodyXml, false);
                console.log('order query result_code', result_code)
                if (result_code == 'SUCCESS') {
                    var trade_state = wxutility.getXMLNodeValue('trade_state', _reBodyXml, false);
                    console.log('order query trade_state', trade_state)
                    if (trade_state == 'SUCCESS') {
                        var out_trade_no    = wxutility.getXMLNodeValue('out_trade_no', _reBodyXml, false);
                        var total_fee       = wxutility.getXMLNodeValue('total_fee', _reBodyXml, true);
                        var cash_fee        = wxutility.getXMLNodeValue('cash_fee', _reBodyXml, true);
                        var attach          = wxutility.getXMLNodeValue('attach', _reBodyXml, true);
                        return {successed: true,out_trade_no,total_fee,cash_fee,attach};
                    }
                }
            }
            return{
                successed: false,
                message: wxutility.getXMLNodeValue('return_msg', _reBodyXml, false),
                formData
            };
        }
        return queryData;
    }
    /**
     * 通过微信商户账号转账到用户的微信零钱
     * @param {*} appid : 公众号或小程序的appid
     * @param {*} _openid  : 用户的 openid （唯一）
     * @param {*} orderno : 转账的订单id
     * @param {*} _amount : 转账金额
     */
    *transferMoneyToUser(_openid, orderno,_amount){
        let self = this;
        // return new Promise((resolve,reject)=>{
        //     co(function*(){
                let appInfo     =   yield self.getAppInfo(); 
                if (!appInfo) return {successed:false,orderno:orderno,errorcode:'获取商户信息失败'};
                var _preArray   = {
                    mch_appid: appInfo.appId, //this.config.appID,
                    mchid: appInfo.wxmerchantId,  //this.config.mch_id, //微信支付商户号
                    nonce_str: wxutility.createNonceStr(),
                    partner_trade_no: orderno , //订单号
                    openid: _openid || '',
                    check_name:"NO_CHECK",
                    amount:_amount,
                    desc:'转账到零钱',
                    spbill_create_ip: '127.0.0.1', //客户端ip
                };
                //取得xml请求数据体
                var _formData = wxutility.object2Xml(_preArray,appInfo.wxmerchantKey);
                //向微信服务端请求支付
                var pfx = fs.readFileSync(path.join(__dirname,'../../cert/'+appInfo.wxmerchantCert));
                var transferData = yield rpc.request({
                    url : self.config.transfermoney_url,
                    method : 'POST',
                    body : _formData,
                    agentOptions: {
                        pfx: pfx,
                        passphrase: appInfo.wxmerchantId
                    }
                });
                if (transferData.successed==false) return {successed:false,orderno:orderno,errorcode:1000};
                //返回来的XML数据
                var _reBodyXml = transferData.body.toString('uft-8');
                //console.log('return xml data ==', _reBodyXml);
                //取得return_code进行成功与否判断
                var _reCode = wxutility.getXMLNodeValue('return_code', _reBodyXml, false);
                var _resultCode = wxutility.getXMLNodeValue('result_code', _reBodyXml, false);
                if (_reCode=='SUCCESS' && _resultCode=='SUCCESS') //return Promise.resolve({successed:true,orderno:orderno});
                    return {successed:true,orderno:orderno};

                let errorcode = wxutility.getXMLNodeValue('err_code', _reBodyXml, false);
                    return {successed:false,orderno:orderno,errorcode:errorcode};
        //     })
        // });
    }
}
exports = module.exports = WechatPay