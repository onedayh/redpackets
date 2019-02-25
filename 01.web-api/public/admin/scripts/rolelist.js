var listForm;
///初始化列表控件
function InitRoleGrid() {
    listForm = new listForm('dglist',{
        url: urlConfig.apiUrl.role.base,
        idField: 'id',
        toolbar: '#tools_1',
       // searchOption: { searchButton: '#btnSearch', resetButton: '#btnReset' },
       editOption: { url: '/admin/roledetail', title: '角色管理', width: 750, height: 650 },
        columns: [[
             {
                 field: 'name', title: '角色', width: 300, sortable: true, formatter: function (value, row, index) {
                     return "<a href='#' onclick=\"listForm.editRecord('" + row.id + "')\">" +value+ "</a>";
                 }
             },
             {
                field: 'key', title: 'KeyValue', width: 300, sortable: true, formatter: function (value, row, index) {
                    return value;
                }
            },
            {
                field: 'admin', title: '管理员',width: 100, align: 'center', sortable: true, formatter: function (value, row, index) {
                    if (value == 1)
                        return '<i class="fa fa-check"></i>';
                }
            }
        ]]
    });
}
///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    ///初始化表格
   InitRoleGrid();
});



