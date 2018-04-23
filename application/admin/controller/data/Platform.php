<?php

namespace app\admin\controller\data;

use app\admin\model\GiftModel;
use app\common\controller\Backend;
use app\admin\model\GiftModel as GiftConfig;
use think\Db;

/**
 * @icon fa fa-circle-o
 */
class Platform extends Backend
{
    
    /**
     * Platform模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Platform');

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

    /**
     * 获取礼物配置
     */
    public function config($ids) {
        $row = GiftModel::get($ids);
        if (!$row)
            $this->error(__('No Results were found'));
        $this->view->assign("row", $row->toArray());
        return $this->view->fetch();
    }

    /**
     * 创建礼物配置
     */
    public function create() {
        echo "创建礼物配置";
    }

    /**
     * 提示信息
     */
    public function info() {
        echo "打印信息";
    }
}
