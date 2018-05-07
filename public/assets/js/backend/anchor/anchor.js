define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'anchor/anchor/index',
                    add_url: 'anchor/anchor/add',
                    edit_url: 'anchor/anchor/edit',
                    del_url: 'anchor/anchor/del',
                    multi_url: 'anchor/anchor/multi',
                    detail_url: 'anchor/anchor/detail',
                    account_url: 'anchor/anchor/account',
                    trace_url: 'anchor/anchor/trace',
                    brush_url: 'anchor/anchor/brush',
                    table: 'anchor',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('Id')},
                        {field: 'pid', title: __('Pid'), visible: false},
                        {field: 'platform.name', title: __('Platform.name')},
                        {field: 'cid', title: __('Cid'), visible: false},
                        {field: 'company.name', title: __('Company.name'),visible: false},
                        {field: 'nickname', title: __('主播名称')},
                        {field: 'mobile', title: __('Mobile'), visible: false},
                        {field: 'password', title: __('Password'), visible: false},
                        {field: 'category', title: __('Category'), visible: false},
                        {field: 'link', title: __('Link'), visible: false},
                        {field: 'avatar', title: __('Avatar'), visible: false},
                        {field: 'roomid', title: __('Roomid')},
                        {field: 'liveurl', title: __('Liveurl'), formatter: Table.api.formatter.url},
                        {field: 'livestatus', title: __('Livestatus'), visible:false, searchList: {"normal":__('normal'),"stop":__('stop')}},
                        {field: 'livestatus_text', title: __('Livestatus'), operate:false},
                        {field: 'sign', title: __('Sign'), visible:false, searchList: {"signed":__('signed'),"nosign":__('nosign')}},
                        {field: 'sign_text', title: __('Sign'), operate:false},
                        {field: 'account', title: __('Account')},
                        {field: 'status', title: __('Status'), visible:false, searchList: {"normal":__('normal'),"stop":__('stop')}, formatter: Table.api.formatter.status},
                        {field: 'status_text', title: __('Status'), operate:false},
                        {field: 'remark', title: __('Remark'), visible: false},
                        {field: 'group', title: __('Group'), visible: false},
                        {field: 'platform.id', title: __('Platform.id'), visible: false},
                        {field: 'platform.name', title: __('Platform.name'), visible: false},
                        {field: 'platform.status', title: __('Platform.status'), visible: false},
                        {field: 'company.id', title: __('Company.id'), visible: false},
                        {field: 'company.name', title: __('Company.name'), visible: false},
                        {field: 'company.anchornum', title: __('Company.anchornum'), visible: false},
                        {field: 'company.grade', title: __('Company.grade'), visible: false},
                        {field: 'company.expired', title: __('Company.expired'), operate:'RANGE', addclass:'datetimerange', visible: false},
                        {field: 'company.status', title: __('Company.status'), visible: false},
                        {field: 'company.manager', title: __('Company.manager'), visible: false},
                        {field: 'company.cellphone', title: __('Company.cellphone'), visible: false},
                        {field: 'company.introduce', title: __('Company.introduce'), visible: false},
                        {field: 'company.link', title: __('Company.link'), visible: false},
                        {field: 'company.password', title: __('Company.password'), visible: false},
                        {field: 'company.group', title: __('Company.group'), visible: false},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate,
                            buttons: [{
                                name: 'detail',
                                text: __('详情'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'anchor/anchor/detail'
                            },
                                {
                                    name: 'account',
                                    text: __('账号'),
                                    icon: 'fa fa-list',
                                    classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                    url: 'anchor/anchor/account'
                                },
                                {
                                    name: 'trace',
                                    text: __('日志'),
                                    icon: 'fa fa-list',
                                    classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                    url: 'anchor/anchor/trace'
                                },
                                {
                                    name: 'brush',
                                    text: __('刷礼'),
                                    icon: 'fa fa-list',
                                    classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                    url: 'anchor/anchor/brush?id={$row.id}'
                                }
                            ],
                            formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});