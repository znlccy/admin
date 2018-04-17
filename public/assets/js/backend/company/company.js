define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            //初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'company/company/index',
                    add_url: 'company/company/add',
                    edit_url: 'company/company/edit',
                    del_url: 'company/company/del',
                    multi_url: 'company/company/multi',
                    table: 'company',
                }
            });

            var table = $("table");

            //初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.default.extend.index_url,
                pk: 'c_id',
                sortName: 'company.c_id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'c_id', title: __('Id'), sortable: true},
                        {field: 'c_name', title: __('Companyname'), operate: 'LIKE'},
                        {field: 'c_anchor_num', title: __('Anchornum'), operate: 'LIKE'},
                        {field: 'c_account_grade', title: __('Grade'), operate: 'LIKE'},
                        {field: 'c_expired_time', title: __('Expired'), operate: 'LIKE'}
                        {field: 'c_business_manager', title: __('Manager'), operate: 'LIKE'},
                        {field: 'c_status', title: __('Status'), operate: 'LIKE'}
                    ]
                ]
            });

            //为表格绑定事件
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