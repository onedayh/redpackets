const app = getApp();
import Record from '../../utils/api/record';
import basePage from '../../utils/page';
import {pageSize} from '../../utils/config';

const pageInstance = new basePage(), record = new Record();
let page = 1;
Page(pageInstance.initializePage({
    data: {
        allocuser: [],    ///获得红包的用户
        isLoad: false,
        canPullUp: false,
        logo: null,    ////红包主头像
        topic: '',      ////红包主题
        createdate: '',   ////红包发放日期
        amount: 0,   ///发放的红包总额
        total: 0,     ////发放的红包总数量
        gotamount: 0,   ///已经领取的红包总额
        gottotal: 0,     ///已经领取的红包总数
        feedback: '',
        empty: {
            icon: 'redpacket_empty',
            msg: '领取记录',
            mTop: 200
        }
    },

    onLoad(opt) {
        ////加载当前的汇总记录
        page = 1;
        this.getSummary(opt.id);
        ////加载红包获取的用户记录
        this.getAllocList(opt.id, 1);
    },

    /***
     * 获取汇总记录
     * */
    getSummary(id) {
        record.allocInfo(id, 0).then(res => {
            this.setData({
                logo: this.data.imageBaseUrl + res.logo,    ////红包主头像
                topic: res.topic,      ////红包主题
                createdate: res.createdate,   ////红包发放日期
                amount: res.amount,   ///发放的红包总额
                total: res.total,     ////发放的红包总数量
                gotamount: res.gotamount,   ///已经领取的红包总额
                gottotal: res.gottotal,     ///已经领取的红包总数
            })
        })
    },

    /**
     * 获取领取到红包的明细用户记录
     */
    getAllocList(id, page) {
        record.allocInfo(id, 1, page).then(res => {
            const {data} = res, len = data.length;
            let allusers = this.data.allocuser.concat(data);
            this.setData({
                isLoad: true,
                allocuser: allusers,
                feedback: len < pageSize ? '没有更多了~' : '',
                canPullUp: len < pageSize ? false : true
            })
        }).catch(() => {
            this.setData({
                feedback: '加载失败，请上拉重试',
                canPullUp: true,
            })
            page --;
        })
    },
    /**
     * 上拉加载更多的领取红包的用户
     */
    moreAllocList() {
        if (!this.data.canPullUp0) return;
        this.setData({
            feedback: '加载中...',
            canPullUp0: false
        })
        this.getAllocList(this.options.id, page++);
    },
    /**
     * 触底
     */
    onReachBottom() {
        this.moreAllocList()
    }
}))