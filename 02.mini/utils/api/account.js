import request from '../../utils/api/request';
import config from '../../utils/config';
export default class account extends request {
    constructor(){
        super()
    }

    // 获取用户余额
    getCash(){
        return super.getRequest('api/mini/member/balance')
    }

    // 获取用户的钱包流水记录
    getCashRecord(page, isComplex = false){
        return super.getRequest('api/mini/redbag/wallet', {page, rows: config.pageSize}, isComplex)
    }

    // 提现
    cashOut(money, formid){
        return super.postRequest('api/mini/redbag/wallet/withdraw', {money, formid})
    }

    
}