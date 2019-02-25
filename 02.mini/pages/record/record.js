const app = getApp();
import Record from '../../utils/api/record';
import Create from '../../utils/api/create';
import basePage from '../../utils/page';
import {pageSize} from '../../utils/config';

const pageInstance = new basePage(), record = new Record(), create = new Create();
let page0 = 1, page1 = 1;
Page(pageInstance.initializePage({
    data: {
        acTab: 0,
        tabList: ['发出的红包', '收到的红包'],

        setList: [],
        isLoad0: false,
        canPullUp0: false,
        totalMoney0: 0,
        totalCount0: 0,
        feedback0: '',

        getList: [],
        isLoad1: false,
        canPullUp1: false,
        totalMoney1: 0,
        totalCount1: 0,
        feedback1: '',

        empty: {
            icon: 'redpacket_empty',
            msg: '红包记录',
            mTop: 200
        }
    },

    onLoad() {
        page0 = 1;
        page1 = 1;
        app.globalData.createFail = false;
        if(app.globalData.createId){
            let createId = app.globalData.createId;
            app.globalData.createId = null;
            app.wxapi.navTo(`canvas/canvas?id=${createId}`);
        }
        this.getTotal();
        this.setRecord();
    },

    changeTab(e) {
        const id = Number(e.currentTarget.id), {acTab, isLoad1} = this.data;
        if (id === acTab) return;
        this.getTotal(id);
        if (id === 1 && !isLoad1) this.getRecord();
        this.setData({
            acTab: id
        })
    },

    // 总记录
    getTotal(type = 0) {
        record.getTotal(type).then(res => {
            const {totalmoney, totalcount} = res;
            this.setData({
                totalMoney: totalmoney,
                totalCount: totalcount
            })
        })
    },


    // 收到红包记录
    getRecord() {
        record.getRecord(page1).then(res => {
            const {data} = res, len = data.length;
            this.setData({
                isLoad1: true,
                getList: data,
                feedback1: len < pageSize ? '没有更多了~' : '',
                canPullUp1: len < pageSize ? false : true
            })
        })
    },

    // 发出红包记录
    setRecord() {
        record.setRecord(page0).then(res => {
            const {data} = res, len = data.length;
            this.setData({
                isLoad0: true,
                setList: data,
                feedback0: len < pageSize ? '没有更多了~' : '',
                canPullUp0: len < pageSize ? false : true
            })
        })
    },

    goDetail(e) {
        const {type} = e.target.dataset;
        if(type === 'edit' || type === 'share' || type === 'back' || type === 'poster' || type === 'pay') return;
        app.wxapi.navTo(`record/alloced?id=${e.currentTarget.id}`)
    },

    // 预览二维码
    previewCode(e) {
        wx.previewImage({
            urls: [`${this.data.imageBaseUrl}${e.currentTarget.id}`]
        })
    },

    // 支付
    pay(e) {
        const {detail} = e;
        pageInstance.collectFormid(detail.formId);
        create.rePay(detail.target.id).then(res => {
            const {data} = res;
            wx.requestPayment({
                timeStamp: data.timeStamp,
                nonceStr: data.nonceStr,
                package: data.package,
                paySign: data.paySign,
                signType: data.signType,
                success: () => {
                    app.wxapi.showToast('塞钱成功', 'success', () => {
                        let {setList} = this.data;
                        setList[Number(detail.target.dataset.index)].status = 1;
                        this.setData({setList});
                        app.wxapi.navTo(`canvas/canvas?id=${detail.target.id}`)
                    })
                },
                fail: () => {
                    app.wxapi.showToast('塞钱失败');
                }
            })
        })
    },

    share(e) {
        pageInstance.collectFormid(e.detail.formId)
    },
    // 编辑
    edit(e) {
        console.log(e.currentTarget.id)
    },

    moreSetList() {
        if (!this.data.canPullUp0) return;
        this.setData({
            feedback0: '加载中...',
            canPullUp0: false
        })
        record.setRecord(page0 + 1, true).then(res => {
            const {data} = res, len = data.length;
            this.setData({
                setList: this.data.setList.concat(data),
                feedback0: len < pageSize ? '没有更多了~' : '',
                canPullUp0: len < pageSize ? false : true,
            })
            page0++
        }).catch(() => {
            this.setData({
                feedback0: '加载失败，请上拉重试',
                canPullUp0: true,
            })
        })
    },

    moreGetList() {
        if (!this.data.canPullUp1) return;
        this.setData({
            feedback1: '加载中...',
            canPullUp1: false
        })
        record.getRecord(page1 + 1, true).then(res => {
            const {data} = res, len = data.length;
            this.setData({
                getList: this.data.getList.concat(data),
                feedback1: len < pageSize ? '没有更多了~' : '',
                canPullUp1: len < pageSize ? false : true,
            })
            page1++
        }).catch(() => {
            this.setData({
                feedback1: '加载失败，请上拉重试',
                canPullUp1: true,
            })
        })
    },

    onReachBottom() {
        this.data.acTab ? this.moreGetList() : this.moreSetList()
    },
    /**
     * 分享红包
     */
    shareFormId(e) {
        pageInstance.collectFormid(e.detail.formId);
        app.aldstat.sendEvent('用户分享红包活动', {'用户分享红包活动': '用户分享红包活动'});
    },
    sharePacket(e) {
        console.log('e.detail', e.detail);
        let target = e.currentTarget;
        pageInstance.setPageKeywords({id: target.id}, {
            title: target.dataset.topic,
            image: this.data.imageBaseUrl + target.dataset.share,
            url: '/pages/index/index?id=' + target.id
        })
    },

    sharePoster(e){
        const {detail} = e;
        pageInstance.collectFormid(detail.formId);
        app.aldstat.sendEvent('用户查看海报', {'用户查看海报': '用户查看海报'});
        app.wxapi.navTo(`canvas/canvas?id=${detail.target.id}`);
    },

    goCanvas(e) {
        const {dataset} = e.currentTarget;
        if (dataset.status == 1 && dataset.roll == 0 && dataset.robbed == 0){
            app.aldstat.sendEvent('用户查看海报', {'用户查看海报': '用户查看海报'});
            app.wxapi.navTo(`canvas/canvas?id=${dataset.id}`)
        }
    },
    /**
     * 撤回红包金额
     */
    rollback(e) {
        pageInstance.collectFormid(e.detail.formId);
        let target = e.detail.target;
        app.wxapi.showModal('撤回后,剩余金额进入您的余额,此红包失效,确定要撤回吗?', res => {
            if(res.confirm){
                record.rollback(target.id).then(() => {
                    app.wxapi.showToast('金额已退回余额', 'success', () => {
                        let {setList} = this.data;
                        console.log(setList[Number(target.dataset.index)]);
                        setList[Number(target.dataset.index)].rollback = 1;
                        this.setData({setList})
                    })
                })
            }
        }, '撤回确认')
    }
}))