function datalist(table, option) {
    var _this = this;
    var listGrid = table;
    var lastSearchParam = {};
    var _userToken = ApiCaller.getUser().token;
    
    if (option.loadMsg == null) option.loadMsg = '数据加载中...';
    if (option.method==null) option.method="GET";
    ///自动添加编辑列
    
    if (!$.startWith(option.url,'http://') && !$.startWith(option.url,'https://')){
        option.url =urlConfig.base.ApiRoot+($.startWith(option.url,'/')?'':'/')+ option.url
    }
    
    ///数据加载之前,设置调用的Token
    if (option.onBeforeLoad==null){
        option.onBeforeLoad = function(param){
            param["access_token"]=_userToken;
        }
    }
    _this.listOption = option;
    var init = function () {
        $('#' + listGrid).datalist(_this.listOption);
    };
    this.loadData = function (param) {
        // param["access_token"]=_userToken;
        $('#' + listGrid).datalist('load', param);
    }
    ///当前选择的行
    this.selectedRow = function (fieldName) {
        var rowData = $('#' + listGrid).datalist('getSelected');
        if (rowData == null) return null;
        if (fieldName == null) return rowData;
        return rowData[fieldName];
    };
    ///获取到当前页面的所有记录
    this.getRows = function () {
        return $('#' + listGrid).datalist('getRows');
    };
    ///当前选择的记录的主键值
    this.selectedKeyValue = function () {
        var row = _this.selectedRow();
        if (_this.listOption == null || _this.listOption.valueField==null) return null;
        return _this.selectedRow(_this.listOption.valueField);
    };
   
    ///获取当前选择的所有行
    this.getSelections = function (fieldName) {
        var rowDatas = $('#' + listGrid).datalist('getSelections');
        if (!fieldName || fieldName == '') return rowDatas;
        var arr = new Array();
        $(rowDatas).each(function (index, value) {
            arr[index] = value[fieldName];
        });
        return arr;
    }
    
    ///刷新列表数据
    this.reload = function (param) {
        $('#' + listGrid).datalist('reload', param);
        $('#' + listGrid).datalist('clearSelections').datalist('clearChecked');
    };
    ///删除一行
    this.removeRow = function (rowindex) {
        var index = rowindex == null ? $('#' + listGrid).datalist('getRowIndex', _this.selectedRow()) : rowindex;
        $('#' + listGrid).datalist('deleteRow', index);
    },
    ///添加一行
    this.appendRow = function (data) {
        $('#' + listGrid).datalist('appendRow', data);
    },
    this.updateRow = function (data, rowIndex) {
        var index = rowIndex ? rowIndex : $('#' + listGrid).datalist('getRowIndex', _this.selectedRow());
        $('#' + listGrid).datalist('updateRow', { index: index, row: data });
    }
    ///
    this.getRowIndex = function (KeyValue) {
        var itemIndex = $('#' + listGrid).datalist('getRowIndex', KeyValue);
        return itemIndex;
    }
    ///初始化
    init();
}