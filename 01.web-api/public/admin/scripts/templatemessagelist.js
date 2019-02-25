var listForm;
///初始化列表控件
function InitFeedGrid() {
    listForm = new listForm('dg',{
        url: urlConfig.apiUrl.templatemessage.base,
        idField: 'id',
        toolbar: '#toolbar',
        doubleClickEdit: true,
        rownumbers: true,//行号
        editColumn: true,
        //deleteColumn: true,
        editOption: { url: '/admin/templatemessagedetail', title: '模版消息', width: 660, height: 400 },
        createOption: {
            button: '#btnNew', url:'/admin/templatemessagedetail',title: '模版消息', width: 660, height: 400
        },
        //deleteOption: { button: '#btnDelete', url:urlConfig.apiUrl.templatemessage.base },
        searchOption: { searchButton: '#btnSearch', resetButton: '#btnReset' },
        rowStyler: function(index,row){
            if (row.status==1){
                return 'background-color:#ffeed7;'; 
                }
            },
        columns: [[
            {field: 'messagekey', title: '模版消息KEY',halign:'center', width: 140},
            {field: 'messageid', title: '模版消息ID', halign:'center',width: 200},
            {field: 'id', title: '删除', halign:'left',width: 60, formatter:function (val, row, index){
                return '<i class="fa fa-remove" onclick="delMessage(\''+ row.messagekey + '\',' + val +')"></i>';
            }}
        ]]
    });
}

///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    ///初始化表格
    InitFeedGrid();
});

function delMessage(key, id){
    $.messager.confirm('确认','确认要删除该记录吗',function(r){
        if (r)
            ApiCaller.Delete({url:urlConfig.apiUrl.templatemessage.base + '/' + id,
                data:{id:id,key:key},
                successFunc:function(result){
                    listForm.reload();
                }})
    })
}

