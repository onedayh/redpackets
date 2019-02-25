var detailForm;
function getSystemSetting() {
    debugger;
    ApiCaller.Get({ url:urlConfig.apiUrl.systemsetting.base,
        successFunc:function(retData){
            if (retData.json) {
                var result =JSON.parse(retData.json);
                $('#form').form('load', result);
                //$.setImage('imgAudit',result.auditimage);
                // 页面只放一个imageUpload组件
                // 页面放多个imageUpload组件
                $('#imgAudit')[0].setImage(result.auditimage);
                console.log(result)
            }
        }
    })
}
function setExpired(){
    var link=$('#grouplink').numberbox('getValue');
    if (!$.isNullOrEmpty(link)){
        ApiCaller.Post({url:'/api/framework/expired/'+link,successFunc:function(result){
            $.messager.alert('成功','设置缓存成功!','info');
        }})
    }
}
$(document).ready(function () {
    //var imgAudit= new uploader('imgAudit',{fileKey:'poster',refControl:{contentControl:'auditImage',imageControl:'imgAudit'}});
    $('#lnkSave').bind('click', function () {
         if (!$('#form').form('validate'))  return $.messager.alert('提示', '请完整输入界面中的必填内容并保证输入合法!', 'info');
        var json = $('#form').serialize();
        ApiCaller.Put({ url:urlConfig.apiUrl.systemsetting.base,
            data:json,
            successFunc:function(result){
                $.messager.alert('成功','配置保存成功!','info');
            }
        })
    });
    getSystemSetting();

});
