/*
    轻码框架入口类
    自动加载配置与routerConfig中的路由配置
*/
var path = require('path');
var fs = require('fs');
var authenticationUtility = require('./utilities/authenticationUtility');
var controllerconfig = require('../routerConfig.json');
var config = require('./configuration/frameworkConfig');
var utilities = require('./utilities/utilities');
const IGNORE_FOLDER = ["script","scripts","js","image","data","video","images","style","css","app_themes"];
class LiteCoderFramework {
    /*
        构造函数
        application ： 当前App实例
        authorizateProvider ： 认证提供者接口
    */
    //authorizateProvider)
    constructor(application) {
        this.app = application;
        ///启动SocketServer
        if (config.getSetting("startSocket",false)===true){
            this.app.socketServer = require('./component/litecoderwsserver');
            this.app.socketServer.createServer();
        }
        ///添加渲染页面的路由
        this.loadPagesRenderMapping(application);
        ///加载应用基础的路由
        this.loadBasicRouters(application);
        ///加载身份认证中配置文件中的所有组件
        ///参考 authenticationconfig.json
        var authenticationJson = path.join(__dirname, "../authenticationconfig.json");
        if (fs.existsSync(authenticationJson)){
            this.authoricateProviders = new authenticationUtility(require(authenticationJson)); 
        }
        ///初始化路由配置,请参考routeConfig.json
        if (controllerconfig) {
            this.loadController(controllerconfig,this.authoricateProviders);
        }
    }
    actionMessage(message){
        console.log(message);
    }
    /*
        加载框架应用所需要的一些配置路由
        配置在configuration.json中的starupRouter
    */
    loadBasicRouters(app){
        let routers = config.getSection('startupRouter');
        if (routers==null || routers.length<=0) return;
        routers.forEach(router=>{
            if (router.disabled===true || !router.file) return;
            var routeFilePath = path.join(__dirname,router.file);
            if (fs.existsSync(routeFilePath)){
                var routerHandler = require(routeFilePath);
                var routerPath = router.path || '/';
                app.use(routerPath,routerHandler); 
            }
        })
    }
   /*
        加载控制器
        @controllerconfig ： 控制器配置节
        providerCollection ： 认证提供者接口
    */
    loadFolderController(path){  
        var pa = fs.readdirSync(path);  
        pa.forEach(function(ele,index){  
            var info = fs.statSync(path+"/"+ele)      
            if(info.isDirectory()){  
                console.log("dir: "+ele)  
                loadFolderController(path+"/"+ele);  
            }else{  
                console.log("file: "+ele)  
            }     
        })  
    }
    /*
        加载控制器
        @controllerconfig ： 控制器配置节
        providerCollection ： 认证提供者接口
    */
    loadController(controllerconfig,providerCollection){
        controllerconfig.forEach(element => {
            //if (!element.routers || element.routers.length == 0) return;
            if (element.disabled) return;
            ///包含文件
            if (element.include){
                var includeRouteJson= path.join(__dirname, element.include);
                ///如果包含文件存在，则加载这个文件里面的路由
                if (fs.existsSync(includeRouteJson)) {
                    var routes = require(includeRouteJson);
                    this.loadController(routes,providerCollection);
                }
            }
            else{
                var modules = [];
                var baseUrl = ''; 
                var needAuthorize = false;
                var authorizeProviderName = '';
                ////路由整个目录
                if (element.routefolder){
                    needAuthorize = element.routefolder.authorize;
                    authorizeProviderName = element.routefolder.authorizeName;
                    if(needAuthorize==null) needAuthorize = true;
                    baseUrl = element.routefolder.baseUrl || '/';
                    ///设置整个目录的身份验证过滤器
                    if (needAuthorize===true) this.setAuthorizationProvider(baseUrl,providerCollection,authorizeProviderName);
                    if(element.routefolder.folder)
                        this.loadFolderFiles4Router(modules,element.routefolder);

                }
                else{
                    needAuthorize = element.authorize;
                    authorizeProviderName = element.authorizeName;
                    if(needAuthorize==null) needAuthorize = true;
                    baseUrl = element.baseUrl || '/';
                    ///设置单个控制器文件的身份验证过滤器
                    if (needAuthorize===true) this.setAuthorizationProvider(baseUrl,providerCollection,authorizeProviderName);
                    if (fs.existsSync(path.join(__dirname, element.controller)))
                        modules.push(path.join(__dirname, element.controller));
                }
                    
                ////单个文件的加载
                if (modules.length>0)
                {
                    //var modulePath = path.join(__dirname, element.controller);
                   
                    modules.forEach(modulePath=>{
                        console.log('loading controller file : [%s] for baseUrl : [%s]',modulePath,baseUrl);
                        var controllModule = require(modulePath);
                        var controller = new controllModule(this.app);
                        this.app.use(baseUrl,controller.router);
                    })
                       
                }
            }
        });
    }

