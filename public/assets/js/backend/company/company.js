define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'company/company/index',
                    add_url: 'company/company/add',
                    edit_url: 'company/company/edit',
                    del_url: 'company/company/del',
                    multi_url: 'company/company/multi',
                    detail_url: 'company/company/detail',
                    group_url: 'company/company/group',
                    anchor_url: 'company/company/anchor',
                    trace_url: 'company/company/trace',
                    table: 'company',
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
                        {field: 'anchornum', title: __('Anchornum')},
                        {field: 'cellphone', title: __('Cellphone'), visible: false},
                        {field: 'grade', title: __('Grade')},
                        {field: 'expired', title: __('Expired'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'manager', title: __('Manager')},
                        {field: 'introduce', title: __('Introduce'), visible: false},
                        {field: 'link', title: __('Link'), visible: false},
                        {field: 'status', title: __('Status'), formatter: Table.api.formatter.status,searchList: {wait: __('Wait'), normal: __('Normal'), stop: __('Stop')}},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate,
                            buttons: [{
                                name: 'detail',
                                text: __('详情'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'company/company/detail'
                            },
                            {
                                name: 'detail',
                                text: __('分组'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'company/company/group'
                            },
                            {
                                name: 'detail',
                                text: __('主播'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'company/company/anchor'
                            },
                            {
                                name: 'detail',
                                text: __('日志'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'company/company/trace'
                            }
                            ],
                            formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);

            //为表格设置默认列
            Table.columnDefaults.align('id','operate');
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