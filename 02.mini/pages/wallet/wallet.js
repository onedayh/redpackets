const app = getApp();
import acCount from '../../utils/api/account';
import basePage from '../../utils/page';
import {pageSize} from '../../utils/config';

const pageInstance = new basePage(), account = new acCount(), reg = /^[0-9]+([.]{1}[0-9]{1,2})?$/;
let page = 1;
Page(pageInstance.initializePage({
    data: {
        walletList: [],
        outMoney: '', // 提现金额
        isLoad: false,	// 是否首次加载
        canPullUp: false,	// 能否上拉加载
        feedback: '',  // 上拉加载 显示
        empty: {		// 数据为空显示
            msg: '流水记录',
            mTop: 100,
            icon: 'wallet_empty'
        }
    },

    onLoad() {
        app.wxapi.showLoading();
        page = 1;
        this.getCash();
        this.getCashRecord()
    },

    // 获取余额
    getCash() {
        account.getCash().then(res => {
            this.setData({
                balance: res.balance,
                minimaldraw: parseFloat(res.min_withdraw).toFixed(2)
            })
            wx.hideLoading();
        })
    },

    // 获取钱包记录
    getCashRecord() {
        account.getCashRecord(page).then(res => {
            const {data} = res, len = data.length;
            this.setData({
                walletList: data,
                isLoad: true,
                feedback: len < pageSize ? '没有更多了~' : '',
                canPullUp: len < pageSize ? false : true
            })
        })
    },

    // 全部提现
    allin() {
        const {balance} = this.data;
        if (balance == '0.00') {
            app.wxapi.showToast('您无余额可提现');
            return
        }
        this.setData({outMoney: this.data.balance})
    },

    bindinput(e) {
        this.setData({outMoney: e.detail.value})
    },

    // 提现
    cashOut(e) {
        const {outMoney} = this.data;
        const {formId} = e.detail;
        ////收集formid
        if (!reg.test(outMoney)) {
            app.wxapi.showToast('请输入正确的金额，小数点后可保留2位');
            pageInstance.collectFormid(formId);
            return;
        } else if (parseFloat(outMoney) < this.data.minimaldraw) {
            app.wxapi.showToast('提现金额未达到要求的提现最小金额');
            pageInstance.collectFormid(formId);
            return;
        }
        app.wxapi.showLoading('提现中...');
        account.cashOut(outMoney, formId).then(() => {
            app.wxapi.showToast('提现成功', 'success');
            app.aldstat.sendEvent('用户提现', {'用户提现': '用户提现'});
            page = 1;
            ////清空提现的数据
            this.setData({outMoney: ''});
            this.getCash();
            this.getCashRecord();
            wx.hideLoading();
        })
    },

    onReachBottom() {
        if (!this.data.canPullUp) return;
        this.setData({
            feedback: '加载中...',
            canPullUp: false
        })
        account.getCashRecord(page + 1).then(res => {
            const {data} = res, len = data.length;
            this.setData({
                walletList: this.data.walletList.concat(data),
                feedback: len < pageSize ? '没有更多了~' : '',
                canPullUp: len < pageSize ? false : true
            })
            page++;
        }).catch(err => {
            this.setData({
                feedback: '加载失败，请上拉重试',
                canPullUp: true
            })
        })
    }
}))