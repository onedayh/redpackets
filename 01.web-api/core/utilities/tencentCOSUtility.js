var co = require('co');
var OSS = require('ali-oss');
var fs = require('fs');
var path = require('path');
var fileBase = require('./fileBase');
var settingjson = require("../../configuration.json");
var COS = require('cos-nodejs-sdk-v5');
var cos = new COS(settingjson.tencentCOS);
////腾讯OSS文件助手
class tencentCOSUtility extends fileBase {
    static saveFileStream(fileName, file, saveOption, userInfo, callback) {
        var utility = require('./utilities');
        var destinationFileName = super.getSaveFileName(saveOption, fileName, userInfo);
        destinationFileName = destinationFileName.replace(/\\/g, "/");
        co(function* () {
            /* 
            *  1.读取结果为Buffer对象 
            */
            if (saveOption.reRead){
                var dataArr=[],//存储读取的结果集合  
                len=0;
                file.on('data',function(chunk){  
                    dataArr.push(chunk);  
                    len+=chunk.length;  
                });  
                file.on('end',function(){  
                        var fileParam =  {
                            Bucket: settingjson.tencentCOS.bucket,
                            Region: settingjson.tencentCOS.region,
                            Key: destinationFileName,
                            Body:Buffer.concat(dataArr,len) , //file,
                            ContentLength:len// file.byteCount ||  saveOption.contentLength 
                        };
                        cos.putObject(fileParam,function(err,data){
                            if (utility.isFunction(callback)) {  
                                callback(file, { success: err==null, filePath:destinationFileName });
                            }
                        })
                    });
            }else{
                var fileParam =  {
                    Bucket: settingjson.tencentCOS.bucket,
                    Region: settingjson.tencentCOS.region,
                    ContentDisposition:"form-data; name=\"file\"; filename=\""+destinationFileName+"\"",
                    Key: destinationFileName,
                    Body:file,
                    ContentLength:file.byteCount || file.length
                };
                cos.putObject(fileParam,function(err,data){
                    if (utility.isFunction(callback)) {  
                        callback(file, { success: err==null, filePath:destinationFileName });
                    }
                })
            }
            
        }).catch(function (err) {
            if (utility.isFunction(callback)) {
                callback(file, { success: false });
            }
        });
    }
    ////将字符串写入到腾讯COS
    static saveString2File(filePath, strData) {
        if (!strData) strData="";
        return co(function* () {
            console.log('start saveFileForStr :' + filePath);
            var streamBuffer = new Buffer(strData, "utf-8");
            var fileParam =  {
                Bucket: settingjson.tencentCOS.bucket,
                Region: settingjson.tencentCOS.region,
                Key: filePath,
                Body:streamBuffer,
                ContentLength: streamBuffer.byteLength
            };
            var result =  yield new Promise((success,failed)=>{
                cos.putObject(fileParam,function(err,data){
                    if (!err) 
                         success(err,data);
                    else
                        failed(err,data);
                });
            });
            
        });
    }
}
exports = module.exports = tencentCOSUtility;