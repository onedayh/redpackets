/**
 * 页面的常用方法封装
 */
import regeneratorRuntime from '../lib/regenerator-runtime/runtime';
import commonjs from './commonjs';
import config from './config';
import userUtil from './user';
import User from './api/user';
const user = new User();

const defaultShareOption = {
    title: '大吉大利 恭喜发财',   ///页面默认的分享标题
    image: null,               ///页面的分享配图 ，默认截取当前页面
    url: null, ///页面的分享路径,默认为当前页面
    disbled: false               ////是否禁止分享，默认不禁止
}
const app = getApp();

export default class basePage {
    /**
     * 页面是否需要授权
     */
    constructor(hasNav = true, needAuthorization = false) {
        this._hasNav = hasNav;  // 是否需要顶部导航
        this._needAuthorization = needAuthorization;  // 是否需要用户授权头像/昵称
    }

    /**
     * 初始化页面
     */
    initializePage(pageOption) {
        /**初始化设置页面的分享**/
        let self = this;
        ///如果页面需要授权，则判断当前用户是否有授权
        ///并记录授权的属性，授权方式，由外部处理
        let authorizeObject = {};

        ////防止setKeyWord冲突，设置分享参数准备好的信号
        this.shareReady = false;
        return Object.assign({},
            pageOption,
            {
                /***初始化页面的一些基础数据 */
                data: {
                    ...pageOption.data,
                    imageBaseUrl: config.imageBaseUrl, ...authorizeObject,
                    userInfo: userUtil.getUser()
                },
                /**扩展了页面加载 */
                onLoad(e) {
                    self._pageInstance = self.getPageInstance();
                    self.getPageShareSetting();

                    // 如果需要顶部导航，设置页面padding-top
                    if(self._hasNav){
                        self._pageInstance.setData({
                            pagePt: app.globalData.pagePt
                        })
                    }
                    ////如果实例需要授权,则检测授权，并将结果赋值到data对象
                    if (self._needAuthorization) {
                        userUtil.userIsAuthorized(true).then(result => {
                            self._pageInstance.setData({
                                authorized: result,
                                showAuthorizationWnd: !result
                            })
                        })
                    }
                    /***执行基类的Onload之后，再执行开发者定义的onload */
                    self.pageLoad(e, pageOption.onLoad);

                    /*****
                     * 如果页面定义了数据加载，并且需要有用户的信息才能加载的
                     * 页面的方法中需要定义一个loadDataWithUserInfo
                     */
                    if (commonjs.isfunction(pageOption.loadDataWithUser)) {
                        // debugger;
                        ////如果global中已经有了userinfo的内容，则可以直接调用
                        if (app.globalData.userInfo && app.globalData.userInfo.userid) {
                            self._pageInstance.setData({userInfo: app.globalData.userInfo});
                            pageOption.loadDataWithUser.call(self._pageInstance, e, app.globalData.userInfo);

                        }
                        ///否则必须要等待app中UserInfo准备好了之后再调用
                        else {
                            app.userInfoReadyCallback = userData => {
                                // debugger;
                                self._pageInstance.setData({userInfo: userData});
                                pageOption.loadDataWithUser.call(self._pageInstance, e, userData);

                            }
                        }
                    }
                },
                /**在基类中实现了所有页面的右上角分享**/
                onShareAppMessage(e) {
                    pageOption.onShareAppMessage && pageOption.onShareAppMessage.call(self._pageInstance, e)
                    return self.sharePage(self._pageInstance);
                },
            }
        );
    }

    /**
     * 页面加载时调用
     */
    pageLoad(e, func) {

        /**如果页面的地址上有shareid的信息，则需要后台记录当前页面的分享者给当前用户 */
        if (e.query && e.query.shareid) setAppShare(e.query.shareid);


        ////获取后台的分享配置
        //this.getPageShareSetting();


        ///继续执行既有方法
        if (commonjs.isfunction(func))
            func.call(this._pageInstance, e);
    }

    /**
     * 执行页面分享
     */
    sharePage(pageInstance) {
        console.log(pageInstance.data.shareinfo);
        return app.appShare.doShare(pageInstance)
    }

    /**
     * 获取当前页面对象
     */
    getPageInstance() {
        let pages = getCurrentPages()    //获取加载的页面
        let currentPage = pages[pages.length - 1]    //获取当前页面的对象
        return currentPage;
    }

    /**
     * 进入当前页面的完整Url
     */
    getPageRoute(fullUrl = false) {
        let pages = getCurrentPages()    //获取加载的页面
        let currentPage = pages[pages.length - 1]    //获取当前页面的对象
        let url = currentPage.route    //当前页面url
        if (!fullUrl) return url;
        let options = currentPage.options    //如果要获取url中所带的参数可以查看options
        //拼接url的参数
        let urlWithArgs = [];
        for (var key in options) {
            ///不会将之前带入的shareid再次带出去
            if (key.toLowerCase() === "shareid") continue;
            var value = options[key]
            urlWithArgs.push(key + '=' + value);
        }
    }

