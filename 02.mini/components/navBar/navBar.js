const app = getApp();
import config from '../../utils/config';
Component({
	properties: {
		title: {		// 标题
			type: String,
			value: ''
		},
		bgColor: {		//背景颜色 默认white
			type: String,
			value: '#fff'
		},
		theme: {		//主题颜色 默认dark
			type: String,
			value: 'dark'
		},
		showBack: {		//返回按钮 默认不显示
			type: Boolean,
			value: false
		},
		showIndex: {	//首页按钮 默认不显示
			type: Boolean,
			value: false
		}
	},
	data: {
		barHeight: config.navbarHeight,	// 导航栏高度
		barPt: 0		// 状态栏高度
	},
	attached(){
		const barPt = wx.getSystemInfoSync().statusBarHeight;
		app.globalData.pagePt = barPt + config.navbarHeight;
		this.setData({barPt})
	},
	methods: {
		navHandle(){
			const {showBack, showIndex} = this.data;
			if(showBack) app.wxapi.navBack();
			if(showIndex) app.wxapi.tabTo('square/square');
		}
	}
})