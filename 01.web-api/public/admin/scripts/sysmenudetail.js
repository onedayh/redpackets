var detailForm, listPrivilege;
var dgUserRoleLoaded, dgPrevilegeLoaded;
$(document).ready(function () {
    $('#tabMenu').tabs({
        onSelect: function (title, index) {
            switch (index) {
                case 1: InitMenuPrivilege(); break;
            }
        }
    });
    detailForm = new detailForm('form', {
        initForm:function(){
                $('#pid').val($.getUrlParam('parentUid'));
                $('#tabMenu').tabs('close', 1);
               },
        bindOption: {
            url: urlConfig.apiUrl.functions.base, 
                successFunc: function (result) {
                $('#imgIcon')[0].setImage(result.icon);
                //if (result.icon)  $('#icon').attr('src', urlConfig.base.imageBase +result.icon);
            }},
        saveOption: {
            button: '#lnkSave', url: urlConfig.apiUrl.functions.base,
            successFunc: function (result) {
                if (detailForm.getCurrentAction() == 'addnew') {
                    dialogHelper.callbackFunc('reload');
                    $.redirect('/admin/menudetail?actionType=edit&key=' + result.id + '&random=' + Math.random());
                }
                else {
                    dialogHelper.callbackFunc('reload');
                    dialogHelper.closeModal(result);
                }
            }
        }
    });
    detailForm.bindForm();
})
function addUserRoles() {
    formHelper.popupSelect({title:'分配角色&用户', datakey: 'adduserandrole', multiselect: true, width: 550, height: 630, afterSelectFunc: cs_setFunctionRoles, icon: 'icon-role' });
}

function cs_setFunctionRoles(itemData) {
    if (itemData) {
        if (itemData.length <= 0) return;
        var roleKeys=[], userKeys=[];
        itemData.forEach(function(item){
            if (item.type==0)  ///Added for userUid
                userKeys.push(item.id);
            else if (item.type==1)
                roleKeys.push(item.id)
        }) 
        ApiCaller.Post({
            url: urlConfig.apiUrl.functions.addprivileges.format(detailForm.getCurrentKey()), 
            data: {userid: userKeys.join(','), roleid: roleKeys.join(',')},
            successFunc: function (result) {
                listPrivilege.reload();
            }
        });
    }
}

//初始化列表控件
function InitMenuPrivilege() {
    if (listPrivilege != null) return;
    listPrivilege = new listForm('dgPrivilege', {
        //title: '应用系统列表',
        deleteOption: {
            button: '#lnkRemoveRole', url: urlConfig.apiUrl.funcprivilege.base,
            beforeFunc:function(opt){
                if (listPrivilege.selectedRow('inherit')==1) {
                    $.messager.alert('提示','继承的权限不能删除!','info');
                    return false;
                }
                return true;
            },
            successFunc: function () {
                listPrivilege.reload();
            }
        },
        iconCls: 'icon-edit',
        url:urlConfig.apiUrl.functions.privileges.format( detailForm.getCurrentKey()),
        idField: 'rec_id',
        toolbar: '#tools_1',
        pagination: false,
        singleSelect:true,
        rownumbers: true,//行号 
        columns: [[
            { field: 'user_name', title: '用户名称', width: 120 },
            { field: 'role_name', title: '角色名称', width: 150 },
            {
                field: 'inherit', title: '继承权限', halign: 'center', align: 'center', width: 80, formatter: function (value, row, index) {
                    if (value == 1)  return "<i class='fa fa-check'/>";
                }
            },
            {
                field: 'privilege', title: '允许', width: 80, halign: 'center', align: 'center', formatter: function (value, row, index) {
                    if (row.inherit == 1)
                       return (value & 0x10000) > 0 ? "<i class='fa fa-check'/>" : "";
                    else
                        return "<input type='checkbox' onclick='setPrivilege(\""+row.rec_id+"\")' id='chk" + row.rec_id + "' " + ((value & 0x10000) > 0 ? "checked />" : "/>");
                }
            },
            {
                field: 'uu', title: '禁止', width: 80, halign: 'center', align: 'center', formatter: function (value, row, index) {
                    if (row.inherit == 1)
                       return (row.privilege & 1) > 0 ? "<i class='fa fa-check'/>" : "";
                    else
                        return "<input type='checkbox'  onclick='setPrivilege(\""+row.rec_id+"\")' id='chkN" + row.rec_id + "' " + ((row.privilege & 0x1) > 0 ? "checked='checked' />" : "/>");
                }
            }
        ]]
    });
}

function setPrivilege(recid,allow,chkBox)
{
    var allow = $('#chk' + recid).prop("checked") ;//== "checked";
    var forbid = $('#chkN' + recid).prop("checked") ;//== "checked";
    var rightValue = (allow ? 0x10000 : 0) + (forbid ? 1 : 0);
    ApiCaller.Put({url:urlConfig.apiUrl.funcprivilege.update.format(recid),data:{right_data:rightValue}});
}
function uploadSuccess(file, serverData) {
    $('#icon').show();
    $('#hideicon').val(urlConfig.staticfiles.images.menu + file.name);
    $('#icon').attr('src', urlConfig.staticfiles.images.menu + file.name);
}

