define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'company/account/index',
                    add_url: 'company/account/add',
                    edit_url: 'company/account/edit',
                    del_url: 'company/account/del',
                    multi_url: 'company/account/multi',
                    table: 'account',
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
                        {field: 'account', title: __('Account')},
                        /*{field: 'company.id', title: __('Company.id')},*/
                        {field: 'company.name', title: __('所属公司')},
                        /*{field: 'cid', title: __('Cid')},*/
                        {field: 'role', title: __('Role')},
                        {field: 'lastactivetime', title: __('Lastactivetime'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status,searchList: {wait: __('Wait'), normal: __('Normal'), stop: __('Stop')}},
                        /*{field: 'company.id', title: __('Company.id')},*/
                        /*{field: 'company.name', title: __('Company.name')},*/
                        /*{field: 'company.anchornum', title: __('Company.anchornum')},
                        {field: 'company.grade', title: __('Company.grade')},
                        {field: 'company.expired', title: __('Company.expired'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'company.manager', title: __('Company.manager')},
                        {field: 'company.status', title: __('Company.status'), formatter: Table.api.formatter.status},*/
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