    setAuthorizationProvider(url,providerCollection,authorizeName){
        let authoricationProvider = null;
        ////该控制器下的所有路由需要身份验证
        if (providerCollection) {
            var provider =authorizeName? 
                          providerCollection.getProvider(authorizeName):
                          providerCollection.getDefaultProvider();                       
            if (provider!=null) authoricationProvider =provider.module.checkAuthorization; //this.app.use(element.baseUrl, provider.module.checkAuthorization);
        }
        if (authoricationProvider!=null){
            // var routeBaseUrl = controller.baseUrl;
            // if (utilities.isNullOrEmpty(routeBaseUrl)){
            //     routeBaseUrl =path.basename(modulePath);
            //     routeBaseUrl =routeBaseUrl.substr(routeBaseUrl,routeBaseUrl.length-"controller.js".length);
            // }  
            // let url = path.join(baseUrl,routeBaseUrl)+'/';
            // console.log('controller\'s authoricationProvider used for  [%s]',routeBaseUrl);
            // controller.router.use(url,authoricationProvider);
            this.app.use(url,authoricationProvider);
        }
    }
    /*
    * 加载整个目录下的所有html 文件到映射路由中
    */
    loadFolderFiles4Router(result,routeGroup){
        let exceptFile      = routeGroup.exceptfile;
        let exceptfolder    = routeGroup.exceptfolder;
        let scanFolder      = path.join(__dirname, routeGroup.folder);
        this.getFolderControllerFiles(result,scanFolder,exceptFile,exceptfolder);
        // if (files.length>0){
        //     files.forEach(file=>{
        //         let layoutFile = this.getPageLayout(routeGroup.layout,file,appLayoutRoot);
        //         console.log('init page router[%s] with page file [%s] and used layout [%s]',path.join(folderRoute,file),path.join(folderView,file),layoutFile);
                
        //         app.get(path.join(folderRoute,file),
        //                     function(req,res){
        //                         res.render(path.join(folderView,file),{layout:layoutFile,pagetitle:"abc"});
        //                     }
        //             );
        //     })
        // }
    }
    /*
    * 遍历加载整个文件夹下面的所有文件形成路由
    */
    getFolderControllerFiles(result,startPath,execfiles,execfolder) {
        let files=fs.readdirSync(startPath);
        files.forEach((val,index) => {
            let fPath       =   path.join(startPath,val);
            let stats       =   fs.statSync(fPath);
            //let fileName    =   fPath.substr(baseFolder.length+1); 
            if(stats.isDirectory()) {
                if (execfolder==null || execfolder.indexOf(fileName)<0) 
                    this.findFolderFiles(result,fPath,fPath,execfiles,execfolder);
            }
            if(stats.isFile()) {
                let fileExtion  =   path.extname(fPath).toLowerCase();
                if (fileExtion!==".js") return;
                let fileName    =   path.basename(fPath);
                fileName = fileName.substr(0,fileName.length-fileExtion.length);
                if (execfiles==null || execfiles.indexOf(fileName)<0) result.push(fPath);
            }
        });
    }
    /*
    * 加载页面渲染的路由
    */
    loadPagesRenderMapping(app){
        // view engine setup
        //app.set('views', path.join(__dirname, 'views'));
        var appViewMapping = config.getSetting('viewMapping',null);
        ///存在应用的页面需要映射,则启动view engin
        if (appViewMapping && appViewMapping.length>0){
            var ejs = require('ejs');
            var expressLayouts = require('express-ejs-layouts');
            var viewRootFolder = path.join(__dirname, '../public');
            app.set('views',viewRootFolder);
            app.engine('html', ejs.__express);
            app.set('view engine', 'html');
            app.use(expressLayouts);
            var mappingsetting = require('../pagesrouter');
            
            ///逐个应用的页面路由加载
            appViewMapping.forEach(appName=>{
                let appPagesRoute = mappingsetting[appName];
                if (!appPagesRoute || !appPagesRoute.routes || appPagesRoute.routes.length<=0) return;
                var appBaseRoute    = appPagesRoute.routeRoot || '/';
                var appViewRoot     = appPagesRoute.viewRoot || '';
                var appLayoutRoot   = appPagesRoute.layout || '';
                let appTitle        = appPagesRoute.title || '轻码后台管理';
                /////根路配置中的路由重定向
                // if ( appPagesRoute.rootRedirect &&  appPagesRoute.rootRedirect.length>0){
                //     appPagesRoute.rootRedirect.forEach(
                //         element=>{
                //             app.get(element.route, function (req, res) {  
                //                 res.redirect(302, element.redirect);  
                //             }); 
                //         }
                //     );
                // }
                appPagesRoute.routes.forEach(route=>{
                    ///加载目录所有路由
                    if (route.grouproute){
                        //grouproute:{folder:"admin",layout:"auto-match",route:"admin"}
                        if (route.grouproute.folder)  {
                            this.loadFolderRoutes(app,route.grouproute,appBaseRoute,appViewRoot,appLayoutRoot,appTitle);
                        }
                    }
                    ///逐个页面映射路由加载
                    else{
                        if (route.route){
                            let pageLocation =path.join(appViewRoot,(route.view || route.route));
                            let layoutFile = this.getPageLayout(route.layout,pageLocation,appLayoutRoot);
                            let pageData = {layout:layoutFile,pagetitle:appTitle};
                            let rootPath = path.join(appBaseRoute,route.route).replace(/\\/g,'/');
                            app.get(rootPath,
                                function(req,res){
                                    res.render(pageLocation,pageData);
                                }
                            );
                        }
                        //{route:"login",view:"login",layout:"",data:null},
                    }
                })
            })
        }
    }
    /*
    * 加载整个目录下的所有html 文件到映射路由中
    */
    loadFolderRoutes(app,routeGroup,appBaseRoute,appViewRoot,appLayoutRoot){
        let exceptFile      = routeGroup.exceptfile;
        let exceptfolder    = routeGroup.exceptfolder;
        let routeFolder     = path.join(__dirname, '../public',appViewRoot,routeGroup.folder);
        let files           = []
        let folderRoute     = path.join(appBaseRoute,routeGroup.route || routeGroup.folder);
        let folderView      = path.join(appViewRoot, routeGroup.folder);
        this.findFolderFiles(files,routeFolder,routeFolder,exceptFile,exceptfolder);
        if (files.length>0){
            files.forEach(file=>{
                let layoutFile = this.getPageLayout(routeGroup.layout,file,appLayoutRoot);
                console.log('init page router[%s] with page file [%s] and used layout [%s]',path.join(folderRoute,file),path.join(folderView,file),layoutFile);
                let rootPath = path.join(folderRoute,file).replace(/\\/g,'/');
                app.get(rootPath,
                            function(req,res){
                                res.render(path.join(folderView,file),{layout:layoutFile,pagetitle:"abc"});
                            }
                    );
            })
        }
    }

