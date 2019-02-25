var path = require('path');
var fs = require('fs');
class authenticationUtility{
    constructor(config) {
        ///需要数据访问实体的实例
        this.providerConfig = config;
        this._provider = [];
        this.initialize();
    }
    getProvider(name) {
       if (this._provider.length<=0) return null;
       for(var iLoop=0;iLoop<this._provider.length;iLoop++){
           var provider = this._provider[iLoop];
           if (provider.name==name) return provider;
       }
       return null;
    }
    ///获取默认的中间身份路由
    getDefaultProvider() {
        if (this._provider.length<=0) return null;
        for(var iLoop=0;iLoop<this._provider.length;iLoop++){
            var provider = this._provider[iLoop];
            if (provider.default==true) return provider;
        }
        return null;
     }
    ///加载路由的相关中间件
    initialize(){
        this.providerConfig.forEach(element => {
            if (!element.provider) return;
            var providerPath= path.join(__dirname, element.provider);
            ///如果包含文件存在，则加载这个文件里面的路由
            if (fs.existsSync(providerPath)) {
                this._provider.push({
                    name:element.name,
                    module:require(providerPath),
                    default:element.default==true
                })
            }
        });
    }
}
exports=module.exports = authenticationUtility;