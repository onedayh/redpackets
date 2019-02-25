import request from './request';

export default class user extends request {
    constructor() {
        super()
    }

    /**
     * 获取模板 && 音乐 && 主题
     */
    getBackgroundResouce() {
        return super.requestJson('redbag/config/cache/background.json')
    }

    // 创建红包
    createRedpacket(data) {
        return super.postRequest('api/mini/redbag', data)
    }

    // 重新支付
    rePay(id) {
        return super.postRequest(`api/mini/redbag/${id}/pay`)
    }

    // 支付失败
    payFail(id) {
        return super.postRequest(`api/mini/redbag/${id}/cancelpay`)
    }
}