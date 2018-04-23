define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'data/popular/index',
                    add_url: 'data/popular/add',
                    edit_url: 'data/popular/edit',
                    del_url: 'data/popular/del',
                    multi_url: 'data/popular/multi',
                    table: 'popular',
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
                        {field: 'date', title: __('Date'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'hour', title: __('Hour')},
                        {field: 'pid', title: __('Pid')},
                        {field: 'aid', title: __('Aid')},
                        {field: 'subscribe', title: __('Subscribe')},
                        {field: 'onlinenum', title: __('Onlinenum')},
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