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
                        {field: 'id', title: __('Id')},
                        {field: 'date', title: __('Date'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'hour', title: __('Hour')},
                        {field: 'platform.id', title: __('Platform.id')},
                        {field: 'user.id', title: __('User.id')},
                        /*{field: 'pid', title: __('Pid')},
                        {field: 'aid', title: __('Aid')},*/
                        {field: 'subscribe', title: __('Subscribe')},
                        {field: 'onlinenum', title: __('Onlinenum')},
                        /*{field: 'platform.name', title: __('Platform.name')},
                        {field: 'platform.status', title: __('Platform.status'), formatter: Table.api.formatter.status},*/
                        /*{field: 'user.group_id', title: __('User.group_id')},
                        {field: 'user.username', title: __('User.username')},
                        {field: 'user.nickname', title: __('User.nickname')},
                        {field: 'user.password', title: __('User.password')},
                        {field: 'user.salt', title: __('User.salt')},
                        {field: 'user.email', title: __('User.email')},
                        {field: 'user.mobile', title: __('User.mobile')},
                        {field: 'user.avatar', title: __('User.avatar')},
                        {field: 'user.level', title: __('User.level')},
                        {field: 'user.gender', title: __('User.gender')},
                        {field: 'user.birthday', title: __('User.birthday'), operate:'RANGE', addclass:'datetimerange'},
                        {field: 'user.bio', title: __('User.bio')},
                        {field: 'user.score', title: __('User.score')},
                        {field: 'user.successions', title: __('User.successions')},
                        {field: 'user.maxsuccessions', title: __('User.maxsuccessions')},
                        {field: 'user.prevtime', title: __('User.prevtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'user.logintime', title: __('User.logintime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'user.loginip', title: __('User.loginip')},
                        {field: 'user.loginfailure', title: __('User.loginfailure')},
                        {field: 'user.joinip', title: __('User.joinip')},
                        {field: 'user.jointime', title: __('User.jointime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'user.createtime', title: __('User.createtime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'user.updatetime', title: __('User.updatetime'), operate:'RANGE', addclass:'datetimerange', formatter: Table.api.formatter.datetime},
                        {field: 'user.token', title: __('User.token')},
                        {field: 'user.status', title: __('User.status'), formatter: Table.api.formatter.status},
                        {field: 'user.verification', title: __('User.verification')},*/
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