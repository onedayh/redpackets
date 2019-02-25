var utility = require('./utilities');
var uuid = require('node-uuid'); 
var Chinese2FieldMapping = {
    "姓名":"user_name",
    "真实姓名":"user_realname",
    "电话号码":"user_mobile"
}
class MessageParamParse
{
    /*
    * 从上下文 解析关键字
    * 或者已固定的方式解析关键字
    * template : 参数的模板，如 #名称|你好，欢迎加入|2018-1-12
    * record:数据记录，用来取字段
    * messageType ： 0->小程序模板消息  1：短信消息
    */
    static parseParams(template,record,messageType=0) {
        if (utility.isNullOrEmpty(template)) return null;
        var strItems = template.split('|');
        var param=[];
        strItems.forEach(function(item){
            ///来自数据库的属性
            if (utility.startWith(item,'#') && record!=null){
                var fieldName = Chinese2FieldMapping[item.substr(1)];
                if (fieldName==null) fieldName = item.substr(1);
                param.push(record[fieldName]);
            }
            else
                param.push(item);
        })
        if (messageType==1) return param;
        var msgParam = {};
        var index = 1;
        param.forEach(function(item){
            msgParam['keyword'+index++] = {value:item};
        })
        return msgParam;
    }
}
exports = module.exports=MessageParamParse;