var detailForm;
var REBATE_TYPE = ["会员分销返利","课程分销返利"];
$(document).ready(function () {
    detailForm = new detailForm('form', {
        initForm:function(){
            typeChanged(0+'');
            switchEnable(0);
        },
        bindOption: {
            url: urlConfig.apiUrl.rebateconfig.base, successFunc: function (retData) {
                $('#configName').text(REBATE_TYPE[retData.id]);
                if (retData.enabled==1) $('#configenable').switchbutton({checked:true});
                ///二级返利
                if (retData.enabled2==1) $('#configenable2').switchbutton({checked:true});
                switchEnable2(retData.enabled2);
                typeChanged(retData.type+'');
                switchEnable(retData.enabled);
            }
        },
        saveOption: {button: '#lnkSave',
        url: urlConfig.apiUrl.rebateconfig.base,
        beforeFunc:function(option){
            var enableRebate = $('#configenable').switchbutton("options").checked;  
            var enableRebate2 = $('#configenable2').switchbutton("options").checked;
            $('#hidEnabled').val(enableRebate?1:0);
            $('#hidEnabled2').val(enableRebate2?1:0);
            return true;
        },
        successFunc: function (result) {
            dialogHelper.callbackFunc('reload');
            dialogHelper.closeModal(result);
        }
    }
    });
    detailForm.bindForm();
});
function typeChanged(value){
    if (value=="0") {
        $('#fixedMoney').show();
        $('#orderRate').hide();
    } 
    else{
        $('#fixedMoney').hide();
        $('#orderRate').show();
    }
}
function switchEnable(checked)
{
    if (checked) 
        $('.canShare').show();
    else
        $('.canShare').hide();
    typeChanged($('#rebateType').combobox('getValue'));
}
function switchEnable2(checked)
{
    if (checked) return $('.rate2').textbox('enable');
    $('.rate2').textbox('disable');
}