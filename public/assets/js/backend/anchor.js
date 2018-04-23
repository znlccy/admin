define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'anchor/index',
                    add_url: 'anchor/add',
                    edit_url: 'anchor/edit',
                    del_url: 'anchor/del',
                    multi_url: 'anchor/multi',
                    detail_url: 'anchor/detail',
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
                        {field: 'pid', title: __('Pid')},
                        {field: 'aid', title: __('Aid')},
                        {field: 'roomid', title: __('Roomid')},
                        {field: 'liveurl', title: __('Liveurl'), formatter: Table.api.formatter.url},
                        {field: 'livestatus', title: __('Livestatus'), visible:false, searchList: {"normal":__('normal'),"stop":__('stop')}},
                        {field: 'livestatus_text', title: __('Livestatus'), operate:false},
                        {field: 'sign', title: __('Sign'), visible:false, searchList: {"signed":__('signed'),"nosign":__('nosign')}},
                        {field: 'sign_text', title: __('Sign'), operate:false},
                        {field: 'account', title: __('Account')},
                        {field: 'status', title: __('Status'), visible:false, searchList: {"normal":__('normal'),"stop":__('stop')}},
                        {field: 'status_text', title: __('Status'), operate:false},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate,
                            buttons: [{
                                name: 'detail',
                                text: __('Detail'),
                                icon: 'fa fa-list',
                                classname: 'btn btn-info btn-xs btn-detail btn-dialog',
                                url: 'anchor/detail'
                            }],
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