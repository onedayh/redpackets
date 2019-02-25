var searchControl={
    user:
        {   
            key:'id',
            control:'<table class="form_table" style="padding-top: 10px;">'
                        +'<tr>'
                            +'<th>姓名:</th>'
                            +'<td>'
                            +'  <input class="easyui-textbox theme-textbox-radius" search-options="key:\'name\'" style="margin-left: 0px;" type="text" value="" /></td>'
                            +'  <th>登录账号:</th>'
                            +'  <td style="padding-right: 5px;">'
                            +'  <input class="easyui-textbox theme-textbox-radius" search-options="key:\'account\'" style="margin-left: 0px;" type="text" value="" /></td>'
                            +'</tr><tr>'
                            +'<th>状态:</th>'
                            +'<td>'
                            +'     <select id="ddlenabled"  search-options="key:\'status\'" class="select" style="width: 90px; height: 28px;">'
                            +'        <option value="" selected>全部</option>'
                            +'        <option value="0">正常</option>'
                            +'        <option value="1">禁用</option>'
                            +'    </select></td>'
                            +'</tr>'
                    +'</table>',
            columns:[[
                { field: 'ck', checkbox: true, width: 40 },
                { field: 'deptname', title: '所属部门', width: 120, sortable: true },
                { field: 'name', title: '姓名', width: 90, sortable: true},
                { field: 'email', title: '电子邮箱', width: 200 }
            ]]
        },
    department:
        {   
            key:'id',
            control:'<table class="form_table" style="padding-top: 10px;">'
                        +'<tr>'
                            +'<th>部门名称:</th>'
                            +'<td>'
                            +'  <input class="easyui-textbox theme-textbox-radius" search-options="key:\'name\'" style="margin-left: 0px;" type="text" value="" /></td>'
                            +'</tr>'
                    +'</table>',
            columns:[[
                { field: 'ck', checkbox: true, width: 40 },
                { field: 'name', title: '部门名称', width: 120, sortable: true },
                { field: 'code', title: '部门编码', width: 90, sortable: true}
            ]]
        },
     addrole:
        {   
            key:'id',
            control:'<table class="form_table" style="padding-top: 10px;">'
                        +'<tr>'
                            +'<th>角色名称:</th>'
                            +'<td>'
                            +'  <input class="easyui-textbox theme-textbox-radius" search-options="key:\'name\'" style="margin-left: 0px;" type="text" value="" /></td>'
                            +'</tr>'
                    +'</table>',
            columns:[[
                { field: 'ck', checkbox: true, width: 40 },
                { field: 'name', title: '角色名称', width: 180, sortable: true },
            ]]
        },
    addroleuser:
        {   
            key:'id',
            control:'<table class="form_table" style="padding-top: 10px;">'
                        +'<tr>'
                            +'<th>名称:</th>'
                            +'<td>'
                            +'  <input class="easyui-textbox theme-textbox-radius" search-options="key:\'name\'" style="margin-left: 0px;" type="text" value="" /></td>'
                            +'</tr>'
                    +'</table>',
            columns:[[
                { field: 'ck', checkbox: true, width: 40 },
                { field: 'account', title: '用户账号', width: 160, sortable: true },
                { field: 'name', title: '用户名称', width: 180, sortable: true }
            ]]
        },
     adduserandrole:
        {   
            key:'id',
            control:'<table class="form_table" style="padding-top: 10px;">'
                        +'<tr>'
                            +'<th>类型:</th>'
                            +'<td>'
                            +'     <select  search-options="key:\'type\'" class="easyui-combobox theme-textbox-radius" data-options="editable:false" style="width: 90px; height: 28px;">'
                            +'        <option value="" selected>全部</option>'
                            +'        <option value="0">用户</option>'
                            +'        <option value="1">角色</option>'
                            +'    </select></td>'
                            +'<th>名称:</th>'
                            +'<td>'
                            +'  <input class="easyui-textbox theme-textbox-radius" search-options="key:\'name\'" style="margin-left: 0px;" type="text" value="" /></td>'
                        +'</tr>'
                    +'</table>',
            columns:[[
                { field: 'ck', checkbox: true, width: 40 },
                { field: 'typename', title: '类型', width: 180, sortable: true },
                { field: 'name', title: '名称', width: 250, sortable: true }
            ]]
        }  ,
     district:
        {   
            key:'id',
            control:'<table class="form_table" style="padding-top: 10px;">'
                        +'<tr>'
                            +'<th>名称:</th>'
                            +'<td>'
                            +'  <input class="easyui-textbox theme-textbox-radius" search-options="key:\'name\'" style="margin-left: 0px;" type="text" value="" /></td>'
                            +'</tr>'
                    +'</table>',
            columns:[[
                { field: 'ck', checkbox: true, width: 40 },
                { field: 'name', title: '名称', width: 180, sortable: true },
            ]]
        },
    store:
        {   
            key:'id',
            control:'<table class="form_table" style="padding-top: 10px;">'
                        +'<tr>'
                            +'<th>名称:</th>'
                            +'<td>'
                            +'  <input class="easyui-textbox theme-textbox-radius" search-options="key:\'name\'" style="margin-left: 0px;" type="text" value="" /></td>'
                            +'</tr>'
                    +'</table>',
            columns:[[
                { field: 'ck', checkbox: true, width: 40 },
                { field: 'name', title: '名称', width: 180, sortable: true },
            ]]
        },
    promotiontemplate:
        {   
            key:'id',
            columns:[[
                { field: 'ck', checkbox: true, width: 40 },
                { field: 'title', title: '标题', width: 280,halign:'center',sortable: true }
            ]]
        } ,
    wechatpublic:
        {   
            key:'id',
            control:'<table class="form_table" style="padding-top: 10px;">'
                        +'<tr>'
                            +'<th>名称:</th>'
                            +'<td>'
                            +'  <input class="easyui-textbox theme-textbox-radius" search-options="key:\'name\'" style="margin-left: 0px;" type="text" value="" /></td>'
                            +'</tr>'
                    +'</table>',
            columns:[[
                { field: 'ck', checkbox: true, width: 40 },
                { field: 'name', title: '公众号名称', width: 360,halign:'center' }
            ]]
        },
    music:
        {   
            key:'id',
            columns:[[
                { field: 'ck', checkbox: true, width: 40 },
                { field: 'title', title: '音乐主题', width: 180,halign:'center' },
                { field: 'file', title: '试听', width: 360,halign:'center',
                formatter: function (value, row, index) {
                    return  `<audio src="${urlConfig.base.imageBase+value}" id="audio" controls="controls" type="audio/mpeg">
                                您的浏览器不支持 audio 标签。
                            </audio>`
                    }
                }
            ]]
        }         
}