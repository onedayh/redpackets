const app = getApp();
import basePage from '../../utils/page';

const pageInstance = new basePage(false, false);
Page(pageInstance.initializePage({
    data: {
        v: Math.random(),
        webViewShow: false,
        url: '',
    },
    onLoad(ops) {
        let {v} = this.data;
        let {url} = ops;
        let rightback = ops.rightback || '';
        ///rightback 用于网页加载完毕后就马上返回上个页面
        url = decodeURIComponent(url);
        // debugger;
        url = (url.indexOf('?') === -1) ? `${url}?v=${v}` : `${url}&v=${v}`;
        this.setData({
            url,
            webViewShow: true,
            rightback
        })
        console.log('url', url)
    },
    // 网页加载完
    bindload() {
        if (this.data.rightback) {
            setTimeout(() => {
                app.wxapi.navBack()
            }, 2000)
        }
    },
}))