var memberlist;
var singleSelect = true;
///获取页面的设置
function getSetting(){
    ///是否允许多选
    var selectOption = $.getUrlParam("multiSelect");
    if (!$.isNullOrEmpty(selectOption) && selectOption.toLowerCase()=="true") singleSelect = false;
    ///过滤条件
    clientFilter =window.location.search; //$.getUrlParam("clientFilter");
    return true;
};
///初始化列表控件
function InitUserGrid() {
    memberlist = new listForm('dg',{
        url: urlConfig.apiUrl.member.base+clientFilter,
        idField: 'id',
        toolbar: '#tools_User',
        singleSelect:singleSelect,
        searchOption: { searchButton: '#btnSearch', resetButton: '#btnReset' },
        columns: [[
            { field: 'ck', checkbox: true, width: 40 },
            {
                field: 'logo', title: '',align:'center', halign:'center',width: 50, formatter: function (value, row, index) {
                    var header;
                    if (!$.isNullOrEmpty(value))
                        header= "<img src='" +value+ "' style='border:1px solid #ccc;border-radius: 50%;width:32px;height:32px;cursor:pointer'>";
                    else
                       header= "<img src='../images/member/default.png' style='border:1px solid #ccc;border-radius: 50%;width:32px;height:32px'/>";
                   return header;
                }
           },
            {field: 'name',title: '姓名',halign: 'center',width: 240}
        ]]
    });
}

$(document).ready(function () {
    var randomkey = Math.random();
    getSetting();
    InitUserGrid();
});


function ConfirmSelected() {
    var checkedItem = [];
    memberlist.getChecked().forEach(function(row){
        checkedItem.push({id:row.id,imageurl:row.logo,name:row.name,realname:row.realname,mobile:row.mobile});
     })
    if (checkedItem.length==0) return $.messager.alert("提示", "请选择一个用户!", "info");
    var retObject =singleSelect==true? checkedItem[0]:checkedItem;
    return dialogHelper.closeModal(retObject);
}
