const app = getApp();
import User from '../../utils/api/user';
import basePage from '../../utils/page';
const pageInstance = new basePage(), user = new User();
import regeneratorRuntime from '../../lib/regenerator-runtime/runtime';
Page(pageInstance.initializePage({
	data: {
		info: null,
		isLoad: false,
		opts: [
			{icon: 'icon_wallet', name: '钱包', value: '', path: 'wallet/wallet'},
			{icon: 'icon_record', name: '我的记录', value: '', path: 'record/record', margin: true},
			{icon: 'icon_scene', name: '适用场景', value: '', path: 'webview/webview?url=https://red.doomisoft.com/minirule/scene.html'},
			{icon: 'icon_question', name: '常见问题', value: '', path: 'webview/webview?url=https://red.doomisoft.com/minirule/questions.html'}
		]
	},
	onLoad(){
		app.wxapi.showLoading()
	},
	onShow() {
		app.wxapi.showTabBar();
		this.getData();
		if (app.globalData.newCreate){
			app.globalData.newCreate = false;
			app.wxapi.navTo('record/record')
		}
	},

	getData(){
		let {opts} = this.data;
		user.getInfo().then(res => {
			opts[0].value = Number(res.balance).toFixed(2);
			this.setData({
				info: res,
				opts,
				isLoad: true
			})
			wx.hideLoading()
		})
	},

	async getUserInfo(e) {
		const hasUserScope = await pageInstance.userIsAuthorized(true);
		if (!hasUserScope) return;
		const {detail} = e;
		this.setData({
			'info.name': detail.userInfo.nickName,
			'info.logo': detail.userInfo.avatarUrl
		})
		user.authorization(await app.wxapi.login(), detail.encryptedData, detail.iv).then(res => {
			app.globalData.getInfofromMine = true;
		})
	},

	go(e){
		app.wxapi.navTo(e.currentTarget.id)
	}
}))