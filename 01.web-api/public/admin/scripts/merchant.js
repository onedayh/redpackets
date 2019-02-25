var detailForm;
 var currentUser;
$(document).ready(function () {
    currentUser = ApiCaller.getUser();
    //imgHeader= new uploader('imgLogo',{fileKey:'merchant',refControl:{contentControl:'logo',imageControl:'imgLogo'}});
     detailForm = new detailForm('form', {
        itemkey:currentUser.id,
        bindOption: {
            url: urlConfig.apiUrl.merchant.base, successFunc: function (result) {
                $('#imgLogo')[0].setImage(result.logo);
            }
        },
        saveOption: {
            button: '#lnkSave', url: urlConfig.apiUrl.merchant.base,
            successFunc: function (result) {
                dialogHelper.callParentFunc('displayUserInfo');
                updateSetting(function(res){
                    dialogHelper.closeModal(result);
                });
                
            }
        }
    }); 
    detailForm.bindForm();
});
function isSafePassword(value) {
        return !(/^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/.test(value));
}
function checkPasswordInvalid(option) {
    var oldpassword = option.data.oldpassword,
        newpassword = option.data.newpassword;

    if (oldpassword=='') {
        $.messager.alert('错误', '请输入旧密码!', 'error');
        return false;
    }
    var cfmpsd = $('#passwordconfirm').val();
    if (newpassword.length < 6 || newpassword.length > 20 || !isSafePassword(newpassword)) {
        $.messager.alert('错误', '密码长度请介于6位到20位之间,且必须包含字母和数字!', 'error');
        return false;
    }
    if (cfmpsd!=newpassword) {
        $.messager.alert('错误', '请输入新密码或密码确认输入，并且保持一致!', 'error');
        return false;
    }
    if (oldpassword ==newpassword) {
        $.messager.alert('提示', '您的新密码和旧密码没有变化，请重新输入一个！', 'info');
        return false;
    }
    option.data.oldpassword =$.md5(oldpassword);
    option.data.newpassword =$.md5(newpassword);
    return true;
}
function ChangePassword() {
    dataForm.postAction({
        url: urlConfig.apiUrl.merchant.changepassword.format(currentUser.id), data: { oldpassword: $('#oldpassword').val(), newpassword: $('#newpassword').val() },
        beforeFunc:checkPasswordInvalid,
        successMessage: '密码修改成功', failMessage: '密码修改失败,旧密码输入错误!', successFunc: function () {
            if ($.getUrlParam('force')=='1')  dialogHelper.closeModal(true);
        }
    });
}

function checkInputValue(item,blankMessage){
    var value = $('#'+item).textbox('getValue');
    if (value==''){
        $.messager.alert('提示',blankMessage,'info');
        return false;
    }
    return true;
}

function updateSetting(func){
    //if (!checkInputValue('securitykey','请输入小程序密匙')) return ;
    ApiCaller.Put({
        url: urlConfig.apiUrl.merchant.changeappsetting.format(currentUser.id), 
        data: { 
            securitykey: $('#securitykey').textbox('getValue'), 
            wxmid: $('#wxmid').textbox('getValue') ,
            wxmkey: $('#wxmkey').textbox('getValue') ,
            wxmcert: $('#wxmcert').textbox('getValue') ,
            smsappid: $('#smsappid').textbox('getValue') ,
            smsappkey: $('#smsappkey').textbox('getValue') 
        },
        successFunc:function(result){
            dataForm.callFunc(func,result);
            //$.messager.alert('提示','信息设置成功','info');
        }
    });
}