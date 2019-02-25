var homeLayout={
    tabs:[
        ////第一个标签项
        {   title:'首页',    ///Tab 标题
            content:0,      ///Tab 内部内容为 0 ：自定义   1：iframe
            items:[         ///内部HTML布局的Item 数组
                ///第一项
                {   type:'silder',       //第一个类型为轮播广告
                    sliders:[            //轮播广告控件的内部轮播图片数组
                        {
                            image :'http://image.litecoder.com/1.png',      //图片1位置
                            href :'http://www.topteam.com/smallprogram/view/detail.html?id=323'  ///点击图片打开的链接
                        },
                        {
                            image :'http://image.litecoder.com/2.png',      //图片2位置
                            href :'http://www.topteam.com/smallprogram/view/detail.html?id=314424'  ///点击图片打开的链接
                        }
                    ]           
                },
                ///第二项
                {   type:'image',       //类型为一张分隔图片
                    image :'http://image.litecoder.com/单品.png',     //图片位置
                    click:1,                                 //点击图片的操作 0:无操作  1：切换tab   2：新窗口打开链接
                    params :'1'  ///点击后的响应方式，根据click属性来使用,本示范为切换到index=1的标签栏下
                },
                ///第三项
                {   type:'image',       //类型为一张分隔图片
                    image :'http://image.litecoder.com/混合.png',     //图片位置
                    click:1,                                 //点击图片的操作 0:无操作  1：切换tab   2：新窗口打开链接
                    params :'2'  ///点击后的响应方式，根据click属性来使用,本示范为切换到index=2的标签栏下
                },
                ///第四项
                {   type:'image',       //类型为一张分隔图片
                    image :'http://image.litecoder.com/花瓶.png',     //图片位置
                    click:0,                                 //点击图片的操作 0:无操作  1：切换tab   2：新窗口打开链接
                    params :''  ///点击后的响应方式，因为click=0，所以不用考虑此参数
                },
                ///第五项
                {   type:'product',       //显示产品
                    template:'2column',    //使用2column模板（前端定义的模板名称，1行两列）
                    ///绑定显示的产品数组,产品点击都是打开对应id的产品详情页面
                    products:[
                         ////第一个产品
                         {
                             id:'483748-aec1293-1338743-09839',
                             image:'http://image.litecoder.com/product/483748-aec1293-1338743-09839.png', ///产品图片
                             name:'石头花瓶',  ///产品名称
                             price:179        ///产品价格
                         },
                         ////第二个产品
                         {
                             id:'483748-aec1133f-1338743-09839',
                             image:'http://image.litecoder.com/product/83748-aec1133f-1338743-09839.png', ///产品图片
                             name:'气泡花瓶', ///产品名称
                             price:109      ///产品价格
                         },
                         ////第三个产品
                         {
                             id:'483748-aec1133f-abcdef-09839',
                             image:'http://image.litecoder.com/product/483748-aec1133f-abcdef-09839.png', ///产品图片
                             name:'水晶花瓶四色', ///产品名称
                             price:89      ///产品价格
                         },
                         ////第四个产品
                         {
                             id:'483748-aec1133f-abcdef-09839',
                             image:'http://image.litecoder.com/product/483748-aec1133f-abcdef-09839.png', ///产品图片
                             name:'July花瓶', ///产品名称
                             price:79      ///产品价格
                         }   
                    ]
                },
                ///第六项
                {   type:'image',       //类型为一张分隔图片
                    image :'http://image.litecoder.com/周边.png',     //图片位置
                    click:0,                                 //点击图片的操作 0:无操作  1：切换tab   2：新窗口打开链接
                    params :''  ///点击后的响应方式，因为click=0，所以不用考虑此参数
                },
                ///第七项
                {   type:'product',       //显示产品
                    template:'2column',    //使用2column模板（前端定义的模板名称，1行两列）
                    ///绑定显示的产品数组,产品点击都是打开对应id的产品详情页面
                    products:[
                         ////第一个产品
                         {
                             id:'483748-aec1293-1338743-09839',
                             image:'http://image.litecoder.com/product/483748-aec1293-1338743-09839.png', ///产品图片
                             name:'用花说笔记本',  ///产品名称
                             price:39        ///产品价格
                         },
                         ////第二个产品
                         {
                             id:'483748-aec1133f-1338743-09839',
                             image:'http://image.litecoder.com/product/83748-aec1133f-1338743-09839.png', ///产品图片
                             name:'独家液体保鲜液', ///产品名称
                             price:19.9      ///产品价格
                         },
                         ////定制花艺剪
                         {
                             id:'483748-aec1133f-abcdef-09839',
                             image:'http://image.litecoder.com/product/483748-aec1133f-abcdef-09839.png', ///产品图片
                             name:'定制花艺剪', ///产品名称
                             price:79      ///产品价格
                         },
                         ////第四个产品
                         {
                             id:'483748-aec1133f-abcdef-09839',
                             image:'http://image.litecoder.com/product/483748-aec1133f-abcdef-09839.png', ///产品图片
                             name:'定制工装手工围裙', ///产品名称
                             price:99      ///产品价格
                         }   
                    ]
                }
            ]
        },
        ////第二个标签项
        {   title:'单品花束',    ///Tab 标题
             content:0,      ///Tab 内部内容为 0 ：自定义   1：iframe
             items:[         ///内部HTML布局的Item 数组
                ///第一项
                {   type:'image',       //类型为一张分隔图片
                    image :'http://image.litecoder.com/top.png',     //图片位置
                    click:0,                                 //点击图片的操作 0:无操作  1：切换tab   2：新窗口打开链接
                    params :''  ///点击后的响应方式，
                },
                ///第二项
                {   type:'image',       //类型为一张分隔图片
                    image :'http://image.litecoder.com/简花.png',     //图片位置
                    click:0,                                 //点击图片的操作 0:无操作  1：切换tab   2：新窗口打开链接
                    params :''  ///点击后的响应方式，
                },
                ///第三项
                {   type:'product',       //显示产品
                    template:'2column',    //使用2column模板（前端定义的模板名称，1行两列）
                    ///绑定显示的产品数组,产品点击都是打开对应id的产品详情页面
                    products:[
                         ////第一个产品
                         {
                             id:'483748-aec1293-1338743-09839',
                             image:'http://image.litecoder.com/product/483748-aec1293-1338743-09839.png', ///产品图片
                             name:'简花.标准',  ///产品名称
                             describ:'普通花量,10~15枝鲜花',   ///产品简述
                             price:99        ///产品价格
                         },
                         ////第二个产品
                         {
                             id:'483748-aec1133f-1338743-09839',
                             image:'http://image.litecoder.com/product/83748-aec1133f-1338743-09839.png', ///产品图片
                             name:'简花.优选', ///产品名称
                             describ:'大花量,10~15枝鲜花',   ///产品简述
                             price:179      ///产品价格
                         }
                    ]
                },
                 ///第四项
                {   type:'image',       //类型为一张分隔图片
                    image :'http://image.litecoder.com/挚爱.png',     //图片位置
                    click:0,                                 //点击图片的操作 0:无操作  1：切换tab   2：新窗口打开链接
                    params :''  ///点击后的响应方式，
                },
                ///第五项
                {   type:'product',       //显示产品
                    template:'1column',    //使用1column模板（前端定义的模板名称，1行1列）
                    ///绑定显示的产品数组,产品点击都是打开对应id的产品详情页面
                    products:[
                         ////第一个产品
                         {
                             id:'483748-aec1293-1338743-09839',
                             image:'http://image.litecoder.com/product/483748-aec1293-1338743-09839.png', ///产品图片
                             name:'挚爱.进口',  ///产品名称
                             describ:'10枝进口玫瑰',   ///产品简述
                             price:399        ///产品价格
                         }
                    ]
             }]
        },
        ////第二个标签项
        {   title:'混合花束',    ///Tab 标题
             content:0,      ///Tab 内部内容为 0 ：自定义   1：iframe
             items:[         ///内部HTML布局的Item 数组
                ///第一项
                {   type:'image',       //类型为一张分隔图片
                    image :'http://image.litecoder.com/top1.png',     //图片位置
                    click:0,                                 //点击图片的操作 0:无操作  1：切换tab   2：新窗口打开链接
                    params :''  ///点击后的响应方式，
                },
                ///第二项
                {   type:'image',       //类型为一张分隔图片
                    image :'http://image.litecoder.com/混合.png',     //图片位置
                    click:0,                                 //点击图片的操作 0:无操作  1：切换tab   2：新窗口打开链接
                    params :''  ///点击后的响应方式，
                },
                ///第三项
                {   type:'product',       //显示产品
                    template:'2column',    //使用2column模板（前端定义的模板名称，1行两列）
                    ///绑定显示的产品数组,产品点击都是打开对应id的产品详情页面
                    products:[
                         ////第一个产品
                         {
                             id:'483748-aec1293-1338743-09839',
                             image:'http://image.litecoder.com/product/483748-aec1293-1338743-09839.png', ///产品图片
                             name:'混合.悦花',  ///产品名称
                             describ:'3种花材,8~12枝鲜花',   ///产品简述
                             price:99        ///产品价格
                         },
                         ////第二个产品
                         {
                             id:'483748-aec1133f-1338743-09839',
                             image:'http://image.litecoder.com/product/83748-aec1133f-1338743-09839.png', ///产品图片
                             name:'混合.繁花', ///产品名称
                             describ:'4~6种花材,8~12枝鲜花',   ///产品简述
                             price:169      ///产品价格
                         },
                         ////第二个产品
                         {
                             id:'483748-aec1133f-1338743-09839',
                             image:'http://image.litecoder.com/product/83748-aec1133f-1338743-09839.png', ///产品图片
                             name:'混合.迷藏', ///产品名称
                             describ:'6~8种花材,24枝鲜花',   ///产品简述
                             price:399      ///产品价格
                         }
                    ]
                },
                 ///第四项
                {   type:'image',       //类型为一张分隔图片
                    image :'http://image.litecoder.com/ALPHA.png',     //图片位置
                    click:0,                                 //点击图片的操作 0:无操作  1：切换tab   2：新窗口打开链接
                    params :''  ///点击后的响应方式，
                },
                ///第五项
                {   type:'product',       //显示产品
                    template:'1column',    //使用1column模板（前端定义的模板名称，1行1列）
                    ///绑定显示的产品数组,产品点击都是打开对应id的产品详情页面
                    products:[
                         ////第一个产品
                         {
                             id:'483748-aec1293-1338743-09839',
                             image:'http://image.litecoder.com/product/483748-aec1293-1338743-09839.png', ///产品图片
                             name:'ALPHA.艺术',  ///产品名称
                             describ:'独一无二，花艺师亲手制作',   ///产品简述
                             price:1699        ///产品价格
                         }
                    ]
             }]
        },
        ////第一个标签项
        {   title:'一人一茶',    ///Tab 标题
            content:1,          ///Tab 内部内容为 0 ：自定义   1：iframe
            url:'mytop.html'    ///使用mytop的页面套在这个里面
        }
        
    ] 
}