/*
    var str = "参数{0}参数{1}参数{2}参数{3}参数{hehe}参数{{fuck}}参数{ooxx}";
    str.format("001", "002")
*/
String.prototype.format = function(args) {
    var _dic = typeof args === "object" ? args : arguments;
    return this.replace(/\{([^{}]+)\}/g, function(str, key) {
        // return key in _dic ? _dic[key] : str;
        return _dic.hasOwnProperty(key) ? _dic[key] : str;
    });
}
String.prototype.replaceAll = function(findStr,replaceTo) {
    var reg = new RegExp(findStr,"gi");
    return this.replace(reg,replaceTo);
}

///替换文本中的特殊字符
String.prototype.replaceSpecialChar= function(){
    return this.replace(/(\r\n)|(\n)|(\u2028)|(\u2029)/g,'');
}
