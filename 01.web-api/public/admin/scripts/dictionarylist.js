﻿var itemlist, dictList;
function InitDictGrid() {
    dictList = new listForm('dgDict', {
        //title: '应用系统列表',
        iconCls: 'icon-edit',
        url: urlConfig.apiUrl.dictionary.base,
        idField: 'id',
        doubleClickEdit: true,
        toolbar: '#tools_2',
        pagination: false,
        createOption: {
            button: '#btnNewDict', url: '/admin/dictdetail', icon: 'icon-list', title: '数据字典', width: 500, height: 250, closeFunc: function (result) {
                if (result) {
                    dictList.appendRow({ id: result.data.dict_id,code:result.data.dict_code, name: result.data.dict_name });
                    dictList.select(dictList.getRows().length - 1);
                }
            }
        },
        deleteOption: { button: '#btnDeleteDict', url:urlConfig.apiUrl.dictionary.base, successFunc: function (result) { dictList.removeRow(); dictList.selectFirstRow(); } },
        editOption: {
            button: '#btnEditDict',
            url: '/admin/dictdetail', icon: 'icon-list', title: '数据字典', width: 500, height: 250, closeFunc: function (result) {
                if (result) dictList.updateRow({ id: result.id,code: result.code , name: result.name });
            }
        },
        onSelect: function (rowIndex, rowData) {
            itemlist.loadData({ dict_id: rowData.id });
        },
        columns: [[
            { field: 'code', title: '代码', width: 80, sortable: true },
            { field: 'name', title: '字典项名称', width: 150, sortable: true }
        ]]
    });
}
///初始化列表控件
function InitItemGrid() {
    itemlist = new listForm('dg', {
        //title: '应用系统列表',
        iconCls: 'icon-edit',
        doubleClickEdit:true,
        url: urlConfig.apiUrl.dictionaryitem.base,
        idField: 'id',
        toolbar: '#tools_1',
        queryParams:{dict_id:'#####'},
        searchOption: { searchButton: '#btnSearch', resetButton: '#btnReset', beforeFunc: function (result) { result.dictUid = dictList.selectedKeyValue(); } },
        createOption: {
            button: '#btnNewItem', url: '/admin/dictitemdetail', title: '字典项信息', width: 550, height: 380,
            beforeFunc: function (option) {
                var parentValue = dictList.selectedKeyValue();
                if ($.isNullOrEmpty(parentValue)) {
                    $.messager.alert('提示', '请首先选择数据字典类型!', 'info');
                    return false;
                }
                option.url = option.url + '&dictUid=' + parentValue;
                return true;
            },
            closeFunc: function (result) {
                if (result)
                itemlist.appendRow({dictname:dictList.selectedRow('name'), id: result.data.rec_id,ext1:result.data.ext_field1, value: result.data.item_value, index: result.data.item_index, name: result.data.item_name });
            }
        },
        deleteOption: { button: '#btnDeleteItem', url:  urlConfig.apiUrl.dictionaryitem.base },
        editOption: {
            url: '/admin/dictitemdetail', title: '字典项信息', width: 550, height: 380, closeFunc: function (result) {
                if (result)
                    itemlist.updateRow({dictname:dictList.selectedRow('name'), id: result.data.rec_id,ext1:result.data.ext_field1,value: result.data.item_value, index: result.data.item_index, name: result.data.item_name });
            }},
        columns: [[
            { field: 'dictname', title: '所属字典项', width: 150},
            {
                field: 'name', title: '数据项名称', width: 150, sortable: true, formatter: function (value, row, index) {
                    return "<a href='#' onclick=\"itemlist.editRecord('" + row.id + "')\">" + value + "</a>";
                }
            },
            { field: 'value', title: '数据项值', width: 120, sortable: true },
            { field: 'ext1', title: '描述信息', width: 200 }
        ]]
    });
}
///页面加载完毕后初始化目录树和列表
///
$(document).ready(function () {
    InitDictGrid();
    InitItemGrid();
});
function reloadItems() {
    itemlist.reload();
}
function reloadIDictionarys() {
    dictlist.reload();
}

