/*
* 数据库对像访问实体类
* 该类由代码自动生成
* 对数据库实体访问需要有更多的业务处理，建议新建一个类继承此类实现，以防止自动生成代码覆盖
*/
var util = require('util'); 
var daoBase = require('../../core/database/daoBase');
var utility = require('../../core/utilities/utilities');

class AnalysisModel extends daoBase {
    ///首页上的数据分析
    get getHomeAnalysis() {return "call proc_app_dataanalysis() ";}
    ///首页分析图
    homeAnalysis() {
        return this.database.executeSql(this.getHomeAnalysis)
                .then(result=>{
                    var retData = {successed:true};
                    ///用户统计
                    let userResult = result.rows[0][0];
                    retData.user = {
                            totaluser:userResult.usercount,   ///用户总数
                            todayuser:userResult.todayuser    ////今日新增用户

                    };
                    ///最佳抢手
                    let bestUser = result.rows[1];
                    bestUser.forEach(element=>{
                        if (element.type==0)   ///最佳发放者
                            retData.user.bestprovider = {userid:element.id,username:element.username,userlogo:element.userlogo,total:element.total};
                        if (element.type==1)   ///最佳抢手
                            retData.user.bestplayer = {userid:element.id,username:element.username,userlogo:element.userlogo,total:element.total};
                            
                    })

                    ///平台红包统计
                    let redResult = result.rows[2][0];
                    let allocResult = result.rows[3][0];
                    retData.redpacket = {
                        activitycount:redResult.red_activity,      ///总红包活动数量
                        redamount:redResult.red_amount,              ////发放的红包总金额
                        redtotal:redResult.red_total,              ///发放的红包总数量
                        gotamount:allocResult.red_gotamount,        ///总抢夺金额
                        gotcount:allocResult.red_gotcount           ///总抢夺的数量
                    };
                    ///近10天的数据
                    var daily = [];
                    var prodivercount = [];
                    var grabcount = [];
                    var joincount = [];
                    var legend = ["新用户","发放金额","领取金额"]
                    let maxValue = 0;
                    result.rows[4].forEach(function (item, index) {
                        daily.push(item.date);
                        prodivercount.push(item.redamount);
                        grabcount.push(item.redalloc);
                        joincount.push(item.joincount);
                        if (item.redamount>maxValue)    maxValue = item.redamount;
                        if (item.redalloc>maxValue)     maxValue = item.redalloc;
                        if (item.joincount>maxValue)    maxValue = item.joincount;

                    });
                    if (maxValue==0) maxValue = 5;
                    retData.recent = {
                        legend:{data:legend},
                        xAxis: [{
                            type: 'category',
                            data: daily
                        }],
                        yAxis:[{
                            type: 'value',
                            min:0,
                            max:maxValue*2,
                            minInterval:1
                        }],
                        series: [
                            {
                                name:"新用户",
                                data:joincount,
                                type: 'bar'
                            },{
                            name:"发放金额",
                            data:prodivercount,
                            type: 'bar'
                        },{
                            name:"领取金额",
                            data:grabcount,
                            type: 'bar'
                        }]
                    };
                    return retData;
               });
     }
}
exports = module.exports = AnalysisModel;