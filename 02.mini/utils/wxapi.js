import config from './config';
import userUtil from './user';
import regeneratorRuntime from '../lib/regenerator-runtime/runtime';

export default class wxapi {
    /*
    *微信小程序API类
    */

    // 加载
    showLoading(
        title = '加载中...',
        mask = true
    ) {
        wx.showLoading({
            title,
            mask
        })
    }

    // 提示
    showToast(
        title,
        icon = 'none',
        sucFn = () => {
        },
        duration = 1500,
        mask = true
    ) {
        wx.showToast({
            title,
            icon,
            duration,
            mask,
            success: () => {
                return setTimeout(sucFn, duration)
            }
        })
    }

    // 弹窗
    showModal(
        content,
        sucFn = () => {
        },
        title = '提示',
        showCancel = true,
        confirmText = '确定',
        cancelText = '取消'
    ) {
        wx.showModal({
            title,
            content,
            confirmText,
            cancelText,
            showCancel,
            success: res => {
                return sucFn(res)
            }
        })
    }

    // 操作菜单
    showActionSheet(
        itemList,
        sucFn = () => {
        },
    ) {
        wx.showActionSheet({
            itemList,
            success: res => {
                return sucFn(res.tapIndex)
            }
        })
    }

    // 路由
    navTo(url) {
        wx.navigateTo({
            url: `/pages/${url}`
        })
    }

    redTo(url) {
        wx.redirectTo({
            url: `/pages/${url}`
        })
    }

    tabTo(url) {
        wx.switchTab({
            url: `/pages/${url}`
        })
    }

    relTo(url) {
        wx.relaunch({
            url: `/pages/${url}`
        })
    }

    navBack(
        delta = 1,
        sucFn = () => {
        },
    ) {
        wx.navigateBack({
            delta,
            success: () => {
                return sucFn
            }
        })
    }

    // 登录
    login() {
        return new Promise(resolve => {
            wx.login({
                success: res => {
                    resolve(res.code)
                }
            })
        })
    }

    // 上传文件
    uploadFile(url, filePath, name, formData = {}) {
        return new Promise(resolve => {
            wx.uploadFile({
                url: config.apiBaseUrl + url,
                filePath,
                name,
                header: {
                    'content-type': 'application/x-www-form-urlencoded',
                    'appid': config.appid,
                    'Authorization': userUtil.getKey('token')
                },
                formData,
                success: res => {
                    resolve(res.data)
                },
                fail: () => {
                    resolve('')
                }
            })
        })
    }

    // 选择图片
    chooseImage(count) {
        return new Promise(resolve => {
            wx.chooseImage({
                count,
                success: res => {
                    resolve(res.tempFilePaths)
                },
                fail: () => {
                    resolve('')
                }
            })
        })
    }

    // 授权
    getSetting() {
        return new Promise(resolve => {
            wx.getSetting({
                success: res => {
                    resolve(res.authSetting)
                }
            })
        })
    }

    openSetting() {
        return new Promise(resolve => {
            wx.openSetting({
                success: res => {
                    resolve(res.authSetting)
                }
            })
        })
    }

    // 收货地址
    chooseAddress() {
        return new Promise(resolve => {
            wx.chooseAddress({
                success: res => {
                    resolve(res)
                }
            })
        })
    }

    // 设置标题
    setTitle(title){
        wx.setNavigationBarTitle({
            title
        })
    }

    // 获取图片信息
    getImageInfo(src){
        return new Promise(resolve => {
            wx.getImageInfo({
                src,
                success: res => {
                    console.log(res)
                    resolve(res)
                },
                fail: () => {
                    resolve('')
                }
            })
        })
    }

    // 获取某项授权
    async getSomeSetting(setting, doSomething, callback) {
        // 获取授权信息
        const auth = await this.getSetting();
        if(auth){
            if (Object.keys(auth).indexOf(setting.type) === -1 || auth[setting.type]) {
                return doSomething()
            } else if (!auth[setting.type]) {
                this.showModal(`你已拒绝${setting.name}授权，请按确定前往新页面选中"${setting.name}"重新授权`, res => {
                    if(res.confirm){
                        this.openSettingAfter(doSomething);
                        if(arguments.length > 2) return callback()
                    }
                })
            }
        }
    }

    // 打开微信授权页面
    async openSettingAfter(doSomething) {
        const scope = await this.openSetting();
        if(scope['scope.address'])  return doSomething()
    }

    showTabBar(animation = true){
        wx.showTabBar({
            animation: animation
        })
    }

    hideTabBar(animation = true){
        wx.hideTabBar({
            animation: animation
        })
    }
}