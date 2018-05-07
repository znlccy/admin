define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'anchor/brushlog/index',
                    add_url: 'anchor/brushlog/add',
                    edit_url: 'anchor/brushlog/edit',
                    del_url: 'anchor/brushlog/del',
                    multi_url: 'anchor/brushlog/multi',
                    table: 'brush_log',
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
                        {field: 'aid', title: __('Aid'), visible: false},
                        {field: 'createtime', title: __('Createtime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'account', title: __('Account')},
                        {field: 'money', title: __('Money'), operate:'BETWEEN'},
                        {field: 'picture', title: __('Picture'), operate: false, formatter: Table.api.formatter.image},
                        {field: 'anchor.id', title: __('Anchor.id'),visible: false},
                        {field: 'anchor.pid', title: __('Anchor.pid'), visible: false},
                        {field: 'anchor.cid', title: __('Anchor.cid'), visible: false},
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