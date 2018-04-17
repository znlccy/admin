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
     * 声明使用的表名
     */
    protected $name = "tb_company";

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

    /**
     * 查看页面
     */
    public function index() {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax())
        {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('keyField'))
            {
                return $this->selectpage();
            }
            list($where, $sort, $order, $offset, $limit) = $this->buildparams();
            $total = $this->model
                ->with('group')
                ->where($where)
                ->order($sort, $order)
                ->count();

            $list = $this->model
                ->with('group')
                ->where($where)
                ->order($sort, $order)
                ->limit($offset, $limit)
                ->select();

            foreach ($list as $k => $v)
            {
                $v->password = '';
                $v->salt = '';
            }
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }

    /**
     * 获取公司详情
     */
    public function detail() {
        return $this->view->fetch();
    }
}