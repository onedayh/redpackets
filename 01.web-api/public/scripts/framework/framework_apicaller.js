var CACHE_USER_KEY = "user-storage";
var ApiCaller = {
    ///用LocalStorage保存
    cacheItem:function(key,value) {
        var storage=window.localStorage;
        if (typeof(value)!="string") value = JSON.stringify(value);
        storage.setItem(key,value);
    },
    ///获取LocalStorage的东西
    getItem:function(key,jsonFormat){
        if (jsonFormat==null) jsonFormat= true;
        var storage=window.localStorage;
        var stringValue=storage.getItem(key);
        if (jsonFormat){
            if (!$.isNullOrEmpty(stringValue)) return JSON.parse(stringValue); 
            return null;
        } 
        return stringValue;
    },
    ///检查用户是否在角色中
    userInRoles:function(roles){
        var storage=window.localStorage;
        var userString=storage.getItem(CACHE_USER_KEY); 
        if ($.isNullOrEmpty(userString)) return false;
        var userinfo = JSON.parse(userString);
        if (userinfo.super == 1) return true;
        var inRoles =   $.arrayIntersection(JSON.parse(userString).roles,roles);
        return inRoles.length>0;
    },
    ///清楚用户本地信息
    clearUser:function(){
        var storage=window.localStorage;
        storage.removeItem(CACHE_USER_KEY); 
    },
    ////获取当前的token
    getUser:function() {
        var storage=window.localStorage;
        var userString=storage.getItem(CACHE_USER_KEY); 
        if ($.isNullOrEmpty(userString)){
           this.redirectToLogin(true);
        } 
        return JSON.parse(userString); 
    },
    ///保存调用的Token
    setUser:function(value){
        this.cacheItem(CACHE_USER_KEY,value);
    },
    ////用户是否是超级管理者
    userIsSuper:function(){
        var storage=window.localStorage;
        var userString=storage.getItem(CACHE_USER_KEY); 
        if ($.isNullOrEmpty(userString)) return false;
         return JSON.parse(userString).super == 1; 
    },
    ////用户是否是管理者
    userIsAdmin:function(){
    var storage=window.localStorage;
    var userString=storage.getItem(CACHE_USER_KEY); 
    if ($.isNullOrEmpty(userString)) return false;
        return JSON.parse(userString).admin == 1; 
    },
    ///用户的菜单功能
    userMenu:function(){
        var storage=window.localStorage;
        var userString=storage.getItem(CACHE_USER_KEY); 
        if ($.isNullOrEmpty(userString)) return null;
         return JSON.parse(userString).functions; 
    },
    ///用户所拥有的角色
    userRoles:function(){
        var storage=window.localStorage;
        var userString=storage.getItem(CACHE_USER_KEY); 
        if ($.isNullOrEmpty(userString)) return null;
         return JSON.parse(userString).roles; 
    },
    ////当前用户的appid
    AppId:function(){
        var storage=window.localStorage;
        var userString=storage.getItem(CACHE_USER_KEY); 
        if ($.isNullOrEmpty(userString)) return null;
         return JSON.parse(userString).appid; 
    },
    redirectToLogin:function(withReturnUrl){
        var retUrl = '';
        if (withReturnUrl) retUrl ='?returnUrl='+encodeURIComponent(window.location.href)
        window.location.href=urlConfig.base.Root+'/login'+retUrl;
    },
    ////缓存所有的背景资源
    cacheResource2File(){
        this.Post({url:urlConfig.apiUrl.background.cache,
                    successFunc:function(result){
                        $.messager.alert('提示','数据缓存成功','info');
                    }
                })
    },
    ///调用api
    callApi:function(callOpt){
        var _self = this;
       if(callOpt.waitingMask==null) callOpt.waitingMask = true;

       if (callOpt.waitingMask) formHelper.loadingWait(callOpt.waitingMessage || "数据处理中...");
       if (callOpt.withToken==null) callOpt.withToken = true;
       if (!$.startWith(callOpt.url,'http://') && !$.startWith(callOpt.url,'https://'))
       {
           callOpt.url = urlConfig.base.ApiRoot+($.startWith(callOpt.url,'/')?'':'/')+callOpt.url;
       }
       var apiToken = {};
       if (callOpt.withToken) apiToken.authorization =_self.getUser().token;
       $.ajax({
                type:callOpt.type,
                url: callOpt.url,
                timeout:callOpt.timeout || 10000,    ////默认超时10秒
                headers : apiToken,                  ////调用时带上认证的Token
                data:callOpt.data,                   ////
                json:callOpt.json || true,
                crossDomain: true,
            })
            .done(function(data){
                   // alert(JSON.stringify(data));
                    if(data.successed)
                    {
                        if(callOpt.successFunc && typeof(callOpt.successFunc)==="function")
                            callOpt.successFunc(data);
                    }
                    else
                    {
                        if (data.errorcode==10000 || ////未认证
                            data.errorcode==9999 ||  ///Token 无效
                            data.errorcode==9998 ||  ///Token过期
                            data.errorcode==9100)   ///没有权限
                            _self.redirectToLogin(true);
                        else if(callOpt.failFunc && typeof(callOpt.failFunc)==="function")
                            callOpt.failFunc(data);
                    }
                })
            .fail(function(error){
                 if(callOpt.failFunc && typeof(callOpt.failFunc)==="function")
                        callOpt.failFunc({successed:false,errormessage:error.message});
            })
            .always(function(data,textStatus,error){
                if (error) console.log(error);
                // if (textStatus==='error')  _self.redirectToLogin(true);
                if (callOpt.waitingMask) formHelper.loadEnd(); 
            })
    },
    /*
    调用GET API
    */
    Get:function(option){
        option.type="GET";
        ApiCaller.callApi(option);
    },
    /*
    调用GET API
    */
    Delete:function(option){
        option.type="DELETE";
        ApiCaller.callApi(option);
    },
    /*
    调用Post方式的API
    */
    Post:function(option){
        option.type="POST";
        ApiCaller.callApi(option);
    },
    /*
    调用Post方式的API
    */
    Put:function(option){
        option.type="PUT";
        ApiCaller.callApi(option);
    }

}