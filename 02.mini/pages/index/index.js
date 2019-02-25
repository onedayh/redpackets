const app = getApp();
import regeneratorRuntime from '../../lib/regenerator-runtime/runtime';
import basePage from '../../utils/page';
import commonJs from '../../utils/commonjs';
import RedActive from '../../utils/api/active';

const redActive = new RedActive();

let audio = null,       // 背景音乐
    startTimer = null,  // 活动开始计时器
    endTimer = null,    // 活动结束计时器
    formId = null,      // 记录formid
    userPause = false;  // 记录用户主动暂停音乐
const pageInstance = new basePage(true, true);
Page(pageInstance.initializePage({
    data: {
        showBack: false,
        showIndex: false,
        isIpx: false,

        isLoad: false,
        redPacketStatus: null,  // 红包状态   1-已参与 2-未开始 3-已结束 4-已抢光
        group: [],      // 组团成员
        errorAnimation: {},
        endingText: '', //结束语1
        endingTip: '', //结束语2
        endingCount: '', //结束倒计时
        publicname: '',// 公众号名称
        musicPlay: true,

        tips: ''
    },

    onLoad(opts) {
        startTimer = null;
        endTimer = null;
        formId = null;
        userPause = false;
        audio = null;
        const sys = wx.getSystemInfoSync();
        if (sys.model.search('iPhone X') != -1) {
            this.setData({
                isIpx: true,
                topScale: sys.screenWidth / 750
            })
        }
        if (opts.from && opts.from === 'square') {
            this.setData({showBack: true})
        } else {
            this.setData({
                showIndex: true,
                tips: '去芝麻广场发现更多红包'
            })
        }
    },
    /**
     * 如果你需要使用用户的一些身份信息来加载数据，请定义这个方法
     * userData里面有当前用户的信息
     */
    async loadDataWithUser(e, userData) {
        this.getData()
    },

    // 获取数据
    getData() {
        app.wxapi.showLoading();
        redActive.getRedpacketPlay(this.options.id).then(res => {
            wx.hideLoading();
            ////如果活动需要关注公众号，则导向去微信认证页面
            if (res.requesturl) app.wxapi.navTo(`webview/webview?rightback=1&url=${encodeURIComponent(res.requesturl)}`);
            ////如果红包活动没有允许分享，则禁止分享
            if (res.share != 1) {
                wx.hideShareMenu()
            } else {
                ////设置分享的内容
                pageInstance.setPageKeywords({
                    id: this.options.id,
                    groupid: res.groupid
                }, {
                    title: res.topic,
                    image: res.shareimage ? this.data.imageBaseUrl + res.shareimage : null
                })
            }
            // 背景音乐
            if (res.bgmusic) audio = this.playAudio(this.data.imageBaseUrl + res.bgmusic);
            let {redPacketStatus} = this.data;
            let endingText = '', endingTip = '', endingCount = '';
            if (res.valid) {
                // 已参与
                if (res.played) {
                    redPacketStatus = 1;
                    this.redpacketStatusOne(res);
                } else {
                    if (res.enddate) endingCount = this.countTime(res.enddate);
                }
            } else {
                const {errcode} = res;
                if (errcode === 99) {
                    // 未开始
                    redPacketStatus = 2;
                    endingText = '距离开始还有';
                    endingTip = this.countTime(res.startdate)
                } else if (errcode === 98) {
                    // 已结束
                    redPacketStatus = 3;
                    endingText = '活动已结束';
                    endingTip = '欢迎下次参加'
                } else if (errcode === 97) {
                    // 已抢光
                    redPacketStatus = 4;
                    endingText = '红包被抢光了';
                    endingTip = '下次早点参加吧'
                } else if (errcode === 100) {
                    // 不存在
                    redPacketStatus = 4;
                    endingText = '红包不存在';
                    endingTip = '请确认后参与'
                } else {
                    app.wxapi.showToast(res.errmsg)
                }
            }
            const layout = res.layout ? JSON.parse(res.layout) : null;
            const {topScale, pagePt} = this.data;
            this.setData({
                redpacket: res,
                layout,
                btnT: layout && layout.btnT ? layout.btnT : 0,
                wrapT: layout && layout.wrapT ? layout.wrapT : 0,
                isLoad: true,
                redPacketStatus,
                endingText,
                endingTip,
                endingCount
            }, () => {
                // 2，3，4
                if (redPacketStatus && redPacketStatus !== 1) {
                    this.handleErrorAnimation('show');
                    if (redPacketStatus === 2 && endingTip.indexOf(':') > -1) {
                        startTimer = setInterval(() => {
                            const time = this.countTime(res.startdate);
                            this.setData({
                                endingTip: time
                            })
                            if (time === '00 : 00 : 00') {
                                clearInterval(startTimer);
                                this.handleErrorAnimation('hide');
                                this.setData({
                                    redPacketStatus: null
                                })
                            }
                        }, 1000)
                    }
                } else if (!redPacketStatus) {
                    if (endingCount.indexOf(':') > -1) {
                        endTimer = setInterval(() => {
                            const time = this.countTime(res.enddate);
                            this.setData({
                                endingCount: time
                            })
                            if (time === '00 : 00 : 00') {
                                clearInterval(endTimer);
                                this.handleErrorAnimation('show');
                                this.setData({
                                    redPacketStatus: 3,
                                    endingCount: '',
                                    endingText: '本次活动已结束',
                                    endingTip: '欢迎下次参加'
                                })
                            }
                        }, 1000)
                    }
                }
            })
            wx.hideLoading();
        })
    },

    onShow(){
        if (audio && !userPause) audio.play()
    },

    onHide() {
        if (audio && !audio.paused) audio.pause()
    },

    onUnload() {
        clearInterval(startTimer);
        clearInterval(endTimer);
        if (audio) audio.stop()
    },
    // 开红包按钮
    async handleOpen(e) {
        formId = e.detail.formId;
        const hasUserScope = await pageInstance.userIsAuthorized(true);
        if (!hasUserScope) return;
        // 未授权 终止
        app.wxapi.showLoading();
        this.openRedpacket()
    },

    handleShare(e) {
        ///简单记录formid
        pageInstance.collectFormid(e.detail.formId);
        app.aldstat.sendEvent('用户分享红包活动', {'用户分享红包活动': '用户分享红包活动'});
    },

    redpacketStatusOne(res, type = '') {
        let lack = 0, group = [], navigateMini = null;
        ////如果打开是需要进行裂变的红包
        if (res.groupid) {
            const {groupinfo} = res;
            lack = Number(res.groupcount) - groupinfo.current;
            group = groupinfo.user;
            pageInstance.setPageKeywords({groupid: res.groupid})
        }
        if (res.navigateMini) {
            navigateMini = res.navigateMini
        }
        if (lack > 0) {
            for (let i = 0; i < lack; i++) {
                group.push({avatarUrl: '../../images/icon_add.png', money: '', nickName: ''})
            }
        }
        let obj = {
            navigateMini,
            group,
            lack,
            'redpacket.groupsuccess': lack > 0 ? false : true,
            money: res.money,
        };
        if (type === 'set') obj = {...obj, type: 'set', redPacketStatus: 1};
        this.setData(obj)
    },

    // 开红包
    openRedpacket() {
        redActive.openRedpacket(formId, this.options.id, this.options.groupid || '').then(res => {
            wx.hideLoading();
            const {errcode} = res;
            if (errcode === 1) {
                app.wxapi.showToast(res.errmsg);
                return;
            } else if (errcode === -1) {
                // 被抢光
                this.setData({
                    redPacketStatus: 4,
                    endingText: '红包被抢光了',
                    endingTip: '下次早点参加吧'
                })
                this.handleErrorAnimation('show');
                return;
            }
            app.aldstat.sendEvent('用户拆红包', {'用户拆红包': '用户拆红包'});
            this.redpacketStatusOne(res, 'set')
        }).catch(err => {
            const {errcode, publicname, command} = err;
            wx.hideLoading();
            if (errcode === 101) {
                // 关注公众号
                this.setData({publicname, command})
            } else {
                app.wxapi.showToast(err.errmsg)
            }
        })
    },
    /**
     * 跳转小程序
     */
    navigateToApp(e) {
        let appid = e.currentTarget.appid;
        let redid = this.options.id;
        wx.navigateToMiniProgram({
            appId: '',
            path: 'pages/index/index?id=123',
            extraData: {},
            envVersion: 'develop',
            success(res) {
                ///简单的和后台交互一下，记录引流
                redActive.diversion(appid, redid)
            }
        })
    },
    // 被抢光动画
    handleErrorAnimation(type) {
        const animation = wx.createAnimation({
            duration: 1000,
            timingFunction: 'ease',
        })
        this.animation = animation;
        animation.top(type === 'show' ? 0 : type === 'hide' ? '-100%' : '').step();
        this.setData({
            errorAnimation: animation.export()
        })
    },

    // 音乐控制
    musicControl() {
        if (audio.paused) {
            audio.play();
            userPause = false;
        } else {
            audio.pause();
            userPause = true;
        }
    },

    // 播放背景音乐
    playAudio(src) {
        const innerAudioContext = wx.createInnerAudioContext();
        innerAudioContext.autoplay = true;
        innerAudioContext.src = src;
        innerAudioContext.loop = true;
        innerAudioContext.onPlay(() => {
            this.setData({musicPlay: true})
        })
        innerAudioContext.onPause(() => {
            this.setData({musicPlay: false})
        })
        innerAudioContext.onError(res => {
            console.log(res.errMsg)
            console.log(res.errCode)
        })
        return innerAudioContext
    },

    // 获取用户信息
    async getUserInfo(e) {
        const hasUserScope = await pageInstance.userIsAuthorized(true);
        if (!hasUserScope) return;
        // 拒绝授权 终止
        app.wxapi.showLoading();
        pageInstance.doAuthorization(e.detail).then(() => {
            this.openRedpacket()
        });
    },

    changeAuth(e) {
        this.setData({
            showAuthorizationWnd: false,
            authorized: e.detail.change
        })
    },

    countTime(time) {
        // 现在的时间戳
        const now = commonJs.timeToTimestamp();
        // 活动开始(结束)的时间戳
        const aimTime = commonJs.timeToTimestamp(time);
        const dValue = Math.abs(now - aimTime);
        const oneDay = 86400;
        if (dValue > oneDay) {
            return `${Math.floor(dValue / oneDay)}天`
        } else {
            const hours = Math.floor(dValue / 3600);
            const exceptHours = dValue - hours * 3600;
            const minute = Math.floor(exceptHours / 60);
            const second = Math.floor(exceptHours - minute * 60);
            // console.log(1, hours, minute, second);
            return `${commonJs.formatNum(hours)} : ${commonJs.formatNum(minute)} : ${commonJs.formatNum(second)}`
        }
    },
    modelYes() {
        this.setData({publicname: ''})
    },

    // 提现
    pickCash(e) {
        pageInstance.collectFormid(e.detail.formId);
        app.wxapi.navTo('wallet/wallet')
    },

    goSquare() {
        app.wxapi.tabTo('square/square')
    },

    luOnce() {
        const {navigateMini} = this.data;
        if (navigateMini) {
            const {appid, path} = navigateMini;
            wx.navigateToMiniProgram({
                appId: appid,
                path,
                success: () => {
                    redActive.diversion(appid, this.options.id)
                },
                fail: () => {
                    console.log('取消跳转')
                }
            })
        } else {
            app.wxapi.tabTo('create/create')
        }
    }
}))

