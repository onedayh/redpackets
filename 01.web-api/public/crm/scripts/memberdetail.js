var detailForm,orderList,rebateList,rechargeList;

$(document).ready(function () {
    $('#tabmember').tabs({
        onSelect: function (title, index) {
            switch (index) {
                case 1: InitUserOrder(); break;
                 case 2: InitUserRecharge(); break;
            }
        }
    });
    detailForm = new detailForm('form', {
        saveOption: {
            button: '#lnkSave', url: urlConfig.apiUrl.member.base,
            successFunc: function (result) {
              dialogHelper.callParentFunc('reloadMember');
            }
        },
        bindOption: {
            url: urlConfig.apiUrl.member.base, successFunc: function (result) {
                $.setImage('imgHead',result.logo);
                $('#spanSex').text(constEnum.USER_SEX_ENUM[result.sex]);
                $('#userBalance').text($.formatMoney(result.balance));
                $('#userName').text(result.name);
                //$('#userOrder').text($.isValue(result.ordercount,0,"-暂无订单-"));
                if ($.checkValue(result.totalrebate,0)==0)
                    $('#userRebate').text("-无收益-");
                else
                    $('#userRebate').text($.formatMoney(result.totalrebate));
                if (result.orderpay==0)
                    $('#userPay').text("-无消费-");
                else
                    $('#userPay').text($.formatMoney(result.orderpay));
            }
        }
    });
    detailForm.bindForm();
})

