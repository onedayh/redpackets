import regeneratorRuntime from '../../lib/regenerator-runtime/runtime';
const app = getApp();
Page({
  async onShow(options) {
    let globalsetting = await app.appShare.getGlobalSetting();
    console.log('globalsetting', globalsetting);
    let homePageUrl = '/pages/square/square';
    if (globalsetting.successed) {
      ////启动的是送审模式,则显示图片给微信审核团队看
      if (globalsetting.setting.releasecode == 'on')
        homePageUrl = '/pages/demo/mock?img=' + encodeURIComponent(globalsetting.setting.auditimage);
      if (wx.reLaunch)
        wx.reLaunch({ url: homePageUrl })
      else
        wx.redirectTo({ url: homePageUrl })
    }
  }
})