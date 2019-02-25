exports = module.exports = {
        appid:'wxef31174b9f28d7d3',
        merchantInfo:{
                merchantid      :'59e9c958-3df5-11e8-8ba8-a9e47cbf482d',
                appId           :'wxef31174b9f28d7d3',
                appSecret       :'f320eb210bd1cab252f5e19eeec40c75',
                wxmerchantId    :'1464858302',
                wxmerchantKey   :'LiteCODER20161227HYaK166ZwehaPPy',
                wxmerchantCert  :'apiclient_cert.p12',
                smsappid        :'1400156061',
                smsappkey       :'6979b5a8254441113b5e3de5a79e72b5',
                token           :null
        },
        prefix: "https://api.weixin.qq.com/cgi-bin/",
        mpPrefix: "https://mp.weixin.qq.com/cgi-bin/",
        // 获取微信基础access-token的url
        accessTokenUrl: 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential',
        // 获取微信网页授权所需的jsapi-ticket的url
        ticketUrl: 'https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=',
        // 微信支付是否支持信用卡支付
        limit_pay: 'no_credit',
        // 微信小程序消息推送url
        message_url: 'https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=',
        // 微信支付回调通知支付结果
        notify_url: 'http://mall.litecoder.com/api/mini/payment/callback',
        //微信支付统一下单的prepay_id的url
        prepay_id_url: 'https://api.mch.weixin.qq.com/pay/unifiedorder',
        ///微信企业转账url
        transfermoney_url:'https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers',
        //正式环境的微信端auth2.0网页授权回调URL
        webAuthCallbackUrl: 'http://grab.litecoder.com/api/mini/web/authorized',
        //微信网页授权第一步所要请求获得code的URL
        webAuthCodeUrl: 'https://open.weixin.qq.com/connect/oauth2/authorize?',
        //微信网页授权所需的access_token，用于获取到用户的openid等信息
        webAuthTokenUrl: 'https://api.weixin.qq.com/sns/oauth2/access_token?',
        ////第三方平台的配置
        thirdplatform:{
                appid:'wx0da6fcbf7c560eb5',
                appkey:'cbf10e5936ce49504db84a1297227d8c',
                token:'ILoveJessICAForEVER',
                aeskey:'ILoveJessICAForEVERILoveJessICA4orEVERLiter',
                ////引导用户授权后跳转的url
                authorizeurl:'http://mall.litecoder.com/api/wechat/component/authorized/',
                ////小程序的域名
                requestdomain:[
                                'https://mall.litecoder.com',
                                'https://wx.qlogo.cn',
                                'https://litecoder-1255585317.file.myqcloud.com'
                               ],
                wsrequestdomain:[],
                uploaddomain:[
                        'https://mall.litecoder.com',
                        'https://litecoder-1255585317.file.myqcloud.com'
                       ],
                downloaddomain:[
                        'https://mall.litecoder.com',
                        'https://wx.qlogo.cn',
                        'https://litecoder-1255585317.file.myqcloud.com'
                       ],
                webviewdomain:['https://mall.litecoder.com']

        }
}