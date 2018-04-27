<?php

namespace app\admin\controller\anchor;

use app\common\controller\Backend;

/**
 * 
 *
 * @icon fa fa-anchor
 */
class Anchor extends Backend
{
    
    /**
     * Anchor模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Anchor');
        $this->view->assign("livestatusList", $this->model->getLivestatusList());
        $this->view->assign("signList", $this->model->getSignList());
        $this->view->assign("statusList", $this->model->getStatusList());
    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    

    /**
     * 查看
     */
    public function index()
    {
        //当前是否为关联查询
        $this->relationSearch = true;
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax())
        {
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                    ->with(['platform','company'])
                    ->where($where)
                    ->order($sort, $order)
                    ->count();

            $list = $this->model
                    ->with(['platform','company'])
                    ->where($where)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();

            foreach ($list as $row) {
                
                
            }
            $list = collection($list)->toArray();
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 基本信息界面
     */
    public function detail($ids) {
        $row = $this->model->get(['id' => $ids]);
        if (!$row)
            $this->error(__('No Results were found'));
        $this->view->assign("row", $row->toArray());
        return $this->view->fetch();
    }

    /**
     * 账号设置界面
     */
    public function account() {
        $this->redirect('anchor/anchor/account');
    }

    /**
     * 跟进记录界面
     */
    public function trace() {
        $this->redirect('admin/company/tracelog');
    }

    /**
     * 刷礼记录界面
     */
    public function brush() {
        $this->redirect('admin/anchor/brushlog');
    }
}
