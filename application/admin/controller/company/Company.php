<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/17
 * Time: 11:39
 */
namespace app\admin\controller\company;

use app\common\controller\Backend;

class Company extends Backend {

    /**
     * 模型
     */
    protected $model = null;

    /**
     * 初始化
     */
    public function __initialize() {
        parent::__initialize();
        $this->model = model('Company');
    }

    /**
     * 导入
     */
    public function import() {

    }

}