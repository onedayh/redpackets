var listForm;
///初始化列表控件
function InitFeedGrid() {
    listForm = new listForm('dg',{
        url: urlConfig.apiUrl.feedback.base,
        idField: 'id',
        //doubleClickEdit: true,
       // toolbar: '#tools_1',
        rownumbers: true,//行号 
        searchOption: { searchButton: '#btnSearch', resetButton: '#btnReset' },
        columns: [[
            {field: 'date', title: '反馈日期',halign:'center', width: 140,
                formatter: function (value, row, index) {
                return $.formatDate(value,'yyyy-MM-dd hh:mm',true);
            }},
            {
                 field: 'username', title: '用户', halign:'center',width: 90, 
                 formatter: function (value, row, index) {
                     var retUser;
                     if (!$.isNullOrEmpty(row.image))
                        retUser= "<img src='" +row.image+ "' style='width:30px;border:1px solid #CCC;border-radius: 50%;vertical-align:middle;'>";
                    else
                        retUser= "<img src='../images/member/default.png' style='border:1px solid #ccc;border-radius: 50%;width:30px;height:30px;vertical-align:middle;'/>";
                      retUser+='<span style="padding-left:5px;">'+value+'</span>';
                      return retUser;
                 }
             },
             {field: 'type', title: '反馈类型',halign:'center', width: 70,
                formatter: function (value, row, index) {
                    return constEnum.PLATFORM_FEEDBACK_TYPE_ENUM[value];
                
            }},
             {field: 'content', title: '用户意见',halign:'center', width: 350,
                formatter: function (value, row, index) {
                 if (!$.isNullOrEmpty(value)){
                     return '<div style="white-space:normal;word-wrap:break-word;line-height:22px">'+row.content+'</div>';
                 }
            }},
            {field: 'status', title: '状态',align:'center', width: 100,
                formatter: function (value, row, index) {
                    if(value==1) return '采纳';
            }}
             
        ]]
    });
}
///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    ///初始化表格
    InitFeedGrid();
});
function acceptFeedback(status){
    var selectid = listForm.selectedKeyValue();
    if ($.isNullOrEmpty(selectid)){
        $.messager.alert('提示','请选择反馈意见采纳','info');
        return;
    }
    ApiCaller.Put({url:urlConfig.apiUrl.feedback.accept.format(selectid),data:{status:status},
        successFunc:function(result){
            listForm.reload();
    }})
}

