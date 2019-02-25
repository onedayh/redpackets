var dgPrevilegeLoaded, listUsers;
var detailForm;
$(document).ready(function () {
    detailForm = new detailForm('form', {
        bindOption: { url: urlConfig.apiUrl.role.base,successFunc:function(result){
            $('#spanName').text(result.name);
            if (result.admin==1) $('#spanAdmin').show();
            InitUserGrid();
        }}
        // saveOption: {
        //     button: '#lnkSave', url: urlConfig.apiUrl.role.base,
        //     successFunc: function (result) {
        //         if (detailForm.getCurrentAction() == 'addnew') {
        //             // dialogHelper.callParentFunc('reloadRoles');
        //             dialogHelper.callbackFunc('reload');
        //             $.redirect('/admin/roledetail?actionType=edit&key=' + result.id + '&random=' + Math.random());
        //         }
        //         else {
        //             dialogHelper.closeModal(result);
        //         }
        //     }
        // }
    });
     detailForm.bindForm();
});
///初始化列表控件
function InitUserGrid() {
    if (listUsers) return;
    listUsers = new listForm('dgUsers', {
        url: urlConfig.apiUrl.role.users.format(detailForm.getCurrentKey()),
        idField: 'id',
        deleteOption: {
            button: '#btnDeleteUser', url: urlConfig.apiUrl.userrole.base,
            successFunc: function (result) {
                listUsers.removeRow();
            }
        },
       //fit:false,
        toolbar: '#tools_1',
        pagination: false,
        rownumbers: true,//行号 
        columns: [[
            { field: 'account', title: '登录账号', width: 140 },
            { field: 'name', title: '用户姓名', width: 140 }
        ]]
    });
}

function addUsers() {
    formHelper.popupSelect({ url: '/common/selector?role_id='+detailForm.getCurrentKey(), title: '添加用户', datakey: 'addroleuser', multiselect: true, width: 500, height: 530, afterSelectFunc: cs_SelectUsers, icon: 'icon-user' });
}
function cs_SelectUsers(itemData) {
    if (itemData && itemData.length>0) {
        var userKeys = [];
        for (var nItem of itemData) {
            userKeys.push(nItem.id);
        }
        if (userKeys.length<=0) return;
        dataForm.postAction({
            url: urlConfig.apiUrl.userrole.base,prompt:false, data: { role_id: detailForm.getCurrentKey(), user_id: userKeys.join(',') },
            successFunc: function (result) {
                listUsers.reload();
            }
        });
    }
}