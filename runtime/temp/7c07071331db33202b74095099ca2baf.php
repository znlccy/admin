<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:103:"D:\PHP-Environment\Apache2.4.29\htdocs\admin\public/../application/admin\view\company\company\edit.html";i:1524046642;s:87:"D:\PHP-Environment\Apache2.4.29\htdocs\admin\application\admin\view\layout\default.html";i:1523111344;s:84:"D:\PHP-Environment\Apache2.4.29\htdocs\admin\application\admin\view\common\meta.html";i:1523111344;s:86:"D:\PHP-Environment\Apache2.4.29\htdocs\admin\application\admin\view\common\script.html";i:1523111344;}*/ ?>
<!DOCTYPE html>
<html lang="<?php echo $config['language']; ?>">
    <head>
        <meta charset="utf-8">
<title><?php echo (isset($title) && ($title !== '')?$title:''); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit">

<link rel="shortcut icon" href="/admin/public/assets/img/favicon.ico" />
<!-- Loading Bootstrap -->
<link href="/admin/public/assets/css/backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
  <script src="/admin/public/assets/js/html5shiv.js"></script>
  <script src="/admin/public/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var require = {
        config:  <?php echo json_encode($config); ?>
    };
</script>
    </head>

    <body class="inside-header inside-aside <?php echo defined('IS_DIALOG') && IS_DIALOG ? 'is-dialog' : ''; ?>">
        <div id="main" role="main">
            <div class="tab-content tab-addtabs">
                <div id="content">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <section class="content-header hide">
                                <h1>
                                    <?php echo __('Dashboard'); ?>
                                    <small><?php echo __('Control panel'); ?></small>
                                </h1>
                            </section>
                            <?php if(!IS_DIALOG): ?>
                            <!-- RIBBON -->
                            <div id="ribbon">
                                <ol class="breadcrumb pull-left">
                                    <li><a href="dashboard" class="addtabsit"><i class="fa fa-dashboard"></i> <?php echo __('Dashboard'); ?></a></li>
                                </ol>
                                <ol class="breadcrumb pull-right">
                                    <?php foreach($breadcrumb as $vo): ?>
                                    <li><a href="javascript:;" data-url="<?php echo $vo['url']; ?>"><?php echo $vo['title']; ?></a></li>
                                    <?php endforeach; ?>
                                </ol>
                            </div>
                            <!-- END RIBBON -->
                            <?php endif; ?>
                            <div class="content">
                                <style type="text/css">
    @media (max-width: 375px) {
        .edit-form tr td input{width:100%;}
        .edit-form tr th:first-child,.edit-form tr td:first-child{
            width:20%;
        }
        .edit-form tr th:last-child,.edit-form tr td:last-child{
            display: none;
        }
    }
</style>
<div class="panel panel-default panel-intro">
    <div class="panel-heading">
        <?php echo build_heading(null, false); ?>
        <ul class="nav nav-tabs">
            <li class="active"><a href="">基础信息</a></li>
            <li><a href="">分组管理</a></li>
            <li><a href="">主播管理</a></li>
            <li><a href="">跟进记录</a></li>
        </ul>
    </div>

    <div class="panel-body">
        <div id="myTabContent" class="tab-content">
            <form id="edit-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">

                <div class="col-xs-12 col-sm-6">
                    <div class="form-group">
                        <label for="c-cellphone" class="control-label col-xs-12 col-sm-2"><?php echo __('Cellphone'); ?>:</label>
                        <div class="col-xs-12 col-sm-8">
                            <input id="c-cellphone" disabled="disabled" class="form-control" name="row[cellphone]" type="text" value="<?php echo $row['cellphone']; ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="c-name" class="control-label col-xs-12 col-sm-2"><?php echo __('Name'); ?>:</label>
                        <div class="col-xs-12 col-sm-8">
                            <input id="c-name" disabled="disabled" class="form-control" name="row[name]" type="text" value="<?php echo $row['name']; ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="c-anchornum" class="control-label col-xs-12 col-sm-2"><?php echo __('Anchornum'); ?>:</label>
                        <div class="col-xs-12 col-sm-8">
                            <input id="c-anchornum" class="form-control" name="row[anchornum]" type="number" value="<?php echo $row['anchornum']; ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="c-grade" class="control-label col-xs-12 col-sm-2"><?php echo __('Grade'); ?>:</label>
                        <div class="col-xs-12 col-sm-8">
                            <input id="c-grade" class="form-control" name="row[grade]" type="number" value="<?php echo $row['grade']; ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="c-expired" class="control-label col-xs-12 col-sm-2"><?php echo __('Expired'); ?>:</label>
                        <div class="col-xs-12 col-sm-8">
                            <input id="c-expired" class="form-control datetimepicker" data-date-format="YYYY-MM-DD HH:mm:ss" data-use-current="true" name="row[expired]" type="text" value="<?php echo $row['expired']; ?>">
                        </div>
                    </div>

                </div>

                <div class="col-xs-12 col-sm-6">
                    <div class="form-group">
                        <label for="c-manager" class="control-label col-xs-12 col-sm-2"><?php echo __('Manager'); ?>:</label>
                        <div class="col-xs-12 col-sm-8">
                            <input id="c-manager" class="form-control" name="row[manager]" type="text" value="<?php echo $row['manager']; ?>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="c-status" class="control-label col-xs-12 col-sm-2"><?php echo __('Status'); ?>:</label>
                        <div class="col-xs-12 col-sm-8">
                            <input id="c-status" class="form-control" name="row[status]" type="text" value="<?php echo $row['status']; ?>">
                        </div>
                    </div>
                </div>
                
                <div class="form-group layer-footer">
                    <label class="control-label col-xs-12 col-sm-2"></label>
                    <div class="col-xs-12 col-sm-8">
                        <button type="submit" class="btn btn-success btn-embossed disabled"><?php echo __('OK'); ?></button>
                        <button type="reset" class="btn btn-default btn-embossed"><?php echo __('Reset'); ?></button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>




                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/admin/public/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/admin/public/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo $site['version']; ?>"></script>
    </body>
</html>