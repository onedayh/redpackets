/**
 * 封装基础的、固定的接口调用
 */
import request from './request';
import userUtil from '../user.js';
import commonjs from '../commonjs.js';

export default class appShare extends request {
    constructor() {
        super()
    }

    /**
     * 根据当前页面的路由地址，获取分享参数
     */
    getShareSetting(pageRouter) {
        return super.getRequest(`api/mini/system/share?route=${pageRouter}`, null, false);
    }

    /*
    * 记录分享者信息
    */
    recordShareInfo(shareId) {
        return super.getRequest('api/mini/system/setappshare', {shareid}, false)
    }

    /**
     * 执行小程序分享
     */
    doShare(instance) {
      // debugger;
        var _self = instance;
        var userinfo = userUtil.getUser();
        ///检查分享的参数中是否包含一些可变的参数
        var keydata = instance.data.shareinfo.keywords || {};
        ///替换关键字
        var title = commonjs.replaceKeyword(_self.data.shareinfo.title, keydata);
        ///替换掉分享链接里面的关键字
        let shareUrl = commonjs.replaceKeyword(_self.data.shareinfo.url, keydata);

        var shareId = commonjs.uuid();
        var joint = shareUrl.indexOf('?') > 0 ? '&' : '?';
        var retValue = {
            title: title,
            imageUrl: _self.data.shareinfo.image,
            path: shareUrl += joint + 'shareid=' + shareId,
        }
        keydata.url = retValue.path;
        console.log(keydata.url);
        /**
         * 调用接口，记录分享行为
         */
        super.postRequest('api/mini/system/share',
            {
                shareid:shareId,
                app: this.config.appid,
                route: retValue.path, /// 分享的当前页面地址
                param: JSON.stringify(keydata) ////附加参数
            }, false);
        return retValue;
    }

    /**
     * 将收集的formid发送给服务器进行保存
     */
    sendFormId(force = false) {
        let app = getApp();
        const {formIds} = app.globalData;
        if (formIds.length >= this.config.maxformidcount || force === true) {
            super.postRequest('api/mini/system/form', {formid: formIds.join(',')})
            ///清理
            app.globalData.formIds = [];
        }
    }

    /**
     * 获取平台后端的参数设置
     */
    getGlobalSetting() {
        return super.getRequest('api/mini/system/globalsetting');
    }
}