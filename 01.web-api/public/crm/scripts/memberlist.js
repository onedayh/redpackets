var memberlist;
///初始化列表控件
function InitMemberGrid() {
    memberlist = new listForm('dg', {
        //title: '应用系统列表',
        iconCls: 'icon-edit',
        url: urlConfig.apiUrl.member.base,
        method:"get",
        doubleClickEdit:false,
        //editColumn:true,
        idField: 'id',
        toolbar: '#tools_1',
        rowStyler: function(index,row){
		if (row.isnew==0){
			return 'background-color:#f4fcf1;'; 
            }
	    },
        searchOption: {searchButton: '#btnSearch', resetButton: '#btnReset'},
        editOption: { url:  '/crm/memberdetail',iconfont:'fa-search',promotion:'查看',icon: 'icon-user', title: '平台用户', width: 880, height: 650 },
        columns: [[
            {
                 field: 'logo', title: '',align:'center', halign:'center',width: 50, formatter: function (value, row, index) {
                     var header;
                     if (!$.isNullOrEmpty(value))
                         header= "<img src='" +value+ "' style='border:1px solid #ccc;border-radius: 50%;width:32px;height:32px;cursor:pointer'>";
                     else
                        header= "<img src='../images/member/default.png' style='border:1px solid #ccc;border-radius: 50%;width:32px;height:32px'/>";
                    return '<div class="corner_prompt">'+header+'</div>';
                 }
            },
            {
                field: 'name', title: '名称',halign:'center', width: 120, 
                formatter: function (value, row, index) {
                    if ($.isNullOrEmpty(value)) return '<span style="color:#db2828">未授权</span>';
                    return value;
                    //var link= "<a href='#' onclick=\"memberlist.editRecord('" + row.id + "')\">" + value + "</a>";
                    //return link;
                }
            },
            {field: 'city', title: '城市',halign:'center', width: 110},
            { field: 'balance', title: '红包余额',halign:'center',align:'right', width: 120,sortable: true,
                formatter: function (value, row, index) {
                    if (value<=0) return;
                    return $.formatMoney(value);
                }    
            },
            { field: 'totalred', title: '累计抢红包',halign:'center',align:'right', width: 120,sortable: true,
                formatter: function (value, row, index) {
                    if (value<=0) return;
                    return $.formatMoney(value);
                }    
            },
            { field: 'redprovider', title: '累计发红包',halign:'center',align:'right', width: 120,sortable: true,
                formatter: function (value, row, index) {
                    if (value<=0) return;
                    return $.formatMoney(value);
                }    
            },
            
            { field: 'createdate', title: '首次加入',align:'center', width: 150,sortable: true,
                    formatter: function (value, row, index) {
                    return $.formatDate(value,'yyyy年MM月dd日 hh:mm',true);
                }    
            },
            { field: 'logintimes', title: '登录次数',align:'center',width: 90,sortable: true}
        ]]
    });
}

///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    InitMemberGrid();
});

function reloadMember() {
    memberlist.reload();
}


