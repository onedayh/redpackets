const app = getApp();
import basePage from '../../utils/page';
import userUtil from '../../utils/user';
import Create from '../../utils/api/create';
import commonjs from '../../utils/commonjs.js';
import config from '../../utils/config.js';
import regeneratorRuntime from '../../lib/regenerator-runtime/runtime';
let someMusic = null,
    scale = 0,
    otherShow = false,
    startRecordTime = 0,
    myRecord = null;
const pageInstance = new basePage(), create = new Create(), reg = /^[0-9]+([.]{1}[0-9]{1,2})?$/;
Page(pageInstance.initializePage({
    data: {
        showIndex: true,
        playList: ['直接开红包', '邀好友合开'],
        logo: null,
        topic: '',
        bless: '',
        playType: 0,		// 红包玩法 1-拼团 0-直接拆
        shareImage: null,
        openType: 0,		// 金额分配方式 0-拼手气 1-普通
        people: 2,
        peopleList: [2, 3, 4],
        money: '',
        isPublic: false,
        num: '',
        pickerIndex: 0,
        showMoney: 0,

        templateList: [],
        musicList: [],

        currentTemplate: 0,
        selectTemplate: null,

        currentMusic: -1,
        selectMusic: null,

        temAnimation: null,
        showTem: false,
        showMusic: false,
        playing: false,
        serviceMoney: 0,

        showRecord: false,
        recordText: '长按开始录制',

        blessList: [],
        showBless: false
    },

    // 初始化
    async init() {
        otherShow = false;
        const {setting} = await app.appShare.getGlobalSetting();
        scale = Number(setting.servicerate) / 100;
        someMusic = null;
        this.setData({
            logo: userUtil.getKey('avatarUrl'),
            topic: '',
            bless: '',
            defaulttopic: commonjs.replaceKeyword(setting.topic),   ///默认的红包主题
            defaultbless: setting.bless, ///默认的红包祝福
            helpImage: setting.helper,
            playType: 0,		// 红包玩法 1-拼团 0-直接拆
            shareImage: null,
            openType: 0,		// 金额分配方式 0-拼手气 1-普通
            people: 2,
            money: '',
            isPublic: false,
            num: '',
            pickerIndex: 0,
            showMoney: 0,
            currentTemplate: 0,
            selectTemplate: null,
            currentMusic: -1,
            selectMusic: null,
            temAnimation: null,
            showTem: false,
            showMusic: false,
            playing: false,
            serviceMoney: 0
        })
        this.loadBackgroundData();
    },

    onShow() {
        app.wxapi.hideTabBar();
        if (otherShow){
            setTimeout(() => {
                otherShow = false;
            }, 1000)
        }else {
            this.init()
        }
    },

    onHide() {
        if (otherShow) return;
        this.closeMusic();
        this.runAnimation('tem', 'hide');
        this.setData({
            showIndex: true
        })
    },

    // 修改头像
    async changeLogo() {
        otherShow = true;
        const files = await app.wxapi.chooseImage(1);
        if (files) {
            app.wxapi.showLoading('图片上传中...');
            const updateItem = await app.wxapi.uploadFile('fileupload/redbaglogo', files[0], 'image');
            if (updateItem) {
                this.setData({
                    logo: JSON.parse(updateItem)[0].path
                })
                wx.hideLoading()
            } else {
                app.wxapi.showToast(`上传图片失败`)
            }
        }
    },

    // 改变玩法
    changePlayType(e) {
        const id = Number(e.currentTarget.id);
        if (id === this.data.playType) return;
        this.setData({playType: id})
    },

    // 改变红包分配方式
    changeOpenType() {
        const {num, money, openType} = this.data;
        let showMoney = 0, serviceMoney = 0;
        if (openType) {
            // 改为拼手气
            if (money > 0 && reg.test(money)) {
                showMoney = (money * (1 + scale)).toFixed(2);
                serviceMoney = (money * scale).toFixed(2);
            }
        } else {
            // 改为普通
            if (money > 0 && reg.test(money) && num > 0) {
                showMoney = (money * num * (1 + scale)).toFixed(2);
                serviceMoney = (money * num * scale).toFixed(2);
            }
        }
        this.setData({
            openType: openType ? 0 : 1,
            showMoney,
            serviceMoney
        })
    },

    inuptTopic(e) {
        this.setData({topic: e.detail.value})
    },
    inputBless(e) {
        this.setData({bless: e.detail.value})
    },
    inputMoney(e) {
        this.setData({money: e.detail.value})
    },
    inputNum(e) {
        this.setData({num: e.detail.value})
    },


    blurNum() {
        let {money, openType, num} = this.data;
        let showMoney = 0, serviceMoney = 0;
        if (money && reg.test(money)) {
            if (openType) {
                // 普通红包
                num = num || 0;
                showMoney = (money * num * (1 + scale)).toFixed(2);
                serviceMoney = (money * num * scale).toFixed(2);
                this.setData({
                    showMoney,
                    serviceMoney
                });
            }
        } else {
            app.wxapi.showToast('请输入正确的金额，小数点后可保留2位');
            this.setData({
                showMoney,
                serviceMoney
            })
        }
    },

    // 输入完金额
    blurMoney() {
        let {money, openType, num} = this.data;
        let showMoney = 0, serviceMoney = 0;
        if (money && reg.test(money)) {
            if (money > 200 || money < 1) {
                app.wxapi.showToast('红包金额1-200元');
                this.setData({
                    money: '',
                    showMoney: 0,
                    serviceMoney: 0
                });
                return;
            }
            if (openType) {
                // 普通红包
                num = num || 0;
                showMoney = (money * num * (1 + scale)).toFixed(2);
                serviceMoney = (money * num * scale).toFixed(2)
            } else {
                // 拼手气
                showMoney = (money * (1 + scale)).toFixed(2);
                serviceMoney = (money * scale).toFixed(2)
            }
        } else {
            app.wxapi.showToast('请输入正确的金额，小数点后可保留2位');
        }
        this.setData({
            showMoney,
            serviceMoney
        });
    },


    // 选择拼团人数
    pickerChange(e) {
        const {value} = e.detail, {peopleList} = this.data;
        this.setData({
            pickerIndex: value,
            people: peopleList[value]
        })
    },

    // 是否公开
    changePublic(e) {
        this.setData({isPublic: e.detail.value})
    },

    // 选择模板
    chooseTemplate() {
        this.runAnimation('tem', 'show')
    },

    // 获取模板数据
    /**
     * 获取模板数据，修改为加载json缓存文件形式
     */
    loadBackgroundData() {
        create.getBackgroundResouce().then(res => {
            let {background, music, topic} = res.data;
            //背景
            let currentTemplate = -1, selectTemplate = null;
            currentTemplate = background.findIndex(item => item.isdefault === 1);
            if (currentTemplate >= 0) selectTemplate = background[currentTemplate];

            //音乐
            let currentMusic = -1, selectMusic = null;
            music = music.map((item, index) => ({...item, webIndex: index}));
            currentMusic = music.findIndex(item => item.isdefault === 1);
            if (currentMusic >= 0) selectMusic = music[currentMusic];

            this.setData({
                templateList: background,
                currentTemplate,
                selectTemplate,
                musicList: music,
                currentMusic,
                selectMusic,
                blessList: topic
            })
        })
    },

    // 选择音乐
    chooseMusic() {
        this.runAnimation('music', 'show')
    },

    willBless(){
        this.runAnimation('bless', 'show')
    },

    chooseBless(e){
        this.setData({
            bless: e.currentTarget.dataset.content
        })
        this.runAnimation('bless', 'hide')
    },

    // 左右切换模板
    changeTemplate(e) {
        this.setData({
            currentTemplate: e.detail.current
        })
    },

    // 确定选择模板
    selectTemplate(e) {
        const {dataset} = e.currentTarget;
        if (Number(dataset.index === this.data.currentTemplate)) {
            this.setData({
                selectTemplate: dataset.tem,
            })
            this.runAnimation('tem', 'hide')
        }
    },

    // 动画
    runAnimation(name, type) {
        const animation = wx.createAnimation({
            duration: 500,
            timingFunction: 'ease',
        })
        this.animation = animation;
        let top = '', obj = {};
        if (name === 'tem') {
            if (type === 'show') {
                obj = {showTem: true, showIndex: false};
                top = 0;
            } else if (type === 'hide') {
                obj = {showTem: false, showIndex: true};
                top = '100%';
            }
            animation.top(top).step();
            obj = {...obj, temAnimation: animation.export()}
        } else if (name === 'music') {
            if (type === 'show') {
                obj = {showMusic: true, showBless: false, showIndex: false};
                top = 0;
            } else if (type === 'hide') {
                obj = {showMusic: false, showIndex: true};
                top = '100%';
            }
            animation.top(top).step();
            obj = {...obj, musicAnimation: animation.export()}
        }else if(name === 'bless'){
            if(type === 'show'){
                obj = {showBless: true, showMusic: false, showIndex: false};
                top = 0
            }else if (type === 'hide') {
                obj = {showBless: false, showIndex: true};
                top = '100%';
            }
            animation.top(top).step();
            obj = {...obj, musicAnimation: animation.export()}
        }
        this.setData(obj)
    },

    listen(e) {
        const {index, file} = e.currentTarget.dataset;
        const {playing, currentMusic, imageBaseUrl} = this.data;
        if (someMusic) someMusic.stop();
        if (currentMusic === index && playing) {
            this.setData({currentMusic: -1})
        } else {
            this.playMusic(imageBaseUrl + file, index)
        }
    },

    playMusic(src, index) {
        someMusic = wx.createInnerAudioContext();
        someMusic.autoplay = true;
        someMusic.src = src;
        someMusic.onPlay(() => {
            this.setData({
                playing: true,
                currentMusic: index
            })
        })
        someMusic.onEnded(() => {
            this.setData({playing: false})
        })
        someMusic.onStop(() => {
            this.setData({playing: false})
        })
        someMusic.onError((res) => {
            console.log(res.errMsg)
            console.log(res.errCode)
        })
    },

    selectMusic() {
        if (someMusic) someMusic.stop();
        const {musicList, currentMusic} = this.data;
        this.setData({
            playing: false,
            selectMusic: currentMusic > -1 ? musicList[currentMusic] : null
        });
        this.runAnimation('music', 'hide')
    },

    // 关闭音乐
    closeMusic() {
        const {showMusic, showBless} = this.data;
        if(showMusic && !showBless){
            if (someMusic) someMusic.stop();
            const {selectMusic} = this.data;
            this.setData({
                playing: false,
                currentMusic: selectMusic ? selectMusic.webIndex : -1,
                showRecord: false
            });
            this.runAnimation('music', 'hide')
        }else if(!showMusic && showBless){
            this.runAnimation('bless', 'hide')
        }
    },

    recordMine(){
        this.setData({showRecord: true})
    },
    startRecord(){
        app.wxapi.getSomeSetting(config.wxSetting.record, () => {}, () => {
            otherShow = true
        });
        this.createRecord()
    },
    endRecord(){
        myRecord.stop();
    },

    createRecord(){
        myRecord = wx.getRecorderManager();

        // 录音开始回调
        myRecord.onStart(() => {
            console.log('start record');
            this.setData({recordText: '正在录制...'});
            startRecordTime = new Date().getTime();
        })

        // 录音结束回调
        myRecord.onStop(async res => {
            const recordTime = new Date().getTime() - startRecordTime;
            console.log('end record', recordTime);
            if(recordTime < 2000){
                app.wxapi.showToast('录制时间太短，请重新录制');
                this.setData({recordText: '长按开始录制'});
                return;
            }
            app.wxapi.showLoading('正在处理...');
            this.setData({recordText: '正在处理...'});
            const updateItem = await app.wxapi.uploadFile('fileupload/redbaglogo', res.tempFilePath, 'voice');
            if (updateItem) {
                const file = JSON.parse(updateItem)[0].path;
                const {musicList} = this.data;
                const selfNum = musicList.filter(item => item.type === 'self').length;
                let mapList = musicList.map((item, index)=> {
                    item.webIndex = index + 1;
                    if(item.type === 'self') item.title = `我的录制[${selfNum - index}]`;
                    return item;
                });
                this.setData({
                    recordText: '长按开始录制',
                    musicList: [{title: selfNum ? `我的录制[${selfNum+1}]` : '我的录制', file: file, webIndex: 0, type: 'self'}, ...mapList]
                }, () => {
                    console.log(this.data.musicList)
                    this.playMusic(this.data.imageBaseUrl + file);
                    this.setData({
                        currentMusic: 0
                    })
                })
                wx.hideLoading();
            } else {
                app.wxapi.showToast(`处理失败，请重试`);
                this.setData({recordText: '长按开始录制'})
            }
        })
        myRecord.onInterruptionBegin(() => {
            app.wxapi.showToast('录音因为受到系统占用而被中断');
        })
        myRecord.onInterruptionEnd(() => {
            app.wxapi.showModal('录音因为受到系统占用而被中断');
        })
        const options = {
            duration: 60000,
            sampleRate: 44100,
            numberOfChannels: 1,
            encodeBitRate: 192000,
            format: 'aac',
            frameSize: 50
        }
        myRecord.start(options)
    },

    // 创建红包
    createRedpacket() {
        app.wxapi.showLoading();
        const {logo, topic, bless, openType, money, num, playType, selectTemplate, selectMusic, isPublic, people} = this.data;
        let data = {
            logo,
            topic: topic || this.data.defaulttopic,
            bless: bless || this.data.defaultbless,
            bgimage: selectTemplate.file,
            layout: selectTemplate.layout,
            poster: selectTemplate.poster,
            bgmusic: selectMusic ? selectMusic.file : null,
            total: num,
            public: isPublic ? 1 : 0,
            playtype: playType,
            alloctype: openType,
            shareimage: selectTemplate.share
        };
        if (openType) {
            data = {...data, amount: num * money}
        } else {
            data = {...data, amount: money}
        }
        if (playType) data = {...data, groupcount: people};
        create.createRedpacket(data).then(res => {
            const {data} = res;
            wx.requestPayment({
                timeStamp: data.timeStamp,
                nonceStr: data.nonceStr,
                package: data.package,
                paySign: data.paySign,
                signType: data.signType,
                success: () => {
                    app.aldstat.sendEvent('用户创建红包', {'用户创建红包': '用户创建红包'});
                    app.wxapi.showToast('塞钱成功', 'success', () => {
                        app.globalData.newCreate = true;
                        app.globalData.createId = res.redid;
                        app.wxapi.tabTo('mine/mine');
                    })
                },
                fail: () => {
                    app.wxapi.showToast('塞钱失败');
                    create.payFail(res.redid);
                    app.globalData.newCreate = true;
                    app.wxapi.tabTo('mine/mine');
                }
            })
        })
    },

    goHelp(){
        otherShow = true;
        app.wxapi.navTo(`webview/webview?url=https://red.doomisoft.com/minirule/createrule.html`)
    }
}))