    /*
    * 遍历加载整个文件夹下面的所有文件形成路由
    */
    findFolderFiles(result,baseFolder,startPath,execfiles,execfolder) {
        let files=fs.readdirSync(startPath);
        files.forEach((val,index) => {
            let fPath       =   path.join(startPath,val);
            let stats       =   fs.statSync(fPath);
            let fileName    =   fPath.substr(baseFolder.length+1); 
            if(stats.isDirectory()) {
                ///排除基本的忽略目录
                if (IGNORE_FOLDER.indexOf(fileName.toLowerCase())>=0) return ;
                if (execfolder==null || execfolder.indexOf(fileName)<0) 
                    this.findFolderFiles(result,baseFolder,fPath,execfiles,execfolder);
            }
            if(stats.isFile()) {
                let fileExtion  =   path.extname(fPath).toLowerCase();
                if (fileExtion!=".html") return;
                let fileName    =   fPath.substr(baseFolder.length+1); 
                fileName = fileName.substr(0,fileName.length-fileExtion.length);
                if (execfiles==null || execfiles.indexOf(fileName)<0) result.push(fileName);
            }
        });
    }
    /*
        根据layout的设置，获取需要使用的模板
    */
    getPageLayout(layout,pagefilename,layoutRoot){
        if (layout=="" || layout===false) return false;
        ///根据文件名来匹配模板
        if (!layout || layout === "auto-match"){
            if (utilities.endsWith(pagefilename.toLowerCase(),"list")) return path.join(layoutRoot,"layout-list.html");
            if (utilities.endsWith(pagefilename.toLowerCase(),"detail")) return path.join(layoutRoot,"layout-detail.html");
            if (utilities.endsWith(pagefilename.toLowerCase(),"blank")) return path.join(layoutRoot,"layout-blank.html");
            if (utilities.endsWith(pagefilename.toLowerCase(),"tree")) return path.join(layoutRoot,"layout-tree.html");
            return path.join(layoutRoot,"layout-detail.html");
        }
        return path.join(layoutRoot,layout);
    }
}
exports = module.exports = LiteCoderFramework;