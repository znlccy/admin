<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/17
 * Time: 12:50
 * Comment: 公司账户控制器
 */
namespace app\admin\controller\company;

use app\common\controller\Backend;

class Account extends Backend {

    /**
     * 模型
     */
    protected $model = null;

    /**
     * 初始化
     */
    public function _initialize()
    {
        parent::_initialize();
        $this->model = model("CompanyAccount");
    }

    /**
     * 导入
     */
    protected function import()
    {
    }


}