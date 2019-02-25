module.exports= {
    MINI_MESSAGE:{
        // group_success:"mini_groupsuccess",  ///拼团成功通知
        // group_progress:"mini_groupprogress",  ///拼团成功通知
        // group_failed:"mini_groupfailed",    ///成团失败通知
        // orderrefund:"mini_orderrefund",     ///订单退款通知
        // rebate:'mini_orderrebate',           ////分销收益通知
        // cardreceive:'cardreceive'           ////礼卡赠送接收通知
        bingo:'bingo',   ///红包中奖通知
        transfer:'transfer',   ///提现到账通知
        waitpay:'waitpay'   ///提醒支付

     },
     SMS_MESSAGE:{
        getverifycode:"sms_getverifycode",
        ordernotifyadmin:'sms_ordernotifyadmin'
     },
     ///二维码的场景值定义
     QRSCENE:{
         "member":1,
         "channel":2
     }
}