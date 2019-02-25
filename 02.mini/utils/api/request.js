import wxApi from '../wxapi';
const wxapi = new wxApi();
import config from '../config';
import userCache from '../user.js';
import commonjs from '../commonjs';
export default class request {
    constructor() {
        this.config = {
            appid: config.appid,
            apiBaseUrl: config.apiBaseUrl,
            imageBaseUrl: config.imageBaseUrl,
            maxformidcount: config.maxformidcount
        }
    }

    getRequest(url, data, isComplex = false) {
        return this.requestAll(url, data, 'GET', isComplex)
    }
  /**
   * 请求json静态文件
   */
  requestJson(url){
    return this.requestStaticFile(url)
        .then(res=>{
          return {data:res.data}})
  }

    postRequest(url, data, isComplex = false) {
        return this.requestAll(url, data, 'POST', isComplex)
    }

    putRequest(url, data, isComplex = false) {
        return this.requestAll(url, data, 'PUT', isComplex)
    }

    deleteRequest(url, data, isComplex = false) {
        return this.requestAll(url, data, 'DELETE', isComplex)
    }

    requestAll(url, data, method, isComplex = false) {
        return new Promise((resolve, reject) => {
            let fullurl = this.config.apiBaseUrl + url;
            if (commonjs.startWith(url,'http://') || commonjs.startWith(url,'https://')) fullurl = url;
            wx.request({
                url:fullurl,
                data,
                header: {
                    'content-type': 'application/x-www-form-urlencoded',
                    'appid': this.config.appid,
                    'Authorization': userCache.getKey('token')
                },
                method,
                success: res => {
                    if (res.statusCode === 200) {
                        const {data} = res;
                        if (data.successed) {
                            resolve(data)
                        } else {
                            if (!isComplex) {
                                wxapi.showToast(data.errmsg || '服务器错误')
                            } else {
                                reject(data)
                            }
                        }
                    } else {
                        wxapi.showToast(res.errMsg)
                    }
                },
                fail: () => {
                    wxapi.showToast('请求超时')
                }
            })
        })
    }
  /**
   * 请求文件资源
   */
  requestStaticFile(url) {
    return new Promise((resolve, reject) => {
      ///加上一串随机数，防止缓存
      url = url + "?v=" + new Date().getTime();
      let fullurl = this.config.imageBaseUrl + url;
      
      if (commonjs.startWith(url, 'http://') || commonjs.startWith(url, 'https://')) fullurl = url;
      wx.request({
        url: fullurl,
        method:'GET',
        success: res => {
          if (res.statusCode === 200) {
            resolve(res);
          } else {
            reject(res);
          }
        },
        fail: () => {
          wxapi.showToast('请求超时')
        }
      })
    })
  }
}