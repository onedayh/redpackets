var detailForm, rolelistForm,imgHeader;
var dgUserRoleLoaded, dgPrevilegeLoaded;
$(document).ready(function () {
    $('#tabPersonal').tabs({
        onSelect: function (title, index) {
            switch (index) {
                case 1: InitUserRoleGrid(); break;
            }
        }
    });
    $("input",$("#loginid").next("span")).blur(validatorloginName);
    //formHelper.initializePopup();
    //imgHeader= new uploader('imgHead',{fileKey:'userheader',refControl:{contentControl:'userHead',imageControl:'imgHead'}});
    detailForm = new detailForm('form', {
        initForm:function(){
            $('#tabPersonal').tabs('close', 1);
        },
        bindOption: {
            url: urlConfig.apiUrl.user.base, successFunc: function (result) {
                $("#loginid").attr("readonly","readonly");
                $('#imgHead')[0].setImage(result.photo);
            }
        },
        saveOption: {
            button: '#lnkSave', url: urlConfig.apiUrl.user.base,
            beforeFunc: function () {
                if (loginIdExistFlag) {
                    $.messager.alert('提示', '用户的登录帐号重复，请重新输入.', 'info');
                    return false;
                }
                return true;
            },
            successFunc: function (result) {
                if (detailForm.getCurrentAction() == 'addnew') {
                    dialogHelper.callParentFunc('reloadUser');
                    $.redirect('/admin/userdetail?actionType=edit&key=' + result.id + '&random=' + Math.random());
                }
                else {
                    dialogHelper.closeModal(result);
                }
            }
        }
    });
    detailForm.bindForm();
})

function uploadSuccess(file, serverData) {
    var filename = $.getFilename(serverData);
    $('#userHead').val( filename);
    $('#imgHead').attr('src', urlConfig.staticfiles.images.userhead + filename);
}
function selectComplete() {
    swfu.startUpload();
}
///初始化列表控件
function InitUserRoleGrid() {
    if (rolelistForm != null) return;
    rolelistForm = new listForm('dgRoles', {
        //title: '应用系统列表',
        deleteOption: {
            button: '#lnkRemoveRole', url: urlConfig.apiUrl.userrole.base,
                successFunc: function () {
                rolelistForm.removeRow();
            }
        },
        url: urlConfig.apiUrl.user.roles.format(detailForm.getCurrentKey()),
        idField: 'id',
        toolbar: '#tools_1',
        pagination: false,
        rownumbers: true,//行号 
        columns: [[
            { field: 'name', title: '角色名称', width: 300 }
        ]]
    });
}

function addRoles() {
    formHelper.popupSelect({ url: '/common/selector?user_id='+detailForm.getCurrentKey(), title: '分配角色', datakey: 'addrole', multiselect: true, width: 450, height: 530, afterSelectFunc: cs_SelectRoles});
}

function cs_SelectRoles(itemData) {
    if (itemData && itemData.length>0) {
        var roleKeys =[];
        for (var nItem of itemData) 
            roleKeys.push(nItem.id);
        if (roleKeys.length<=0) return;
        ApiCaller.Post({url:urlConfig.apiUrl.userrole.base,data:{user_id:detailForm.getCurrentKey(),role_id:roleKeys.join(',')},
                        successFunc:function (result) {
                            rolelistForm.reload();
        }});
    }
}
var loginIdExistFlag = false;
function validatorloginName() {
    var loginName = $('#loginid').val();
    if ($.trim(loginName) == '') return;
    ApiCaller.Post({url:urlConfig.apiUrl.user.checkaccount,data:{account:loginName},
        successFunc:function (result) {
        if (result.successed && !result.existed) {
            $('#errormessage').html("<span style='color:green'><i style='fa fa-check'></i>账号可用</span>");
            loginIdExistFlag = false;
        }
        else {
            $('#errormessage').html("<i style='fa fa-close'></i>账号重复");
            loginIdExistFlag = true;
        }
    }});
}