    /**
     * 进入当前页面的完整Url
     */
    getPageRoute(fullUrl = false) {
        let pages = getCurrentPages()    //获取加载的页面
        let currentPage = pages[pages.length - 1]    //获取当前页面的对象
        let url = currentPage.route    //当前页面url
        if (!fullUrl) return url;
        let options = currentPage.options    //如果要获取url中所带的参数可以查看options
        //拼接url的参数
        let urlWithArgs = [];
        for (var key in options) {
            ///不会将之前带入的shareid再次带出去
            if (key.toLowerCase() === "shareid") continue;
            var value = options[key]
            urlWithArgs.push(key + '=' + value);
        }
        if (urlWithArgs.length == 0) return url;
        return url + '?' + urlWithArgs.join('&');
    }

    /**
     * 获取当前页面实例在后台配置的分享参数
     */
    getPageShareSetting() {
        let that = this;
        // 获取当前页面的路由
        let instance = this._pageInstance;
        let pageRoute = this.getPageRoute();// pages[pages.length - 1].route
        // 获取当前完整的带参数的url
        let fullUrl = this.getPageRoute(true);
        /**
         * 调用接口获取根据当前页面路由拿到的分享配置
         */
        app.appShare.getShareSetting(pageRoute)
            .then(result => {
                let originShareInfo = Object.assign({}, defaultShareOption, {url: fullUrl});
                if (result.shareinfo) {
                    originShareInfo = {
                        title: commonjs.checkValue(result.shareinfo.share_title, originShareInfo.title),
                        image: commonjs.isNullOrEmpty(result.shareinfo.share_image) ? null : (config.imageBaseUrl + result.shareinfo.share_image),
                        disabled: result.shareinfo.share_disabled,
                        url: commonjs.checkValue(result.shareinfo.share_url, fullUrl)
                    }
                }
                instance.setData({
                    shareinfo: {...originShareInfo}
                })
                // 如果不准分享,则禁用掉右上角的分享标记
                if (originShareInfo.disabled) wx.hideShareMenu()
                that.shareReady = true;
            })
    }

    /**
     * 检查用户是否有授权
     */
    async userIsAuthorized(strongCheck = false) {
        return await userUtil.userIsAuthorized(strongCheck);
    }

    /**
     * 执行用户授权
     * param : detail 由页面上getUserInfo 按钮带过来的信息
     */
    async doAuthorization(detail, toast = false) {
        let pageInstance = this._pageInstance;
        this.setUserAuthorized();
        return user.authorization(await app.wxapi.login(), detail.encryptedData, detail.iv).then(res => {
            const {data} = res;
            app.globalData.userInfo = data;
            userUtil.setUser(data);
            pageInstance.setData({
                userInfo: data
            })
            if(toast){
                app.wxapi.showToast('更新成功', 'success')
            }
        })
    }

    /**
     * 收集页面上按钮提交的formid,用于
     * 推送消息给当前用户
     */
    collectFormid(formId) {
        ///所有的页面采集的formid都存储
        ///在app.globalData中,当formid达到一定的数量
        ///就推送给后台存储
        let {formIds} = app.globalData || {};
        if (formId) formIds.push(formId);
        app.globalData.formIds = formIds;
        app.appShare.sendFormId(false);
    }

    /**
     * 设置用户授权结果
     */
    setUserAuthorized(result = true) {
        let pageInstance = this._pageInstance;
        if (!pageInstance) return;
        pageInstance.setData({authorized: result, showAuthorizationWnd: false});
    }

    /**
     * 设置页面分享时需要根据当前页面的一些
     * 关键数据信息进行分享
     */
    setPageKeywords(data, shareinfoParam) {
        let initialReady = this.shareReady;
        if (initialReady===true){
          let pageInstance = this._pageInstance;
          ////页面对象还没形成，不能设置分享的参数
          if (!pageInstance) return;
          let originalShare = pageInstance.data.shareinfo;
          if (shareinfoParam) {
            originalShare.image = shareinfoParam.image || originalShare.image;
            originalShare.title = shareinfoParam.title || originalShare.title;
            originalShare.url = shareinfoParam.url || originalShare.url;
          }
          let originKeyData = Object.assign({}, pageInstance.data.shareinfo.keywords, data);

          ///将页面分享的属性写入到Page的data
          pageInstance.setData({
            shareinfo: {
              ...originalShare,
              keywords: originKeyData
            }
          })
          console.log(originKeyData)
        }
        else
        {
          setTimeout(() => {
              this.setPageKeywords(data, shareinfoParam);
          }, 500)
        }
    }
}