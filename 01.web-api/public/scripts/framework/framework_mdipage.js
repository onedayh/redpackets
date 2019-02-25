// var rootDir = 'http://192.168.0.184:10000'
// var themes = {
//     'metro':rootDir+'/app_themes/metro/easyui.css',
//     'bootstrap': rootDir+'/app_themes/bootstrap/easyui.css',
//     'blue': rootDir+'/app_themes/default/easyui.css',
//     'green': rootDir+'/app_themes/green/easyui.css',
//     'black': rootDir+'/app_themes/black/easyui.css',
//     'sunny':rootDir+'/app_themes/sunny/easyui.css'
// };
$(function () {
     /*布局部分*/
    $('#main-layout').layout({fit:true});  /*布局框架全屏*/
    $(window).resize(function () {
        $('#main-layout').layout('resize');
         var clientHeight = document.documentElement.clientHeight;
        $('#main-layout').css('height', clientHeight + 'px');
        $('#main-layout').layout('resize', {'height':clientHeight});
    });
    var clientHeight = document.documentElement.clientHeight;
    $('#main-layout').css('height', clientHeight + 'px');
    $('#main-layout').layout('resize', {'height':clientHeight});

    $('.pagination-page-list').combobox({editable:false,panelHeight: 'auto'});
    ////设置权限
    setPageSecurity();

    //loadSkin();
});


function setAreaResize() {
     $('#main-layout').layout('resize');
}

////根据用户的
function setPageSecurity(){
    ////查找所有界面上具备权限控制的内容
    ////security="allow:[platforadmin],deny:[finance]"
    ///用户是超级管理员，无需权限控制
    if (ApiCaller.userIsSuper() || ApiCaller.userIsAdmin()) return;
    $('*[security]').each(function (index, item) {
        var securityInfo = eval('({' + item.attributes['security'].value + '})');
        if (securityInfo) {
            ///首先检查用户是不是在被禁止的角色中
            var denyRoles = $.arrayIntersection(ApiCaller.userRoles(), securityInfo.deny);
            if (denyRoles.length>0){
                $(item).hide();
                return;
            }
            ///检查是否存在允许的设置，如果存在，则需要判断用户是否有该角色的身份
            if (!securityInfo.allow || securityInfo.allow.length==0) return;
            var allowRoles = $.arrayIntersection(ApiCaller.userRoles(),securityInfo.allow);
            if (allowRoles.length<=0){
                $(item).hide();
                return;
            }
        }
    });
}