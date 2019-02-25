/*
*  二维码生成工具
*/
var utility = require('./utilities');
var co      = require('co');
var miniApi   = require('../wechatapi/MiniApi');
class QRCodeGenerate
{
    /*
    * 生成小程序的二维码
    */
    static *miniQR(qrparam) {
        // var param = {
        //     //userid: qrparam.userid,
        //     //shareid:qrparam.shareid,
        //     parent:utility.checkValue(qrparam.parent,null),
        //     route:qrparam.url || '/pages/index/index',
        //     //param:qrparam.parameter,
        //     scene:qrparam.scene?(qrparam.scene+new Date().getTime()):null
        // };
        //var platformDao     = require('../../model/api/system/system');
        //var dao             = new platformDao();
        //dao.createShare(param);
        var wechat          =   new miniApi(qrparam.appid);
        var qrresult        =   yield wechat.getQRCode({
                scene:qrparam.scene,
                page:qrparam.route || '/pages/index/index',
                upload_config:"qrcode"
            });
        if (qrresult.successed) return {successed:true,qrcode:qrresult.data.filePath};
        return {successed:false};
    }
}
exports = module.exports=QRCodeGenerate;