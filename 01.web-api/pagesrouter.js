exports=module.exports = {
    backoffice:{
        routeRoot:"/",
        viewRoot:"",
        layout:"layout/",
        defaultLayout:"/layout/layout-detail",
        title:"哆咪红包",
        routes:[
            /*login,index 页面 */
            {route:"login",view:"login",layout:"layout-basic.html",data:null},
            {route:"index",view:"index",layout:"layout-basic.html",data:null},
            {route:"home",view:"home",layout:"layout-basic.html",data:null},
            
            ///UI编辑器
            //{route:"layout",view:"xcxlayout/index",layout:"layout-basic.html",data:null},
            /*通用页面 */
            {route:"common/selector",view:"common/commonselector",layout:"layout-list.html"},
            {route:"common/treeselector",view:"common/hierarchyselector",layout:"layout-basic.html"},
            {route:"common/imageview",view:"common/imageviewer",layout:false},
            {route:"common/audio",view:"common/audiolisten",layout:false},
            {route:"common/userselector",view:"common/userselector",layout:"layout-list.html"},
            /*系统管理模块页面*/
            {
                /* 
                    根据整个目录下的文件自动映射 
                    folder:映射的目录（框架自动加载该目录下的所有html文件,并且以文件名（不带后缀）作为映射路由路径
                    layout:auto-math,根据html文件名的结尾的字符串，如list则使用layout-list ,detail 则使用layout-detail 
                    layout:none,不指定模板
                    route:根路由路劲，再加上文件名,不指定则=folder
                    exceptfile:整体路由中需要排除的文件
                    exceptfolder:整体路由中需要排除的子文件夹
                */
                grouproute:{folder:"admin",layout:"auto-match",route:"admin"}
            },
            /*UI配置模块*/
           // {grouproute:{folder:"message",layout:"auto-match"}},
            {grouproute:{folder:"crm",layout:"auto-match"}},
            {grouproute:{folder:"redbag",layout:"auto-match"}},
            {grouproute:{folder:"portal",layout:"auto-match"}}
        ]
    }
   
}