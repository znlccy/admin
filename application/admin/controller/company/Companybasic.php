<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/26
 * Time: 16:49
 * Comment：公司基本信息
 */
namespace app\admin\controller\company;

use app\common\controller\Backend;
use think\Db;

class Companybasic extends Backend {

    /**
     * 查询基础信息
     */
    public function index()
    {
       $company = Db::table('tb_company')->query('select * from tb_company');
       /*if ($company == null) {
            $this->view->assign('row', null);
       }
       $row = array([
           'cellphone'  => $company->cellphone(),

       ]);
       $this->view->assign('row', $row);*/
       var_dump($company);
       /* return $this->view->fetch();*/
    }

}