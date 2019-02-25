
var withdrawList;
function InitGrid(){
    withdrawList = new listForm('dg', {
        url: urlConfig.apiUrl.withdraw.base,
        toolbar: '#tools',
        idField:'id',
        searchOption: {
        searchButton: '#btnSearch', resetButton: '#btnReset'},
        singleSelect:false,
        rownumbers:true,
        showFooter: true,
        columns: [[
            {field: 'date', title: '提现时间',halign:'center', width: 150},
            {field: 'uid', title: '用户', halign:'center',width: 160, 
                    formatter: function (value, row, index) {
                    if ($.isNullOrEmpty(value)) return ;
                     var retUser;
                     if (!$.isNullOrEmpty(row.ulogo))
                        retUser= "<img src='" +row.ulogo+ "' style='width:30px;border:1px solid #CCC;border-radius: 50%;vertical-align:middle;'>";
                    else
                        retUser= "<img src='../images/member/default.png' style='border:1px solid #ccc;border-radius: 50%;width:30px;height:30px;vertical-align:middle;'/>";
                      retUser+='<span style="padding-left:5px;"><a href="#" onclick="showUserProfile(\''+value+'\')">'+row.username+'</a></span>';
                      return retUser;
            }},
            { field: 'money', title: '提现金额',halign:'center', align:'right', width: 150 ,
                formatter: function (value, row, index) {
                 return $.formatMoney(value);
            } },
            { field: 'status', title: '提现状态',align:'center', width: 180 ,
                formatter: function (value, row, index) {
                if (row.footer==1) return;
                if (value==0) return "<span class='status0'>提现错误</span>";
                if (value==1) return "<span class='status1'>提现成功</span>";
                return "<span class='status100'>提现失败,退回余额</span>";
            }}
        ]]
    });
}

///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    InitGrid();
});



