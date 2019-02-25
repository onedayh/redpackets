var itemList;
var selectedProductType = 2;  ///当前所选择的产品类型
var singleSelect = true;
var catalogTree;
var cardColumn = [[
    { field: 'ck', checkbox: true, width: 40 },
    {
        field: 'cover', title: '', align:'center',width: 60, 
        formatter: function (value, row, index) {
        return "<img src='" +urlConfig.base.imageBase+value+ "' onclick='formHelper.directViewImage(this,650,600)' style='width:48px;cursor:pointer'>";
        }
    },
    {field: 'title', title: '购物卡主题', halign:'center',width: 220, 
        formatter: function (value, row, index) {
        return  "<div style='white-space:normal;word-wrap:break-word;line-height:22px'>"+
                 value + 
                "</div>";
    }},
    {field: 'cost', title: '卡片面值',align:'right', halign:'center',width: 100, sortable: true, 
        formatter: function (value, row, index) {
            if (row.free==1) return '<span style="padding:3px 6px;border-radius:6px;border:1px solid #aaa;color:#aaa">免费</span>';
            return '<span style="color:#ff8400">'+value+'</span>';
    }}
]];
var activityColumn = [[
    { field: 'ck', checkbox: true, width: 40 },
    {
        field: 'cover', title: '', align:'center',width: 60, 
        formatter: function (value, row, index) {
        return "<img src='" +urlConfig.base.imageBase+value+ "' onclick='formHelper.directViewImage(this,650,600)' style='width:48px;cursor:pointer'>";
        }
    },
    {field: 'title', title: '活动主题', halign:'center',width: 200, 
        formatter: function (value, row, index) {
        return  "<div style='white-space:normal;word-wrap:break-word;line-height:22px'>"+value +"</div>";
    }},
    {field: 'time', title: '地点/时间',halign:'center',width: 290,
    formatter: function (value, row, index) {
        return  "<div style='white-space:normal;word-wrap:break-word;line-height:22px'>【"+row.location+'】'+row.address
                +"<div style='margin-top:10px'><span class='order'>"+
                value+"</div>"
                +"</div>";
    }},
    {field: 'cost', title: '报名费用',align:'right', halign:'center',width: 90, sortable: true, 
        formatter: function (value, row, index) {
            if ($.isNullOrEmpty(value)) return '<span style="padding:3px 6px;border-radius:6px;border:1px solid #aaa;color:#aaa">免费</span>';
            return '<span style="color:#ff8400">'+value+'</span>';
    }}
]];
var productColumn = [[
    { field: 'ck', checkbox: true, width: 40 },
    {
        field: 'cover', title: '', align:'center',width: 60, 
        formatter: function (value, row, index) {
        return "<img src='" +urlConfig.base.imageBase+value+ "' onclick='formHelper.directViewImage(this,650,600)' style='width:48px;cursor:pointer'>";
        }
    },
    {field: 'title', title: '商品名称', halign:'center',width: 200, 
        formatter: function (value, row, index) {
        return  "<div style='white-space:normal;word-wrap:break-word;line-height:22px'>"+value +"</div>";
    }},
    {field: 'cost', title: '价格',align:'right', halign:'center',width: 120, sortable: true},
    {field: 'promotion', title: '促销',align:'center', halign:'center',width: 180,sortable:true,
            formatter: function (value, row, index) {
            if (row.indiscount==1) return '限时折扣<br/>'+row.discount/10  +' 折'
            if (row.promotion>1) {
                var style = value+''+row.inpromotion;
                var statusText = row.inpromotion==-1?"未开始":(row.inpromotion==-2?"结束":"中");
                var retText =  '<a href="#" onclick="showPromotion(\''+row.promotionid+'\','+value+');">'+
                    '<span class="promotiontag'+style+'">'+ constEnum.promotionIconEnum[value]+'&nbsp;&nbsp;'+ constEnum.promotionEnum[value]+statusText+'</span></a>'
                retText+='<br/><br/>'+(row.plow!=row.pmax?($.formatMoney(row.plow)+' ~ '+$.formatMoney(row.pmax)):$.formatMoney(row.plow));
                return retText;
            }
            
    }},
    // {field: 'promotion', title: '促销',align:'center', halign:'center',width: 180,sortable:true,
    //     formatter: function (value, row, index) {
    //         if (row.indiscount==1) return '限时折扣';
    //         if (row.inpromotion==1) return '<span class="promotiontag'+value+'">'+ constEnum.promotionEnum[value]+'</span>'
    // }},
    // {field: 'inpromotion', title: '促销方式',align:'center', halign:'center',width: 80,sortable:true,
    //     formatter: function (value, row, index) {
    //         if (row.promotion==1) return;
    //         if (value==1) return '<span class="inpromotion">进行中</span>';
    //             if (row.distancestart>0) return '<span class="notstart">即将开始</span>'
    //             return '<span class="finished">已结束</span>';
    // }}
]];
var articleColumn = [[
    { field: 'ck', checkbox: true, width: 40 },
    {
        field: 'cover', title: '封面', align:'center',width: 85, 
        formatter: function (value, row, index) {
        return "<img src='" +urlConfig.base.imageBase+value+ "' onclick='formHelper.directViewImage(this,650,600)' style='width:80px;height:60px;cursor:pointer'>";
        }
    },
    {field: 'title', title: '标题', halign:'center',width: 220, 
        formatter: function (value, row, index) {
        return  "<div style='white-space:normal;word-wrap:break-word;line-height:22px'>"+
                 value + 
                "</div>";
    }},
    {field: 'cost', title: '价格',align:'right', halign:'center',width: 60, sortable: true, 
        formatter: function (value, row, index) {
            if (row.free==1) return '<span style="padding:3px 6px;border-radius:6px;border:1px solid #aaa;color:#aaa">免费</span>';
            return '<span style="color:#ff8400">'+value+'</span>';
    }}
    
]];
const typedColumn = {
                3:{
                    catalog:false,
                    column:cardColumn
                },2:{
                    catalog:true,
                    column:productColumn}};

