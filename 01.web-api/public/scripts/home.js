$(function() {    
	startAnalysis();
});


function startAnalysis() {
	ApiCaller.Get({
		url: urlConfig.apiUrl.homepage.base,
		successFunc: function(res) {
			var $userContainer = $('.user-container'); // 用户模块
			var $logisticsContainer = $('.logistics-container'); // 物流模块
			// 用户模块
			$userContainer.find('.total').text(res.user.totaluser)
			$userContainer.find('.today').text(res.user.todayuser)
			$userContainer.find('.activity').text(res.redpacket.activitycount)
			$userContainer.find('.amount').text(res.redpacket.redamount)
			$userContainer.find('.alloc').text(res.redpacket.redtotal)
			
			// 物流模块
			if (res.user.bestprovider){
				var userProvider = "<img src='"+res.user.bestprovider.userlogo+"' class='userheader'>"+
								   "<span style='padding-left:7px;font-size:12px;vertical-align:11px'>"+res.user.bestprovider.username+"</span>"+
								   "<span style='color:#db2828; padding-left:7px;font-size:12px;vertical-align:11px'>"+$.formatMoney(res.user.bestprovider.total)+"</span>"

				
				$logisticsContainer.find('.bestprovider').html(userProvider)
			}
			if (res.user.bestplayer){
				var userPlayer = "<img src='"+res.user.bestplayer.userlogo+"' class='userheader'>"+
								   "<span style='padding-left:7px;font-size:12px;vertical-align:11px'>"+res.user.bestplayer.username+"</span>"+
								   "<span style='color:#db2828; padding-left:7px;font-size:12px;vertical-align:11px'>"+$.formatMoney(res.user.bestplayer.total)+"</span>"

				
				$logisticsContainer.find('.bestplayer').html(userPlayer)
			}
			// 培训地市分析
			charts.renderBarChart('recent', res.recent)
			
		}
	});
};

function openPage(title,url){
	window.top.addTab(title,url);
}