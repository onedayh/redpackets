import common from "../../utils/commonjs";
const app = getApp();
import regeneratorRuntime from '../../lib/regenerator-runtime/runtime';
import basePage from '../../utils/page';
import Active from '../../utils/api/active';
import config from "../../utils/config";
const active = new Active();
const pageInstance = new basePage();
let info = null;
Page(pageInstance.initializePage({
	data: {
		isLoad: false,
		winW: 375,
		winH: 667,
		scale: .5,
		topicSpacing: 50,
		blessSpacing:40,
		tempFilePath: null
	},
	onLoad(opts){
		app.wxapi.showLoading('海报生成中...');
		info = null;
		this.getData()
	},

	getData(){
		active.getPoster(this.options.id).then(res => {
			info = res;
      pageInstance.setPageKeywords({ id: this.options.id }, {
        title: res.topic,
        image: this.data.imageBaseUrl + res.shareimage
      })
    
			this.drawCanvas()
		})
	},

	async drawCanvas(){
		const {winW, winH, scale, imageBaseUrl, topicSpacing, blessSpacing} = this.data;
		const ctx = wx.createCanvasContext('myCanvas');
		let {font, logo, qr} = JSON.parse(info.poster);
		// // 文字
		// let font = {
		// 	align: 'left', 		// 文字对齐方式
		// 	left: 110,
		// 	topicMax: 10,				// 主题一行字数
		// 	topicTop: 680,				//主题高度
		// 	topicSize: 36,  			// 主题文字大小
		// 	topicColor: '#A74942', 		// 主题文字颜色
		// 	blessColor: '#D2807A', 		// 祝福语文字颜色
		// 	blessSize: 24,  			// 主题文字大小
		// 	blessMax: 12, 				// 祝福语一行字数
		// 	blessMt: 24			// 主题和祝福语 距离
		// }
		// let logo = {
		// 	width: 120,
		// 	top: 500,
		// 	align: 'left',
		// 	left: 108
		// }
		// let qr = {
		// 	width: 166,
		// 	top: 966,
		// 	align: 'left',
		// 	left: 110
		// }

		// 背景图片
		const bgPath = await app.wxapi.getImageInfo(imageBaseUrl + info.bgimage);
		ctx.drawImage(bgPath.path, 0, 0, winW, winH);

		// 头像
		if(logo){
			const logoLocal = logo.align === 'center' ? (winW - logo.width * scale) / 2 : logo.align === 'left' ? logo.left * scale : 0;
			const logoPath = await app.wxapi.getImageInfo(imageBaseUrl + info.logo);
			common.circleImg(ctx, logoPath.path, logoLocal, logo.top * scale, logo.width / 2 * scale);
		}

		if(font){
			// 主题
			const fontLocal = font.align === 'center' ? winW / 2 : font.align === 'left' ? font.left * scale : 0;
			ctx.setFontSize(font.topicSize * scale);
			ctx.setTextAlign(font.align);
			ctx.setTextBaseline('top');
			ctx.setFillStyle(font.topicColor);
			// 计算主题行数
			const topicLineNum = Math.ceil(info.topic.length / font.topicMax);
			// 绘制主题文字
			for(let i=0; i<topicLineNum; i++){
				ctx.fillText(info.topic.slice(font.topicMax * i, font.topicMax * (i + 1)), fontLocal, font.topicTop * scale);
				font.topicTop += topicSpacing;
			}

			// 祝福语
			font.topicTop += font.blessMt;
			ctx.setFontSize(font.blessSize * scale);
			ctx.setFillStyle(font.blessColor);
			// 计算祝福语行数
			const blessLineNum = Math.ceil(info.bless.length / font.blessMax);
			// 绘制祝福语文字
			for(let i=0; i<blessLineNum; i++){
				ctx.fillText(info.bless.slice(font.blessMax * i, font.blessMax * (i + 1)), fontLocal, font.topicTop * scale);
				font.topicTop += blessSpacing;
			}
		}


		// 二维码
		const qrLocal = qr.align === 'center' ? (winW - qr.width * scale) / 2 : qr.align === 'left' ? qr.left * scale : 0;
		const qrPath = await app.wxapi.getImageInfo(imageBaseUrl + info.qrcode);
		common.circleImg(ctx, qrPath.path, qrLocal, qr.top * scale, qr.width / 2 * scale);
		wx.hideLoading();
		ctx.draw(false, () => {
			wx.canvasToTempFilePath({
				canvasId: 'myCanvas',
				success: res => {
					this.setData({
						tempFilePath: res.tempFilePath,
						isLoad: true
					});
					wx.hideLoading()
				},
				fail: () => {
					app.wxapi.showToast('生成海报失败')
				}
			})
		});
	},

	save(){
		app.wxapi.getSomeSetting(config.wxSetting.writePhotosAlbum, this.savePhote)
	},

	savePhote(){
		wx.saveImageToPhotosAlbum({
			filePath: this.data.tempFilePath,
			success: () => {
				app.wxapi.showToast('保存成功', 'success')
			}
		})
	}
}))