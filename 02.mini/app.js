import wxapi from './utils/wxapi';
import appShare from './utils/api/share';
import userUtil from './utils/user';
import User from './utils/api/user';
import commonjs from './utils/commonjs.js'
const user = new User();
import regeneratorRuntime from './lib/regenerator-runtime/runtime';
import ald from './utils/ald/ald-stat';
App({
    async onLaunch() {
        await this.wxlogin();
        this.globalData.barTp = wx.getSystemInfoSync().statusBarHeight
    },
    onShow() {

    },
    onHide() {
        ///小程序关闭的时候，主动发送formid到服务器
        this.appShare.sendFormId(true);
    },
    appShare: new appShare(),
    wxapi: new wxapi(),         //常用的微信接口封装
    globalData: {
        userInfo: null,
        formIds: [],
        pagePt: 0,
        newCreate: false,
        createId: null
    },

    async wxlogin() {
        const code = await this.wxapi.login();
        const {data} = await user.register(code);
        this.globalData.userInfo = data;
        userUtil.setUser(data);
        /***用户的信息已经准备好了,页面需要通过用户信息加载数据的可以做事了 */
        if (this.userInfoReadyCallback) {
            this.userInfoReadyCallback({
                ...data
            })
        }
    }
})