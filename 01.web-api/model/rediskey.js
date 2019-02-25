module.exports = {
    USER_SET:"set:user-{0}",                       ///将用户的信息保存在redis的set中，{0}用户的token
    SYSTEMSETTNG:"hash:systemsetting",
    FORMCODE_LIST:"list:formcode:user-{0}",     //用于存储用户小程序提交的formcode
    /****************** */
    APP_INFO:"set:appinfo",                         ///存储了App的信息在此

    USER_MOBILE_VERIFYCODE:"key:verifycode:{0}",        ///存储手机接收的验证码
    /**************** */
    APP_MESSAGE_KEY: "hash:message-{0}",

    /*****团购链条 *****/
    GROUP_LINK_KEY:"key:grouporder:{0}:{1}",
    /********订单的过期键值 */
    ORDER_EXPIRE_KEY:"key:order:{0}:{1}",
    /*****物流记录缓存 */
    LOGISTICS_KEY:"key:logistics:{0}",

    appid:"wxef31174b9f28d7d3",

    /*********以下是第三方平台需要保存的key ************/
    COMPONENT_INFO:{
        TICKET:"key:ticket:{0}",
        ACCESS_TOKEN:"key:access_token:{0}",
        PRE_AUTH_CODE:"key:pre_auth_code:{0}"
    }
}