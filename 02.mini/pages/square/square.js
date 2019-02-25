import RedActive from '../../utils/api/active';
import basePage from "../../utils/page";
import commonjs from '../../utils/commonjs';
const redActive = new RedActive();
import regeneratorRuntime from '../../lib/regenerator-runtime/runtime';
const app = getApp();
const timeFun = ['linear', 'ease', 'ease-in', 'ease-out', 'ease-in-out'], topArr = [10, 80, 150];
let page = null,        // 用于保存this
    doomList = [],      // 当前弹幕列表
    i = 0,              // 弹幕index
    doomData = [],      // 弹幕总数据
    userPause = false,  // 记录用户暂停音乐
    squareMusic = null; // 背景音乐
const pageInstance = new basePage(true, true);
Page(pageInstance.initializePage({
    data: {
        list: [],
        doomList: [],
        current: 0,
        isLoad: false,
        showMusic: false,
        playing: false
    },

    onLoad() {
        page = this;
        squareMusic = null;
        doomList = [];
        i = 0;
        doomData = [];
        app.wxapi.showLoading()
    },

    onShow() {
        if(app.globalData.getInfofromMine){
            this.setData({
                showAuthorizationWnd: false
            })
            app.globalData.getInfofromMine = false
        }
        if (squareMusic && !userPause) squareMusic.play();
        app.wxapi.showTabBar();
        this.getData();
    },
    /**
     * 加载弹幕信息
     */
    loadBarrageInfo() {
        redActive.getAllBarrage().then(res => {
            doomData = res.data;
            this.runDoom()
        })
    },

    runDoom(){
        if(doomData.length > 0){
            let items = doomData.splice(0, 1);
            doomList.push(new Doom(
                items[0].userlogo,
                items[0].username,
                items[0].money,
                topArr[i % 3],
                commonjs.getRandom(5, 6),
                timeFun[commonjs.getRandomZero(4)],
                i,
            ))
            i ++;
            this.setData({doomList});
            setTimeout(() => {
                this.runDoom()
            }, 800)
        }else{
            this.loadBarrageInfo()
        }
    },
    getData() {
        redActive.getRedpacketList().then(res => {
            if(!this.data.isLoad){
                this.loadBarrageInfo();
                this.getMusic();
            }
            this.setData({
                list: res.data,
                isLoad: true
            })
            wx.stopPullDownRefresh();
            wx.hideLoading()
        })
    },

    // 点击红包
    goActive(e) {
        const dataset = e.currentTarget.dataset;
        const id = Number(dataset.id), index = Number(dataset.index);
        if (this.data.current === index){
            app.aldstat.sendEvent('用户参与红包活动', {'用户参与红包活动': '用户参与红包活动'});
            app.wxapi.navTo(`index/index?id=${id}&from=square`)
        }
    },

    // 切换红包
    handleChange(e) {
        this.setData({
            current: e.detail.current
        })
    },

    // 获取用户信息
    changeAuth() {
        this.setData({showAuthorizationWnd: false})
    },

    onPullDownRefresh() {
        this.setData({current: 0});
        this.getData()
    },
    //清除计时器
    onUnload() {
        clearInterval(this.data.setInter)
    },

    async getMusic(){
        const {setting} = await app.appShare.getGlobalSetting();
        const {squaremusic} = setting;
        if(squaremusic){
            squareMusic = this.playAudio(this.data.imageBaseUrl + squaremusic);
        }
    },

    // 播放背景音乐
    playAudio(src) {
        const innerAudioContext = wx.createInnerAudioContext();
        innerAudioContext.autoplay = true;
        innerAudioContext.src = src;
        innerAudioContext.loop = true;
        innerAudioContext.onPlay(() => {
            this.setData({
                showMusic: true,
                playMusic: true
            })
        })
        innerAudioContext.onPause(() => {
            this.setData({playMusic: false})
        })
        innerAudioContext.onError(res => {
            console.log(res.errMsg)
            console.log(res.errCode)
        })
        return innerAudioContext
    },

    // 音乐控制
    musicControl() {
        if (squareMusic.paused) {
            squareMusic.play();
            userPause = false;
        } else {
            squareMusic.pause();
            userPause = true;
        }
    },

    onHide() {
        if (squareMusic && !squareMusic.paused) squareMusic.pause()
    },
}))

class Doom{
    constructor(logo, name, money, top, dur, timeFun, id){
        this.userlogo = logo;
        this.username = name;
        this.money = money;
        this.top = top;
        this.dur = dur;
        this.id = id;
        this.timeFun = timeFun;
        setTimeout(() => {
            doomList.splice(doomList.indexOf(this), 1);
            page.setData({doomList})
        },this.dur * 1000)
    }
}