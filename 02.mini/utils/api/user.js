import request from './request';
export default class active extends request {
    constructor() {
        super()
    }

    // 用户注册
    register(code) {
        return super.postRequest('api/mini/register', {code})
    }

    // 用户授权
    authorization(code, encryptedData, iv) {
        return super.postRequest('api/mini/register', {code, iv, encryptedData: encryptedData,})
    }

    // 用户信息
    getInfo(){
        return super.getRequest('api/mini/member/profile')
    }

}