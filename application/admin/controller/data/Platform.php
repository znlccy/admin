<?php

namespace app\admin\controller\data;

use app\common\controller\Backend;
use app\admin\model\GiftModel;
use think\Db;
use think\Request as Request;

/**
 * @icon fa fa-circle-o
 */
class Platform extends Backend
{
    
    /**
     * Platform模型对象
     */
    protected $model = null;

    protected $giftConfig = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Platform');
        $giftConfig = model('GiftConfig');
        $this->view->assign("statusList",$giftConfig->getStatusList());
    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

    /**
     * 获取礼物配置
     */
    public function config() {
        /*$row = GiftModel::get();
        if (!$row)
            $this->error(__('No Results were found'));
        $this->view->assign("row", $row);
        return $this->view->fetch('admin@data/giftconfig/index');*/
        $pid = Request::instance()->get('id');
        $this->redirect('admin/data/giftconfig',['pid' => $pid]);
    }

}
