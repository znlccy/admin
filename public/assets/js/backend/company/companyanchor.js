define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'company/companyanchor/index',
                    add_url: 'company/companyanchor/add',
                    edit_url: 'company/companyanchor/edit',
                    del_url: 'company/companyanchor/del',
                    multi_url: 'company/companyanchor/multi',
                    table: 'company_anchor',
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
                        {field: 'cid', title: __('Cid'), visible: false},
                        {field: 'aid', title: __('Aid'), visible: false},
                        {field: 'pid', title: __('Pid'), visible: false},
                        {field: 'anchor.nickname', title: __('主播昵称')},
                        {field: 'platform.name', title: __('Platform.name')},
                        {field: 'roomid', title: __('Roomid'), visible: false},
                        {field: 'anchor.roomid', title: __('Anchor.roomid')},
                        {field: 'roomurl', title: __('Roomurl'), formatter: Table.api.formatter.url, visible: false},
                        {field: 'anchor.liveurl', title: __('Anchor.liveurl'), formatter: Table.api.formatter.url},
                        {field: 'status', title: __('Status'), visible:false, searchList: {"default":__('default'),"normal":__('normal'),"stop":__('stop')}},
                        {field: 'status_text', title: __('Status'), operate:false},
                        {field: 'gid', title: __('Gid')},
                        {field: 'anchor.id', title: __('Anchor.id'), visible: false},
                        {field: 'anchor.pid', title: __('Anchor.pid'), visible: false},
                        {field: 'anchor.aid', title: __('Anchor.aid'), visible: false},
                        {field: 'anchor.nickname', title: __('Anchor.nickname'), visible: false},
                        {field: 'anchor.mobile', title: __('Anchor.mobile'), visible: false},
                        {field: 'anchor.password', title: __('Anchor.password'), visible: false},
                        {field: 'anchor.category', title: __('Anchor.category'), visible: false},
                        {field: 'anchor.link', title: __('Anchor.link'), visible: false},
                        {field: 'anchor.avatar', title: __('Anchor.avatar'), visible: false},
                        {field: 'anchor.roomid', title: __('Anchor.roomid'), visible: false},
                        {field: 'anchor.liveurl', title: __('Anchor.liveurl'), formatter: Table.api.formatter.url, visible: false},
                        {field: 'anchor.livestatus', title: __('Anchor.livestatus'), visible: false},
                        {field: 'anchor.sign', title: __('Anchor.sign'), visible: false},
                        {field: 'anchor.account', title: __('Anchor.account'), visible: false},
                        {field: 'anchor.status', title: __('Anchor.status'), visible: false},
                        {field: 'anchor.remark', title: __('Anchor.remark'), visible: false},
                        {field: 'anchor.group', title: __('Anchor.group'), visible: false},
                        {field: 'platform.id', title: __('Platform.id'), visible: false},
                        {field: 'platform.name', title: __('Platform.name'), visible: false},
                        {field: 'platform.status', title: __('Platform.status'), visible: false},
                        {field: 'company.id', title: __('Company.id'),visible: false},
                        {field: 'company.name', title: __('Company.name'), visible: false},
                        {field: 'company.anchornum', title: __('Company.anchornum'),visible: false},
                        {field: 'company.grade', title: __('Company.grade'),visible: false},
                        {field: 'company.expired', title: __('Company.expired'), operate:'RANGE', addclass:'datetimerange', visible: false},
                        {field: 'company.status', title: __('Company.status'), visible: false},
                        {field: 'company.manager', title: __('Company.manager'), visible: false},
                        {field: 'company.cellphone', title: __('Company.cellphone'), visible: false},
                        {field: 'company.introduce', title: __('Company.introduce'), visible: false},
                        {field: 'company.link', title: __('Company.link'),visible: false},
                        {field: 'company.password', title: __('Company.password'), visible: false},
                        {field: 'company.group', title: __('Company.group'), visible: false},
                        {field: 'companygroup.id', title: __('Companygroup.id'), visible: false},
                        {field: 'companygroup.cid', title: __('Companygroup.cid'), visible: false},
                        {field: 'companygroup.name', title: __('Companygroup.name'), visible: false},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
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