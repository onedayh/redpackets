var listForm;
///初始化列表控件
function InitShareGrid() {
    listForm = new listForm('dglist',{
        iconCls: 'icon-edit',
        url: urlConfig.apiUrl.share.base,
        idField: 'id',
        doubleClickEdit: true,
        deleteColumn:true,
        editColumn:true,
        toolbar: '#tools_1',
        searchOption: { searchButton: '#btnSearch', resetButton: '#btnReset' },
        createOption: { button: '#btnNewRoute', url: '/admin/sharedetail', title: '分享配置', width: 750, height: 650, callbackFunc: { reload: function () { listForm.reload(); }} },
        deleteOption: { url:urlConfig.apiUrl.share.base },
        editOption: { url: '/admin/sharedetail', title: '分享配置', width: 750, height: 650 },
        columns: [[
            {
                field: 'name', title: '名称', width:160, formatter: function (value, row, index) {
                    if ($.isNullOrEmpty(value)) return "<a href='#' onclick=\"listForm.editRecord('" + row.id + "')\">" +row.route+ "</a>";
                    return "<a href='#' onclick=\"listForm.editRecord('" + row.id + "')\">" +value+ "</a>";
                }
            },
            {
                field: 'image', title: '分享图片', align:'center',width: 120, 
                formatter: function (value, row, index) {
                   if (!$.isNullOrEmpty(value))
                        return "<img src='" +urlConfig.base.imageBase+value+ "' onclick='formHelper.directViewImage(this,650,600)' style='width:108px;cursor:pointer'>";
                    return '屏幕截图';
                }
            },
            {
                 field: 'route', title: '页面地址', width:160, formatter: function (value, row, index) {
                     return "<a href='#' onclick=\"listForm.editRecord('" + row.id + "')\">" +value+ "</a>";
                 }
             },
             {
                field: 'disabled', title: '状态', align:'center',width:70, formatter: function (value, row, index) {
                   if (value==1) return '禁止分享';
                }
            },
            {field: 'title', title: '分享标题', width: 200}
          
        ]]
    });
}
///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    ///初始化表格
    InitShareGrid();
});



