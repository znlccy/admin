define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'data/session/index',
                    add_url: 'data/session/add',
                    edit_url: 'data/session/edit',
                    del_url: 'data/session/del',
                    multi_url: 'data/session/multi',
                    table: 'session',
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
                        {field: 'id', title: __('Id'), visible: false},
                        {field: 'begintime', title: __('Begintime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'endtime', title: __('Endtime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'pid', title: __('Pid')},
                        {field: 'aid', title: __('Aid')},
                        {field: 'livetime', title: __('Livetime')},
                        {field: 'giftvalue', title: __('Giftvalue'), operate:'BETWEEN'},
                        {field: 'sendgift', title: __('Sendgift')},
                        {field: 'barrage', title: __('Barrage')},
                        {field: 'barragepeople', title: __('Barragepeople')},
                        {field: 'subscribe', title: __('Subscribe')},
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