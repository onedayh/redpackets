var co = require('co');
var OSS = require('ali-oss');
var fs = require('fs');
var fileBase = require('./fileBase');
var settingjson = require("../../configuration.json");

var client = new OSS(settingjson.aliYunOSS);
class aLiYunOSSUtility extends fileBase {
    /**
     * saveOption:长传文件类型配置
     * data：上传本地文件的路径或者是上传的Buffer
     */
    static upload(fileName, saveOption, data, userInfo, callback) {
        var utility = require('./utilities');
        var destinationFileName = super.getSaveFileName(saveOption, fileName, userInfo);
        co(function* () {
            var result = yield client.put(destinationFileName, data);
            if (utility.isFunction(callback)) {
                callback(file, { success: true, filePath: result.name });
            }
        }).catch(function (err) {
            if (utility.isFunction(callback)) {
                callback(file, { success: false });
            }
        });
    }

    static saveFileStream(fileName, file, saveOption, userInfo, callback) {
        var utility = require('./utilities');
        var destinationFileName = super.getSaveFileName(saveOption, fileName, userInfo);
        destinationFileName = destinationFileName.replace(/\\/g, "/");
        co(function* () {
            var result = yield client.putStream(destinationFileName, file);
            if (utility.isFunction(callback)) {
                callback(file, { success: true, filePath: result.name });
            }
            // console.log(result);
        }).catch(function (err) {
            if (utility.isFunction(callback)) {
                callback(file, { success: false });
            }
        });
    }
    ///将字符串内容写入到OSS中形成文件
    //static saveFileForStr(filePath, strData) 
    static saveString2File(filePath, strData) {
        if (!strData) strData="";
        return co(function* () {
            console.log('start saveFileForStr :' + filePath);
            var result = yield client.put(filePath, new Buffer(strData, "utf-8"));
        });
    }
}
exports = module.exports = aLiYunOSSUtility;