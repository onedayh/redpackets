var listForm;
const RED_STATUS = {"0":"<span style='color:#777'>待支付</span><br/><br/>"+
                      '<a href="#" onclick="activeRedbag({0})" class="easyui-linkbutton c5 button-red fa-4x" style="width:110px;height:30px;margin-right: 20px"><i class="fa fa-cny"></i>&nbsp;&nbsp;支付激活</a>',
                    "1":"<span style='color:#db2828'>已激活</span>",
                    "2":"<span style='color:#805031'>暂停</span>",
                    "3":"<span style='color:#cf590c'>已结束</span>",
                    "100":"<span style='color:#cf590c'>用户已撤回</span>"}
///初始化列表控件
function InitGrid() {
    listForm = new listForm('dg',{
        url: urlConfig.apiUrl.redbags.base,
        idField: 'id',
        doubleClickEdit: false,
        toolbar: '#tools_1',
        searchOption: { searchButton: '#btnSearch', resetButton: '#btnReset' },
        createOption: { button: '#create', url: '/redbag/redbag', title: '新建红包', width: 800, height: 650, callbackFunc: { reload: function () { listForm.reload(); }} },
        editOption: { url: '/redbag/redbag', icon: 'icon-role', title: '编辑红包', width: 800, height: 650 },
        //editColumn:true,
        //deleteColumn:true,
        //deleteOption: { url:urlConfig.apiUrl.redbags.clear,iconfont:'fa-trash-o',promotion:'清理',deleteFunc:clearRedbag },
        onLoadSuccess:function(data){
            $('.c5').linkbutton({});
        },
        columns: [[
            {
                field: 'bgimage', title: '', align:'center',width: 65, 
                formatter: function (value, row, index) {
                    if (!$.isNullOrEmpty(value))
                       return "<img src='" +urlConfig.base.imageBase+value+ "' onclick='formHelper.directViewImage(this,480,640)' style='width:60px;height:80;cursor:pointer;border:dotted 1px #888'>";
                    return "<img src='../images/default_product.jpeg' style='width:64px;'>";
                }
            },
            {
                field: 'topic', title: '红包主题',halign:'center', width:170, formatter: function (value, row, index) {
                    return "<div style='white-space:normal;word-wrap:break-word;line-height:22px'>"+
                            (row.clear==0?
                            "("+row.id+")<a href='#' onclick=\"listForm.editRecord('" + row.id + "')\"><b>" + value + "</b></a><br/>":
                            "("+row.id+")<span style='color:#666'>" + value + "(已清理)</span><br/>")+
                            "<span style='color:#888'>"+row.bless+"</span>"+
                            "</div>"
                }
            },
            {
                field: 'createdate', title: '创建时间',halign:'center', width:150, 
                formatter: function (value, row, index) {
                    return $.formatDate(value,'yyyy年MM月dd日 hh:mm',true);
                }
            },
            {
                field: 'amount', title: '红包信息', halign:'center',width: 170, sortable: true, 
                formatter: function (value, row, index) {
                    return '<table class="redtable">'+
                            '     <tr>'+
                            '         <td>创建人 : </td>'+
                            '         <td><img src="' +row.userlogo+ '" class="userlogo"><span class="username">'+row.username+'</span></td>'+
                            '      </tr>'+
                            '     <tr>'+
                            '         <td>总金额 : </td>'+
                            '         <td>'+$.formatMoney(value)+'</td>'+
                            '      </tr>'+
                            '      <tr>'+
                            '         <td>红包数量 : </td>'+
                            '         <td>'+row.total+'</td>'+
                            '      </tr>'+
                            '      <tr>'+
                            '         <td>获取方式 : </td>'+
                            '         <td>'+(row.type==0?'直接拆':'裂变拼')+'</td>'+
                            '      </tr>'+
                            '      <tr>'+
                            '         <td>分配方式 : </td>'+
                            '         <td>'+(row.alloc==0?'拼手气':'普通红包')+'</td>'+
                            '     </tr>'+
                            
                            (!$.isNullOrEmpty(row.appname)?
                            ('      <tr>'+
                            '         <td>导流公众号 : </td>'+
                            '         <td><span style="color:#db2828">'+row.appname+'</span></td>'+
                            '     </tr>'):'')+
                            '</table>';
                    
                }
            },
            {field: 'status', title: '红包状态', align:'center',width:140, 
                formatter: function (value, row, index) {
                    if (value==0 || value==100) return RED_STATUS[value].format(row.id);
                    return RED_STATUS[value] + "<br/><br/>"+
                    "<img src='"+urlConfig.base.imageBase + row.qrcode+"' onclick='formHelper.directViewImage(this,480,500)' style='width:64px;'>";
                }
            },
            {
                field: 'gotamount', title: '发放数据', halign:'center',width: 160, 
                formatter: function (value, row, index) {
                    if (row.status==0) return;
                    return '<table class="redtable">'+
                            '      <tr>'+
                            '         <td>已领个数 : </td>'+
                            '         <td><a href="#" onclick="openGotList('+row.id+')">'+row.gottotal+'</a></td>'+
                            '      </tr>'+
                            '     <tr>'+
                            '         <td>已发金额 : </td>'+
                            '         <td><a href="#" onclick="openGotList('+row.id+')">'+$.formatMoney(value)+'</a></td>'+
                            '      </tr>'+
                            '</table>';
                    
                }
            },
            {
                field: 'rollback', title: '撤回状态', halign:'center',width: 110, 
                formatter: function (value, row, index) {
                    if(row.status==0) return ;  ///未支付的，无需撤回按钮
                    if (value==1) return '已撤回';
                      ///红包已经都发完了，不用撤回,清理
                    if(row.gottotal == row.total) 
                        return '<a href="#" onclick="rollbackRedbag('+row.id+',false)" class="easyui-linkbutton c5 button-green fa-4x" style="width:90px;height:30px;margin-right: 20px"><i class="fa fa-eraser"></i>&nbsp;&nbsp;清理</a>';
                        
                    return '<a href="#" onclick="rollbackRedbag('+row.id+',true)" class="easyui-linkbutton c5 button-red fa-4x" style="width:90px;height:30px;margin-right: 20px"><i class="fa fa-mail-reply"></i>&nbsp;&nbsp;撤回</a>';
                }
            }
        ]]
    });
}
///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    ///初始化表格
    InitGrid();
});

function reload(){
    listForm.reload();
}
function activeRedbag(id){
    $.messager.confirm('确认','确认激活该红包活动?',function(r){
        if (r){
            dialogHelper.showModal({url:'/redbag/redbagpay?key='+id+'&actionType=edit',
                        width:650,height:600,title:'激活支付',closeFunc:function(result){
                            if (result && result.payed==1){
                                listForm.reload();
                            }
                        } });
        }
    })
}

function openGotList(id){
    dialogHelper.showModal({url:'/redbag/gotlist?id='+id,
                            width:600,title:'红包领取' });
}

function rollbackRedbag(id,rollback){
    var msg = rollback==true?'确认要撤回红包吗?撤回后所剩金额自动转入红包主余额,红包不再生效':'确认要清理红包数据？清理后,红包不再生效';
    $.messager.confirm('确认',msg,function(r){
        if (r){
            ApiCaller.Post({url:urlConfig.apiUrl.redbags.rollback.format(id),
                successFunc:function(result){
                    $.messager.alert('成功','操作成功');
                    listForm.reload();
            }})
        }
    })
}