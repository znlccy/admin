<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/17
 * Time: 11:39
 */
namespace app\admin\controller;

use app\common\controller\Backend;

class Company extends Backend {

    protected $model = null;

    public function __initialize() {
        parent::__initialize();
        $this->model = model('Company');
    }

    public function import() {

    }

}