function bindPhone(){

    var phoneNumber = $('#mobile').textbox('getValue');
    ApiCaller.Put({url:urlConfig.apiUrl.member.changPhone.format(detailForm.getCurrentKey()),
                    data:{phone:phoneNumber},
                    successFunc:function(result){
                        $.messager.alert('提示','手机号码已成功更新','info');
                    }})

}
function InitUserOrder(){
    if (orderList != null) return;
    orderList = new listForm('dgOrder', {
        url: urlConfig.apiUrl.member.orders.format(detailForm.getCurrentKey()),
        //url: '/payment?io=1&userid=' + detailForm.getCurrentKey(),
        
        idField:'id',
        showFooter: true,
       
        //rownumbers:true,
        editOption: { url: '/marketing/orderdetail',  title: '订单详情', width: 830, height: 600 },
        columns: [[
           {field: 'orderno', title: '订单编号/日期', halign:'center',width: 150, sortable: true,
                    formatter: function (value, row, index) {
                    if (row.footer==1) return;
                    var linkUrl = "<div style='white-space:normal;word-wrap:break-word;line-height:22px'><a href='#' onclick=\"orderList.editRecord('" + row.id + "')\">"+
                                  "<span style='color:darkorange;font-weight:bold;font-size:13px;'>" +value+ "</span></a>";
                    if(!$.isNullOrEmpty(row.orderdate))
                        linkUrl +='<br/>'+row.orderdate;
                    linkUrl+='</div>';
                    return linkUrl;
            }},

            { field: 'type', title: '类型',align:'center', width: 130,sortable: true,
                formatter: function (value, row, index) {
                    if (row.footer==1) return;
                   return constEnum.ordertypeEnum[value];
            } },
            {field: 'ordertotal', title: '订单金额',halign:'center',width: 180, align: 'right',
            formatter: function (value, row, index) {
                if (row.footer==1) return;
                if (row.type==1){
                    var payInfo= '<div style="white-space:normal;text-align:right;word-wrap:break-word;line-height:22px">';
                    payInfo = payInfo+'<span style="color:blue;">【订单金额】     '+$.formatMoney(value)+'</span>'
                    payInfo = payInfo+'<br/><span style="color:darkgreen">【优惠券抵扣】   - '+$.formatMoney(row.vouchertotal)+'</span>'
                    payInfo = payInfo+'<br/><span style="color:#27292a">【满减优惠】   - '+$.formatMoney(row.fulldiscount)+'</span>'
                    payInfo = payInfo+'<br/><span style="border-bottom:2px solid #888;padding:2px 0;color:darkorange">【物流】    + '+$.formatMoney(row.logisticstotal)+'</span>';
                    payInfo = payInfo+'<br/><span style="color:red">【实际支付】     = '+$.formatMoney(row.paytotal)+'</span>';
                    return payInfo;
                }
                return $.formatMoney(row.paytotal);
            }},
            {field: 'paytype', title: '支付方式',align:'center',width: 100,
                formatter: function (value, row, index) {
                 if (row.footer==1) return;
                 return ["微信支付","余额支付"][value];
            }},
            { field: 'status', title: '订单状态',align:'center', width: 160 ,
                formatter: function (value, row, index) {
                    if (row.footer==1) return;
                    if (value==100) return '已退款';
                    if (value==3) return '已收货';
                    if (value==2) return '已发货';
                    if (value==1) {
                        if (row.type==2 && row.groupsuccess==0) return '待成团';
                        return '待发货';
                    }
            } }
        ]]
    });
}
function InitUserRebate(){
    if (rebateList != null) return;
    rebateList = new listForm('dgRebate', {
        url: urlConfig.apiUrl.member.rebate.format(detailForm.getCurrentKey()),
        //url: '/payment?io=1&userid=' + detailForm.getCurrentKey(),
        toolbar: '#tools_Rebate',
        idField:'id',
        showFooter: true,
        searchOption: {
        searchButton: '#btnSearchRebate', resetButton: '#btnResetRebate',group:'rebate'},
        rownumbers:true,
        editOption: { url: '/marketing/orderdetail',  title: '订单详情', width: 830, height: 600 },
        columns: [[
            { field: 'productname', title: '分销产品',halign:'center', width: 180 ,
            formatter: function (value, row, index) {
                if ($.isNullOrEmpty(value)) return ;
                return  "<div style='white-space:normal;word-wrap:break-word;line-height:22px'>" + value + "</div>";
            } },
            { field: 'ouser', title: '购买用户',halign:'center', width: 120 ,
                formatter: function (value, row, index) {
                    if (!$.isNullOrEmpty(value)) {
                        return value;
                    }
            } },
            { field: 'orderdate', title: '购买日期',halign:'center', width: 100 ,
            formatter: function (value, row, index) {
                if (!$.isNullOrEmpty(value)) {
                    return value;
                }
            } },
            { field: 'rebate', title: '收益金额',align:'right', width: 90 ,
                formatter: function (value, row, index) {
                    return $.formatMoney(value);
            }},
            { field: 'level', title: '级数',align:'center', width: 80 ,
                formatter: function (value, row, index) {
                    if (!$.isNullOrEmpty(value)) return ["一级","二级"][value-1];
            }},
            { field: 'audit', title: '审核状态',align:'center', width: 80 ,
                formatter: function (value, row, index) {
                    if (!$.isNullOrEmpty(value)) return ["待审核","已审核"][value];
            } }
        ]]
    });
}

function InitUserRecharge(){
    if (rechargeList != null) return;
    rechargeList = new listForm('dgRecharge', {
        url: urlConfig.apiUrl.member.recharge.format(detailForm.getCurrentKey()),
        toolbar: '#tools_Recharge',
        idField:'id',
        showFooter: true,
        searchOption: {
        searchButton: '#btnSearchRecharge', resetButton: '#btnResetRecharge',group:'recharge'},
        rownumbers:true,
        columns: [[
            { field: 'orderno', title: '订单编号',halign:'center', width: 120},
            { field: 'date', title: '充值时间',halign:'center', width: 120 ,
                formatter: function (value, row, index) {
                 if (row.footer==1) return;
                 return $.formatDate(value,'yyyy-MM-dd hh:mm',true);
            } },
            { field: 'total', title: '充值金额',halign:'center', align:'right', width: 140 ,
                formatter: function (value, row, index) {
                 return $.formatMoney(value);
            } },
           
            { field: 'pay', title: '支付金额',halign:'center', align:'right', width: 140 ,
                formatter: function (value, row, index) {
                    return $.formatMoney(value);
                        
            } }
        ]]
    });
}