function showPromotion(id,type){
    var prefix = constEnum.promotionEnum[type];
    var option = { url: '/promotion/promotion?type='+type,promotion:prefix+'规则',  title: prefix+'设置', width: 650, height: 500 }

    itemList.editRecord(id,option);
}

///获取页面的设置
function getSetting(){
    ///是否允许多选
    var selectOption = $.getUrlParam("multiSelect");
    if (!$.isNullOrEmpty(selectOption) && selectOption.toLowerCase()=="true") singleSelect = false;
    ///过滤条件
    clientFilter = $.getUrlParam("clientFilter");
     if (!$.isNullOrEmpty(clientFilter)) 
         clientFilter='?clientFilter='+clientFilter;
     else
         clientFilter='';
     var showPdType = $.getUrlParam("type");
     var productTypeCount = 2;
     if (!$.isNullOrEmpty(showPdType)){
        [2,3].forEach(function(e){
            if (showPdType.indexOf(e)<0){
                productTypeCount--;
                $('#type-'+e).hide();
            }
        })
     }
     if (productTypeCount==1) $('#productType').hide();
    return true;
};
///初始化列表控件
function InitProductGrid(type) {
    if (itemList!=null){
        $('#dg').datagrid('clearChecked');
    }
    itemList = new listForm('dg',{
        url: urlConfig.apiUrl.product.allproduct.format(type),
        idField: 'id',
        toolbar: '#toolbar',
        singleSelect:singleSelect,
        params:{salestatus:1},
        searchOption: { searchButton: '#btnSearch', resetButton: '#btnReset' },
        columns: typedColumn[type].column
    });
}

function initCatalog(type){
    if(typedColumn[type].catalog===true){
        $("#side").show();
        catalogTree = new treeForm('ulCatalogTree', {
            url: urlConfig.apiUrl.productcatalog.typedcatalog.format(type),
            method:'GET',
            onLoadSuccess:function(data){
            var rootNode = $('#ulCatalogTree').tree('getRoot');
            $('#ulCatalogTree').tree('select',rootNode.target);
            },
            onSelectChanged: function (node) {
                itemList.loadData({catalog_id: node.id });
            }
        });
    }
    else{
        $("#side").hide();
    }
}
$(document).ready(function () {
    var randomkey = Math.random();
    getSetting();
    initCatalog(selectedProductType);
    InitProductGrid(selectedProductType);
});
function switchProduct(type){
    selectedProductType = type;
    initCatalog(selectedProductType);
    InitProductGrid(selectedProductType);
}

function ConfirmSelected() {
    var checkedItem = [];
    itemList.getChecked().forEach(function(row){
        checkedItem.push({type:selectedProductType,id:row.id,imageurl:row.cover,text:row.title,
                promotion:row.promotion,inpromotion:row.inpromotion });
     })
    if (checkedItem.length==0) return $.messager.alert("提示", "请至少选择一条记录!", "info");
    var retObject =singleSelect==true? checkedItem[0]:checkedItem;
    return dialogHelper.closeModal(retObject);
}
