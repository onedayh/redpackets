/*
* 定时写入红包广场的弹幕数据
*/
var co 					= require('co');
var redBagDao			= require('../model/api/redbag/redbag');
var utility 			= require('../core/utilities/utilities');
var moment				= require('moment');

module.exports.execute = function () {
    ////将待发送的消息至于消息队列中
	console.log('写入弹幕数据',moment().format('YYYY年MM月DD日 h:mm:ss'));
    co(function*(){
		let dao = new redBagDao();
		let result = yield dao.getAllBarrageData();
		if (result.successed===true){
			let savePath = '/redbag/barrage/barrage.json';
			let writeResult = utility.saveString2File(savePath,
				JSON.stringify(result.data),
				"tencentcos");
		}
		console.log('写入弹幕数据完成')
	})
};


