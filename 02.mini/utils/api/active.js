import request from './request';
export default class user extends request {
    constructor() {
        super()
    }
    /**
     * 引流跳转记录
     */
    diversion(appid,id){
      return super.postRequest(`api/mini/redbag/${id}/diversion`, { appid: appid })
    }
    /**
     * 获取广场上的弹幕
     */
    getAllBarrage(){
      return super.requestJson('redbag/barrage/barrage.json')
    }
    // 红包列表
    getRedpacketList(){
        return super.getRequest('api/mini/redbag')
    }

    // 红包play信息
    getRedpacketPlay(id) {
        return super.getRequest(`api/mini/redbag/${id}/play`)
    }

    // 开红包
    openRedpacket(formId, redId, groupId = '') {
        return super.postRequest(`api/mini/redbag/${redId}/grab?groupid=${groupId}`, {formid: formId}, true)
    }

    requestUrl(url) {
        return super.getRequest(url)
    }

    // 红包海报信息
    getPoster(id){
        return super.getRequest(`api/mini/redbag/${id}/poster`)
    }

    /**
     * 引流跳转记录
     */
    diversion(appid, id){
        return super.postRequest(`api/mini/redbag/${id}/diversion`, { appid: appid })
    }
}