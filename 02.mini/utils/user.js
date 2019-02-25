/**
 * 封装了对本地存储中的当前用户对象的操作
 */
import regeneratorRuntime from '../lib/regenerator-runtime/runtime';
const USER_CACHE_KEY = "__userInfo";

export default class UserUtil {
    /*
     * 从本地存储中获取user对象
     */
    static getUser() {
        const userInfo = wx.getStorageSync(USER_CACHE_KEY);
        return userInfo ? JSON.parse(userInfo) : null;
    }

    /*
    * 缓存用户信息
    */
    static setUser(userData) {
        wx.setStorageSync(USER_CACHE_KEY, JSON.stringify(userData));
    }

    /**
     * 获取用户对象中的一个属性
     */
    static getKey(keyName) {
        let user = this.getUser();
        if (!user) return null;
        return user[keyName];
    }

    /***
     *  检测用户是否授权
     *  param : strongCheck,是否强检查，
     *  如果非强检查，则cache中有账号信息也可通过
     *  如果强检查，则一定需要wx.getSetting里面包含授权信息
     * */
    static async userIsAuthorized(strongCheck=false) {
      ///如果缓存中有用户的信息了包含了昵称，则直接认为用户已经授权
        //console.log('strong:',strongCheck );
        //console.log('nickName',this.getKey('nickName'))
      if (!strongCheck && this.getKey('nickName')) return true;
      ///否则通过wxapi检测用户是否授权
      let app = getApp();
      const scope = await app.wxapi.getSetting();
      return Object.keys(scope).indexOf('scope.userInfo') > -1 && scope['scope.userInfo']; 
    }
}