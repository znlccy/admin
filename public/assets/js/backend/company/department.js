define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'company/department/index',
                    add_url: 'company/department/add',
                    edit_url: 'company/department/edit',
                    del_url: 'company/department/del',
                    multi_url: 'company/department/multi',
                    table: 'department',
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
                        {field: 'name', title: __('Name')},
                        {field: 'did', title: __('Did')},
                        {field: 'cid', title: __('Cid')},
                        {field: 'company.id', title: __('Company.id')},
                        {field: 'company.name', title: __('Company.name')},
                        {field: 'company.anchornum', title: __('Company.anchornum')},
                        {field: 'company.grade', title: __('Company.grade')},
                        {field: 'company.expired', title: __('Company.expired'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'company.status', title: __('Company.status')},
                        {field: 'company.manager', title: __('Company.manager')},
                        {field: 'company.cellphone', title: __('Company.cellphone')},
                        {field: 'company.introduce', title: __('Company.introduce')},
                        {field: 'company.link', title: __('Company.link')},
                        {field: 'company.password', title: __('Company.password')},
                        {field: 'company.group', title: __('Company.group')},
                        {field: 'company.legalperson', title: __('Company.legalperson')},
                        {field: 'company.registeredaddress', title: __('Company.registeredaddress')},
                        {field: 'company.businesslicense', title: __('Company.businesslicense')},
                        {field: 'division.id', title: __('Division.id')},
                        {field: 'division.name', title: __('Division.name')},
                        {field: 'division.cid', title: __('Division.cid')},
                        {field: 'division.address', title: __('Division.address')},
                        {field: 'division.manager', title: __('Division.manager')},
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