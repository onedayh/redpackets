var listForm;
const PAY_TYPE =["<span class='pay-wechat'><i class='fa fa-wechat'></i>&nbsp;微信支付</span>",
"<span><i class='fa fa-user'></i>&nbsp;人工支付</span>"]
///初始化列表控件
function InitGrid() {
    listForm = new listForm('dg',{
        url: urlConfig.apiUrl.redbags.income,
        idField: 'id',
        doubleClickEdit: false,
        toolbar: '#tools_1',
        showFooter:true,
        searchOption: { searchButton: '#btnSearch', resetButton: '#btnReset' },
        //editOption: { url: '/redbag/redbag', icon: 'icon-role', title: '红包', width: 800, height: 650 },
        //editColumn:true,
       // deleteOption: { url:urlConfig.apiUrl.redbag.base },
        columns: [[
            {
                field: 'topic', title: '红包主题',halign:'center', width:220, formatter: function (value, row, index) {
                    if (row.footer==1) return;
                    return "<div style='white-space:normal;word-wrap:break-word;line-height:28px'>"+
                            "<b>" + value + "</b><br/>"+
                            (row.rollback==1?"(用户已撤回)<br/>":"")+
                            $.formatDate(row.createdate,'yyyy年MM月dd日 hh:mm',true)+
                            "</div>"
                }
            },
            {
                field: 'userlogo', title: '红包主',halign:'center', width:150, 
                formatter: function (value, row, index) {
                    if (row.footer==1) return;
                   return '<img src="' +row.userlogo+ '" class="userlogo"><span class="username">'+row.username+'</span>';
                }
            },
            {
                field: 'amount', title: '红包金额', align:'center',width: 120, sortable: true, 
                formatter: function (value, row, index) {
                    return $.formatMoney(value);
                }
            },
            {field: 'service', title: '服务费', align:'center',width:110, 
                formatter: function (value, row, index) {
                    return $.formatMoney(value);
                }
            },
            {field: 'paytype', title: '支付方式', align:'center',width:160, 
                formatter: function (value, row, index) {
                    if (row.footer==1) return;
                    var retString = PAY_TYPE[value];
                    if (value==1) retString+='&nbsp;&nbsp;['+row.operator+']';
                    return retString;
                }
            },
            {
                field: 'gotamount', title: '发放金额', align:'center',width: 110, 
                formatter: function (value, row, index) {
                    return $.formatMoney(value);
                }
            },     
            {
                field: 'remainamount', title: '剩余金额', align:'center',width: 110, 
                formatter: function (value, row, index) {
                    return $.formatMoney(value );
                }
            }            
        ]]
    });
}
///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    ///初始化表格
    InitGrid();
});


function reload(){
    listForm.reload();
}
