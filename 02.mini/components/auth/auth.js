import userUtil from '../../utils/user';
import User from '../../utils/api/user';
const user = new User();
import regeneratorRuntime from '../../lib/regenerator-runtime/runtime';
const app = getApp();
Component({
	properties: {

	},
	data: {

	},
	methods: {
		async _getUserInfo(e){
			const hasUserScope = await userUtil.userIsAuthorized(true);
			this.triggerEvent('change', {change: hasUserScope});
			if (!hasUserScope) return;
			const {encryptedData, iv} = e.detail;
			const code = await app.wxapi.login();
			user.authorization(code, encryptedData, iv).then(res => {
				const {data} = res;
				app.globalData.userInfo = data;
				userUtil.setUser(data);
			})
		}
	}
})
