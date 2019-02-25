function combobox(table, option) {
    var _this = this;
    var controlItem = table;
    var _userToken = ApiCaller.getUser().token;
    
    if (option.loadMsg == null) option.loadMsg = '数据加载中...';
    if (option.method==null) option.method="GET";
    if (option.editable==null) option.editable = false;
    if (option.panelHeight==null)  option.panelHeight = 'auto';
    ///自动添加编辑列
    
    if (option.url){
        if (!$.startWith(option.url,'http://') && !$.startWith(option.url,'https://')){
            option.url =urlConfig.base.ApiRoot+($.startWith(option.url,'/')?'':'/')+ option.url
        }
    }
    
    ///数据加载之前,设置调用的Token
    if (option.data==null){
        if (option.onBeforeLoad==null){
            option.onBeforeLoad = function(param){
                param["access_token"]=_userToken;
            }
        }
    }
    _this.listOption = option;
    var init = function () {
        $('#' + controlItem).combobox(_this.listOption);
    };
    this.loadData = function (param) {
        //param["access_token"]=_userToken;
        $('#' + controlItem).combobox('load', param);
    }
    
    this.getValues = function (type) {
        if (type==null) type = 'array';
        if (type=='array')
            return $('#' + controlItem).combobox('getValues');
       var retValues= $('#' + controlItem).combobox('getValues');
       if (retValues.length>0) return retValues.join(',');
       return '';

    };
    this.getTexts = function (type) {
        if (type==null) type = 'array';
        if (type=='array')
            return $('#' + controlItem).combobox('getTexts');
       var retValues= $('#' + controlItem).combobox('getTexts');
       if (retValues.length>0) return retValues.join(',');
       return '';

    };
    this.setValues = function (value) {
        if (value==null) return;
       if (value instanceof Array) 
             $('#' + controlItem).combobox('setValues',value);
       else
            $('#' + controlItem).combobox('setValues',value.split(','));
    };
    this.getValue = function () {
       return $('#' + controlItem).combobox('getValue');
    };
    this.getText = function () {
       return $('#' + controlItem).combobox('getText');
    };
    this.setValue = function (value) {
        if (value==null) return;
        $('#' + controlItem).combobox('setValue',value.split(','));
    };
    
    ///初始化
    init();
}