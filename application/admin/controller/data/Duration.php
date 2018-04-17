<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/17
 * Time: 13:38
 * Comment: 时长控制器
 */
namespace app\admin\controller\data;

use app\common\controller\Backend;

class Duration extends Backend {

    /**
     * 声明模型
     */
    protected $model = null;

    /**
     * 初始化
     */
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model("Duration");
    }

    /**
     * 导入
     */
    protected function import()
    {

    }


}