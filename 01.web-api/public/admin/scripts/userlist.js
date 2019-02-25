var userlist;
///初始化列表控件
function InitUserGrid() {
    userlist = new listForm('dg', {
        url: urlConfig.apiUrl.user.base,
        method:"get",
        doubleClickEdit:true,
        idField: 'id',
        toolbar: '#tools_1',
        searchOption: {
            searchButton: '#btnSearch', resetButton: '#btnReset', beforeFunc: function (result) {
                if (treeForm.selectedNode()!=null)  result.deptUid = treeForm.selectedKeyValue();
                return true;
            }},
        createOption: {
            button: '#btnNewUser', url:'/admin/userdetail',title: '用户信息', width: 720, height: 460
        },
        deleteOption: { button: '#btnDeleteUser', url:urlConfig.apiUrl.user.base },
        editOption: { url:  '/admin/userdetail',title: '用户信息', width: 720, height: 460 },
        columns: [[
            {
                field: 'photo', title: '',align:'center', halign:'center',width: 50, formatter: function (value, row, index) {
                    var header;
                    if (!$.isNullOrEmpty(value))
                        header= "<img src='"+ urlConfig.base.imageBase+value+ "' style='border:1px solid #ccc;border-radius: 50%;width:32px;height:32px;cursor:pointer'>";
                    else
                       header= "<img src='../images/member/default.png' style='border:1px solid #ccc;border-radius: 50%;width:32px;height:32px'/>";
                   return '<div class="corner_prompt">'+header+'</div>';
                }
           },
            {
                field: 'name', title: '姓名', width: 150, sortable: true,
                formatter: function (value, row, index) {
                    return "<a href='#' onclick=\"userlist.editRecord('" + row.id + "')\">" + value + "</a>";
                }
            },
            { field: 'account', title: '登录账号', width: 150, sortable: true },
            { field: 'roles', title: '用户角色', width: 180},
            {
                field: 'disabled', title: '用户状态', width: 60, align: 'center', formatter: function (value, row, index) {
                    if (value == 1)
                        return '<i class="fa fa-user-circle-o"></i>';
                }
            },
        ]]
    });
}
///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    InitUserGrid();
});


function reloadUser() {
    userlist.reload();
}


function resetPassword() {
    var userKeys = userlist.selectedKeyValue();
    if ($.isNullOrEmpty(userKeys)) {
        return $.messager.alert('提示', '请选择一个用户.', '');
    }
    dataForm.postAction({
        confirm: true,
        confirmMessage: '确认要重置选中用户的密码吗?',
        url: urlConfig.apiUrl.user.reset.format(userKeys),successMessage: '密码已成功重置为初始密码【123456】!',
    });
}
////停用或启用账号
function setUserEnableStatus(disble) {
    var userKeys = userlist.selectedKeyValue();
    if ($.isNullOrEmpty(userKeys)) {
        return $.messager.alert('提示', '请选择一个用户操作.', '');
    }
    var message = '确认要' + (disble==1? '停用':'启用') + '选中的用户吗?'
    dataForm.doAction({
        method:'post',
        confirm: true,
        confirmMessage: message,
        url: urlConfig.apiUrl.user.disable.format(userKeys), data: { disable:disble}, successFunc: function (result) {
            reloadUser();
        }
    });
}

function exportUser() {
    userlist.exportFile('users', 'user.xls');
}
function importUser() {
    dialogHelper.showModal({ title: '数据导入', url: '/Admin/ImportExcel.aspx?key=user', width: 700, height: 450, closeFunc: reloadUser(), icon: 'icon-import' });

}
