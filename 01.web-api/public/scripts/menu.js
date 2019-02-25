var APP_MENU = 
[{
    text: 'Forms',
    iconCls: 'fa fa-wpforms',
    state: 'open',
    children: [{
        text: 'Form Element'
    },{
        text: 'Wizard'
    },{
        text: 'File Upload'
    }]
},{
    text: 'Mail',
    iconCls: 'fa fa-at',
    selected: true,
    children: [{
        text: 'Inbox'
    },{
        text: 'Sent'
    },{
        text: 'Trash',
        children: [{
            text: 'Item1'
        },{
            text: 'Item2'
        }]
    }]
},{
    text: 'Layout',
    iconCls: 'fa fa-table',
    children: [{
        text: 'Panel'
    },{
        text: 'Accordion'
    },{
        text: 'Tabs'
    }]
}]