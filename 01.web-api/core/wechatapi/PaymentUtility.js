/**
 * 统一调用微信支付的接口工具类
 */
var co          = require('co');
var wxPay       = require('./WechatPay');
var wxConfig    = require('./wechatconfig');
class PaymentUtility{
    /**
     * 唤起微信支付
     * @param  params: 涉及支付需要的相关参数 
     */
    static *wechatPay(param){
        ////缺失相关的参数
        if (!param.appid || param.openid || param.txno || param.cost) return {successed:false};
        var wxApi           =   new wxPay(param.appid);
        ////调用微信支付接口进行支付
        let payData         =   yield wxApi.payOrder(
                                        param.openid,       ////发起支付的用户id
                                        param.txno,         ////支付产生的微信流水号
                                        null,   
                                        param.describ,      ///支付的内容描述 
                                        Math.round(param.cost * 100),       ///支付的金额
                                        wxConfig.notify_url ///支付成功后的回调地址
                                );
        /////返回支付结果
        return payData;
    }
}
exports = module.exports=PaymentUtility;

