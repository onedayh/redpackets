/**
 * 第三方平台小程序的相关接口
 */
var ComponentApi    =   require('./ComponentApi');
var wxconfig        =   require('./wechatconfig');
var rpc             =   require('../rpc/rpcUtility');
class MiniComponentApi extends ComponentApi{
    constructor(config){
        super(config);
    }
    /**
     * 为第三方的小程序获取或设置小程序的合法域名
     * @param {*} access_token 
     */
    static *ComponentDomainInfo(actionType,authorizer_access_token){
        var domaindata = {
            action:actionType || "add",
            requestdomain:this.componentConfig.requestdomain,
            wsrequestdomain:this.componentConfig.wsrequestdomain,
            uploaddomain:this.componentConfig.uploaddomain,
            downloaddomain:this.componentConfig.downloaddomain,
        };
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/modify_domain?access_token='+authorizer_access_token,
            json: true,
            method: "post",
            body:domaindata
        };
        let domain_result = yield rpc.request(option);
        if (domain_result.successed && 
            utility.isNullOrEmpty(domain_result.body.errcode)){
            return {successed:true,
                    requestdomain:domain_result.body.requestdomain,
                    wsrequestdomain:domain_result.body.wsrequestdomain,
                    uploaddomain:domain_result.body.uploaddomain,
                    downloaddomain:domain_result.body.downloaddomain,
                }
        }
        return {successed:false};
    }

    /**
     * 为第三方的小程序设置业务域名
     */
    static *setWebViewDomain(authorizer_access_token){
        var domaindata = {
            action:actionType || "add",
            webviewdomain:this.componentConfig.webviewdomain
        };
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/setwebviewdomain?access_token='+authorizer_access_token,
            json: true,
            method: "post",
            body:domaindata
        };
        let domain_result = yield rpc.request(option);
        if (domain_result.successed && 
            utility.isNullOrEmpty(domain_result.body.errcode)){
            return {successed:true,
                webviewdomain:domain_result.body.webviewdomain
                }
        }
        return {successed:false};
    }
    /**
     * 获取授权的第三方小程序的信息
     */
    *getMiniProgramInfo(authorizer_access_token){
        var option = { 
            url: 'https://api.weixin.qq.com/cgi-bin/account/getaccountbasicinfo?access_token='+authorizer_access_token,
            method: "get"
        };
        let mini_result = yield rpc.request(option);
        return mini_result;
    }
    /**
     * 为授权的第三方小程序上传代码
     * @param {} authorizer_access_token 
     */
    *commitMiniProgram(authorizer_access_token,codeinfo){
        var programData = {
            template_id:codeinfo.template_id,
            ext_json:JSON.stringify(codeinfo.ext_json),
            user_version:codeinfo.version,
            user_desc:codeinfo.desc
        };
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/commit?access_token='+authorizer_access_token,
            json: true,
            method: "post",
            body:programData
        };
        let upload_result = yield rpc.request(option);
        if (upload_result.successed && upload_result.body.errcode==0){
            return {successed:true }
        }
        return {successed:false};
    }
    /**
     * 获取授权的小程序设置的类目
     * @param {} authorizer_access_token 
     */
    *getMiniProgramCategory(authorizer_access_token){
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/get_category?access_token='+authorizer_access_token,
            method: "get"
        };
        let category_result = yield rpc.request(option);
        if (category_result.successed && category_result.errcode==0){
            return {successed:true,category_list:category_result.category_list}
        }
        return {successed:false}
    }
    /**
     * 获取授权的小程序的页面配置信息
     * @param {} authorizer_access_token 
     */
    *getMiniProgramPageInfo(authorizer_access_token){
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/get_page?access_token='+authorizer_access_token,
            method: "get"
        };
        let pages_result = yield rpc.request(option);
        if (pages_result.successed && pages_result.errcode==0){
            return {successed:true,page_list:pages_result.page_list}
        }
        return {successed:false}
    }
    /**
     * 获取第三方的小程序的体验二维码
     * @param {} authorizer_access_token 
     */
    *getExperenceQRCode(authorizer_access_token){
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/get_qrcode?access_token='+authorizer_access_token,
            method: "get"
        };
        let qr_result = yield rpc.request(option);
        if (qr_result.successed && qr_result.errcode!=-1){
            return {successed:true,filedname:qr_result.response.filename}
        }
        return {successed:false}
    }
    /**
     * 为第三方小程序提交代码送审
     * @param {*} authorizer_access_token 
     */
    *submitMiniProgramToAudit(authorizer_access_token,auditinfo){
        var auditData = {
            item_list:auditinfo.item_list
        };
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/submit_audit?access_token='+authorizer_access_token,
            json: true,
            method: "post",
            body:auditData
        };
        let audit_result = yield rpc.request(option);
        if (audit_result.successed && audit_result.body.errcode==0){
            ////返回送审的编号
            return {successed:true,auditid:audit_result.body.auditid }
        }
        return {successed:false};
    }
    /**
     * 查询第三方小程序提交送审的结果
     * @param {*} authorizer_access_token 
     */
    *queryMiniProgramToAudit(authorizer_access_token,auditid){
        var auditData = {
            auditid:auditid
        };
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/get_auditstatus?access_token='+authorizer_access_token,
            json: true,
            method: "post",
            body:auditData
        };
        let audit_result = yield rpc.request(option);
        if (audit_result.successed && audit_result.body.errcode==0){
            ////返回送审的编号
            return {successed:true,status:audit_result.body.status,reason:audit_result.body.reason }
        }
        return {successed:false};
    }

    /** 
     * 查询最新一次提交的审核状态（仅供第三方代小程序调用）
     */
    *queryMiniProgramLatestAudit(authorizer_access_token){
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/get_latest_auditstatus?access_token='+authorizer_access_token
        };
        let audit_result = yield rpc.request(option);
        if (audit_result.successed && audit_result.body.errcode==0){
            ////返回送审的编号
            return {successed:true,...audit_result.body }
        }
        return {successed:false};
    }

    /**
     * 发布已通过审核的小程序（仅供第三方代小程序调用）
     * @param {*} authorizer_access_token 
     */
    *releaseMiniProgram(authorizer_access_token){
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/release?access_token='+authorizer_access_token,
            json: true,
            method: "post"
        };
        let release_result = yield rpc.request(option);
        return {successed:release_result.successed && release_result.body.errcode==0}
    }


    /**********以下为第三方平台小程序的代码模板管理接口 **************/

    /** 
     * 获取草稿箱内的所有临时代码草稿
     */
    *queryDraftMiniProgram(){
        let access_token = yield this.getComponentAccess();
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/gettemplatedraftlist?access_token='+access_token
        };
        let result = yield rpc.request(option);
        if (result.successed && result.body.errcode==0){
            return {successed:true,...result}
        }
        return {successed:false};
    }
    /** 
     * 获取代码模版库中的所有小程序代码模版
     */
    *queryTemplateMiniProgram(){
        let access_token = yield this.getComponentAccess();
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/gettemplatelist?access_token='+access_token
        };
        let result = yield rpc.request(option);
        if (result.successed && result.body.errcode==0){
            return {successed:true,template_list:result.template_list}
        }
        return {successed:false};
    }

    /** 
     * 将草稿箱的草稿选为小程序代码模版
     */
    *setDraft2Template(draft_id){
        let access_token = yield this.getComponentAccess();
        let draft_data = {draft_id:draft_id};
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/addtotemplate?access_token='+access_token,
            json: true,
            method: "post",
            body:draft_data
        };
        let result = yield rpc.request(option);
        return {successed:result.successed && result.body.errcode==0}
    }
    
    /** 
    * 删除指定小程序代码模版
    */
    *deleteTemplate(templateid){
        let access_token = yield this.getComponentAccess();
        let template_data = {template_id:templateid};
        var option = { 
            url: 'https://api.weixin.qq.com/wxa/deletetemplate?access_token='+access_token,
            json: true,
            method: "post",
            body:template_data
        };
        let result = yield rpc.request(option);
        return {successed:result.successed && result.body.errcode==0}
    }
    
}
var comMiniApi ;
if(!comMiniApi)  comMiniApi = new MiniComponentApi(wxconfig.thirdplatform);
exports = module.exports = comMiniApi;