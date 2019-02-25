import config from '../../utils/config.js';
import regeneratorRuntime from '../../lib/regenerator-runtime/runtime';
const app = getApp();
Page({
  onLoad: function (options) {
    //console.log(options)
    if (options.img) {
      //console.log(ossBase + decodeURIComponent(options.img));
      this.setData({ backgroundImg: config.imageBaseUrl + decodeURIComponent(options.img) });
    }
  },
  async onShow(options) {
    let globalsetting = await app.appShare.getGlobalSetting();
    let homePageUrl = '/pages/square/square';
    if (globalsetting.successed) {
      ////启动的是送审模式,则显示图片给微信审核团队看
      if (globalsetting.setting.releasecode != 'on')
        wx.redirectTo({ url: homePageUrl })
    }
  }
})