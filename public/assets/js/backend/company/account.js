define(['juery', 'bootstrap', 'backend', 'table', 'form'],function ($, undifined, Backend, Table, Form) {

    /*定义控制器*/
    var Controller = {
        index: function () {
            //初始化表格参数
            Table.api.init({
               extend: {
                   index_url: 'company/account/index',
                   add_url: 'company/account/add',
                   edit_url: 'company/account/edit',
                   del_url: 'company/account/del',
                   multi_url: 'company/account/multi',
               }
            });

            //声明表
            var table = $("$table");

            //初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                columns: [
                    [
                        {field: 'id', title: 'ID'},
                        {field: 'accountname', title: __('Account')},
                        {field: 'belong', title: __('Belong')},
                        {field: 'role', title: __('Role')},
                        {field: 'lasttime', title: __('LastTime')},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status}
                    ]
                ]
            });

            //为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Form.api.bindevent($("form[role=form]"));
        },
        edit: function () {
            Form.api.bindevent($("form[role=form]"));
        }
    };
    return Controller;
});