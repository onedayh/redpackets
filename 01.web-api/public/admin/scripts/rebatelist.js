var listForm;
///初始化列表控件
function InitRebateGrid() {
   
    listForm = new listForm('dglist',{
        iconCls: 'icon-edit',
        url: urlConfig.apiUrl.rebateconfig.base,
        idField: 'id',
        doubleClickEdit: true,
        // deleteColumn:true,
        editColumn:true,
        editOption: { url: '/admin/rebatedetail', title: '分销返利配置', width: 780, height: 470 },
        columns: [[
            {
                field: 'id', title: '分销类型', align:'center',width: 120, 
                formatter: function (value, row, index) {
                    var typeName = ["会员分销返利","课程分销返利"][value];
                    return "<a href='#' onclick=\"listForm.editRecord('" + row.id + "')\">" +typeName+ "</a>";
                }
            },
            {
                 field: 'enabled', title: '启用/关闭', width:80,align:'center', 
                 formatter: function (value, row, index) {
                     if(value==1) return '<span style="padding:3px 6px;border-radius:6px;border:1px solid #ff8400;color:#ff8400">启用</span>';
                     return '<span style="padding:3px 6px;border-radius:6px;border:1px solid #aaa;color:#aaa">关闭</span>';
                 }
             },
             {
                field: 'type', title: '返利模式', width:80, 
                formatter: function (value, row, index) {
                    if(value==0) return '固定金额';
                    return '订单比率';
                }
            },
            {
                field: 'rate1', title: '一级返利',align:'center', width:130, 
                formatter: function (value, row, index) {
                    if(row.type==0) return $.formatMoney(row.money1);
                    return '返利比率 : '+ value + ' %';
                }
            },
            {
                field: 'enabled2', title: '开启二级返利', width:100,align:'center',
                formatter: function (value, row, index) {
                    if(value==1 && row.enabled==1) return '<span style="padding:3px 6px;border-radius:6px;border:1px solid #ff8400;color:#ff8400">启用</span>';
                    return '<span style="padding:3px 6px;border-radius:6px;border:1px solid #aaa;color:#aaa">关闭</span>';
                }
            },
            {
                field: 'rate2', title: '二级返利',align:'center', width:130, sortable: true, 
                formatter: function (value, row, index) {
                    if (row.enabled2==0) return '-'
                    if(row.type==0) return $.formatMoney(row.money2);
                    return '返利比率 : '+ value + ' %';
                }
            }
        ]]
    });
}
///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    ///初始化表格
    InitRebateGrid();
});
function reload(){
    listForm.reload();
}


