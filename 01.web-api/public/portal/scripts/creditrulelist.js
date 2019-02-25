var listForm;
///初始化列表控件
function InitRuleGrid() {
    listForm = new listForm('dg',{
        iconCls: 'icon-edit',
        url: urlConfig.apiUrl.creditrule.base,
        idField: 'id',
        doubleClickEdit: true,
        toolbar: '#tools_1',
        editColumn:true,
        deleteColumn:true,
        rownumbers: true,//行号 
        searchOption: { searchButton: '#btnSearch', resetButton: '#btnReset' },
        createOption: { button: '#btnNewRule', url: '/portal/creditrule',  title: '积分规则', width: 750, height: 400, callbackFunc: { reload: function () { listForm.reload(); }} },
        deleteOption: { button: '#btnDeleteRule', url: urlConfig.apiUrl.creditrule.base},
        editOption: { url: '/portal/creditrule', title: '积分规则', width: 750, height: 400 },
        rowStyler: function(index,row){
		if (row.disable==1){
			return 'background-color:#eee;'; 
            }
	    },
        onLoadSuccess:function(data){
            $('.c5').linkbutton({});
        },
        columns: [[
            {field: 'id', title: '规则编号',align:'center', width: 70,
                formatter: function (value, row, index) {
                    return "<a href='#' onclick=\"listForm.editRecord('" + row.id + "')\"><span style='color:red;font-weight:bold;'>" + value + "</span></a>";
            }},
            {field: 'name', title: '名称',halign:'center', width: 150,
                formatter: function (value, row, index) {
                    return "<a href='#' onclick=\"listForm.editRecord('" + row.id + "')\">" + value + "</a>";
            }},
             {
                field: 'io', title: '增减类型',align:'center',width: 60,
                formatter: function (value, row, index) {
                    if (value==0) return '<font color="green">扣减</font>';
                   return '<font color="red">增加</font>';
                }
            },
            {
                field: 'ruletype', title: '调用限制',halign:'center',width: 90,
                formatter: function (value, row, index) {
                    return ["无限制","每日限一次","累计限一次"][value];
                }
            },
             {field: 'credittype', title: '赠送积分',align:'right', halign:'center',width: 120, sortable: true, 
                    formatter: function (value, row, index) {
                    if (value==0) return '固定:【<font color="red">'+row.fixed+'</font>】';
                    return '调用传入';
             }},
              {field: 'disable', title: '规则状态',align:'center',width:100, sortable: true, 
                    formatter: function (value, row, index) {
                     if (value==1) return '<a href="#" onclick="setRuleStatus('+row.id+',0)" class="easyui-linkbutton c5" style="width: 80px;color:#fff;background:#b52b27;border-color:#b52b27">启用规则</a>';
                    return '<a href="#" onclick="setRuleStatus('+row.id+',1)" class="easyui-linkbutton c5" style="width: 80px;color:#fff;background:#2984a4;border-color:#2984a4">停用规则</a>';
             }}
             
        ]]
    });
}
///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    ///初始化表格
    InitRuleGrid();
});

function reload(){
    listForm.reload();
}
function setRuleStatus(id,status){
    $.messager.confirm('询问','确认执行该操作?',function(r){
        if (r){
            ApiCaller.Put({url:urlConfig.apiUrl.creditrule.updatestatus.format(id),data:{rule_disabled:status},successFunc:function(result){
                listForm.reload();
            }})
        }
    })
}


