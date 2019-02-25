import request from '../../utils/api/request';
import {pageSize} from '../../utils/config';
export default class record extends request {
    constructor() {
        super()
    }
    /** 
     * 红包撤回
     */
    rollback(id){
      return super.postRequest(`api/mini/redbag/${id}/rollback`)
    }

    // 红包总数据
    getTotal(type = 0){
        return super.getRequest(`api/mini/member/redbagtotal?type=${type}`)
    }

    // 收到红包记录
    getRecord(page, complex = false){
        return super.getRequest('api/mini/member/grabbed', {page, rows: pageSize}, complex)
    }

    // 发出红包记录
    setRecord(page, complex = false){
        return super.getRequest('api/mini/member/ownerredbag', {page, rows: pageSize}, complex)
    }

  // 红包的领取信息
  // id : 红包的id
  //type :0 获取汇总信息   1:获取红包领取明细
  allocInfo(id, type, page, complex = false) {
    return super.getRequest(`api/mini/redbag/${id}/allocinfo`, {type, page, rows: pageSize }, complex)
  }
}