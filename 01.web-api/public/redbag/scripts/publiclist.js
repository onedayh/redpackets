var listForm;
///初始化列表控件
function InitGrid() {
    listForm = new listForm('dg',{
        url: urlConfig.apiUrl.public.base,
        idField: 'appid',
        doubleClickEdit: false,
        toolbar: '#tools_1',
        searchOption: { searchButton: '#btnSearch', resetButton: '#btnReset' },
        createOption: { button: '#create', url: '/redbag/public', title: '添加公众号', width: 700, height: 550, callbackFunc: { reload: function () { listForm.reload(); }} },
        editOption: { url: '/redbag/public', icon: 'icon-role', title: '编辑公众号', width: 700, height: 550 },
        editColumn:true,
        //deleteColumn:true,
        //deleteOption: { url:urlConfig.apiUrl.redbags.clear,iconfont:'fa-trash-o',promotion:'清理',deleteFunc:clearRedbag },
        columns: [[
            {
                field: 'appname', title: '公众号名称',halign:'center', width:240, formatter: function (value, row, index) {
                    return "<div style='white-space:normal;word-wrap:break-word;line-height:22px'>"+
                            "<a href='#' onclick=\"listForm.editRecord('" + row.appid + "')\"><b>" + value + "</b></a>"
                            "</div>"
                }
            },
            {field: 'appid', title: 'AppId',halign:'center', width:220},
            {
                field: 'type', title: '类型',align:'center', width:150, formatter: function (value, row, index) {
                    return ["公众号","小程序"][value];
                }
            },
            {
                field: 'diversioncount', title: '引流计数',align:'center', width:150, formatter: function (value, row, index) {
                   if (value==0) return ;
                   return "<a href='#' onclick='opendiversionList(\""+row.appid+"\")'>"+value +"</span>";
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


function cachePublic(){
    ApiCaller.Post({url:urlConfig.apiUrl.public.cache,successFunc:function(result){
        $.messager.alert('提示','公众号信息缓存成功','info');
    }})
}

function opendiversionList(id){
    dialogHelper.showModal({url:'/redbag/diversionlist?id='+id,
                            width:650,height:650,title:'引流记录' });
}
