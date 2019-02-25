if (typeof constEnum == "undefined") {
    var constEnum = {};
    constEnum.ordertypeEnum ={"1":"<i class='fa fa-shopping-bag'></i>&nbsp;商品订单",
                              "2":"<i class='fa fa-users'></i>&nbsp;拼团订单",
                              "4":"<i class='fa fa-clock-o'></i>&nbsp;秒杀订单",
                              "8":"<i class='fa fa-calendar'></i>&nbsp;预售订单",
                              "99":"<i class='fa fa-paypal'></i>&nbsp;余额充值",
                              "100":"<i class='fa fa-credit-card'></i>&nbsp;礼卡订单"};


    constEnum.promotionEnum = {"1":"正常","2":"团购","4":"秒杀","8":"预售","16":"满减"};
    constEnum.promotionIconEnum = {"1":"正常","2":"<i class='fa fa-users'></i>","4":"<i class='fa fa-clock-o'></i>",
                                "8":"<i class='fa fa-calendar'></i>","16":"满减"};

    ////USER Dictionary CONST
    constEnum.ARTICLE_PUBLISH_STATUS = ["草稿", "审核中", "审核未发布", "发布"];
    constEnum.ACTIVITY_STATUS= ["草稿", "发布", "下线"];
    constEnum.USER_VERIFY_STATUS = ["注册用户", "认证用户", "等待认证"];
    //constEnum.MEMBER_TYPE = ["非会员","万媒会员", "千媒会员", "百人会员"];
    constEnum.PAYMENT_TYPE = {1:"活动报名",2:"课程培训",50:"收益提现"};
    ////会员类型通过二进制的位 = 1 来确定
    constEnum.LITECODER_MEMBER =      [{value:0,text:'普通用户'},
                             {value:1,text:'万媒会员'},
                             {value:2,text:'弯弓学院会员'},
                             {value:4,text:'千媒会员'},
                             {value:8,text:'百人会员'}
                            ];

    constEnum.USER_TYPE_COLOR = ["ident-tag status-unident", "ident-tag status-identing", "ident-tag status-idented"];
    constEnum.USER_SEX_ENUM = ["", "女", "男"];
    constEnum.USER_VERIFY_AUDIT_STATUS = ["等待认证", "认证通过", "认证拒绝"];
    constEnum.EXPERT_AUDIT_STATUS = ["等待认证", "认证通过", "认证拒绝", "停牌行家"];
    constEnum.SUGGESTION_TYPE = ["闪退、卡退或界面错位", "功能使用", "产品体验", "资源服务", "其他"];
    constEnum.SUGGESTION_FROM = ["手机Wap", "App应用", "微应用", "网站"];
    constEnum.SUGGESTION_PROCESS = ["未处理", "已联系", "已解决"];
    constEnum.ADVERTISEMENT_POSITION = ["资讯页位置1", "资讯页位置2", "响晒页位置1", "响晒页位置2", "响约页位置1", "响约页位置2", "响吧页位置1", "响吧页位置2"];
    constEnum.USER_LEVEL = ["铁牌用户", "铜牌用户", "银牌用户", "金牌用户", "钻石用户", "食神级"];
    constEnum.USER_DISABLE = ["正常", "禁用"];
    constEnum.USER_ONLINE_STATUS = ["下线", "在线"];

    constEnum.RECORD_AUDIT = ["提交审核", "审核通过", "审核拒绝"];
    ////会员类
    constEnum.MEMBER_ENUM = ["非会员", "黑卡会员"];
    ////电子商务-商城类
    constEnum.PRODUCT_TYPE_ENUM = ["标准产品", "预售产品", "预售"];
    
    constEnum.PRODUCT_SALE_STATUS_ENUM = ["已下架", "正常销售"];
    constEnum.ORDER_TYPE_ENUM = ["自购", "送礼","预售"];
    constEnum.ORDER_PAY_TYPE_ENUM = ["微信支付", "支付宝","银联支付","余额支付"];
    constEnum.GIFT_STATUS_ENUM = ["待送出","待对方接收","已接收"]
    constEnum.ORDER_REFUND_ENUM = ["-","申请取消,待客服处理","待财务退款","退款中"];
    constEnum.ORDER_REFUND_REASON_ENUM = ["购买错了","不再需要了","价格有点贵","其他原因"];
    constEnum.ORDER_REFUND_MONEY_ENUM = ["退款成功","退款失败"];
    constEnum.GROUPBUY_ORDER_STATUS_ENUM = ['未成团','团购中','已成团','满团'];
    ///平台类
     constEnum.PLATFORM_FEEDBACK_TYPE_ENUM = ["程序BUG","操作不友好","界面不友好","产品太贵","其他"];
}

