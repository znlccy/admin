<?php

namespace app\admin\controller\company;

use app\common\controller\Backend;
use app\admin\model\Company as ConfigModel;
use think\Db;
use think\Request;
use think\Url;
use think\Session;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Company extends Backend
{
    
    /**
     * Company模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('Company');
    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */

    /**
     * 获取状态列表
     */
    public function getStatusList()
    {
        return ['wait' => __('Wait'), 'normal' => __('Normal'), 'stop' => __('Stop')];
    }

    /**
     * 查看详情
     */
    public function detail($ids)
    {
        /*$siteList = [];
        $groupList = ConfigModel::getGroupList();
        foreach ($groupList as $k => $v)
        {
            $siteList[$k]['name'] = $k;
            $siteList[$k]['title'] = $v;
            $siteList[$k]['list'] = [];
        }

        foreach ($this->model->all() as $k => $v)
        {
            if (!isset($siteList[$v['group']]))
            {
                continue;
            }
            $value = $v->toArray();
            $value['title'] = __($value['title']);
            if (in_array($value['type'], ['select', 'selects', 'checkbox', 'radio']))
            {
                $value['value'] = explode(',', $value['value']);
            }
            $value['content'] = json_decode($value['content'], TRUE);
            $siteList[$v['group']]['list'][] = $value;
        }
        $index = 0;
        foreach ($siteList as $k => &$v)
        {
            $v['active'] = !$index ? true : false;
            $index++;
        }
        $this->view->assign('siteList', $siteList);
        $this->view->assign('typeList', ConfigModel::getTypeList());
        $this->view->assign('groupList', ConfigModel::getGroupList());*/

        $manager = Db::query('select manager from tb_company');
        if ($manager == null) {
            $this->error('数据库里面还没有项目经理');
        }
        $this->view->assign('manager', $manager);

        $row = $this->model->get(['id' => $ids]);
        if (!$row)
            $this->error(__('No Results were found'));
        $this->view->assign("row", $row->toArray());
        return $this->view->fetch();
    }

    /**
     * 主播管理
     */
    public function anchor(){
        $this->redirect('admin/company/companyanchor');
    }

    /**
     * 分组管理
     */
    public function group() {
        $this->redirect('admin/company/companygroup');
    }

    /**
     * 跟进记录
     */
    public function trace() {
        $this->redirect('admin/company/tracelog');
    }

    /**
     * 保存基本信息
     */
    public function saveBasicInfo() {
        //获取请求的数据
        $data = Request::instance()->post();
        if ($data == null) {
            $this->error('请求数据为空');
        }
        $basicInfo = $data['row'];
        if ($basicInfo == null) {
            $this->error('输入基本信息为空');
        }
        $cellphone = $basicInfo['cellphone'];
        $introduce = $basicInfo['introduce'];
        $link = $basicInfo['link'];
        $manager = $basicInfo['manager'];
        $password = $basicInfo['password'];
        $grade = $basicInfo['grade'];
        $expired = $basicInfo['expired'];
        $status = $basicInfo['status'];

        $query = Db::table('tb_company')->where('cellphone', $cellphone)->select();
        if ($query == null) {
            $this->error('没有该项数据');
        } else{
            $result = Db::table('tb_company')->where('cellphone', $cellphone)->update(['introduce' => $introduce, 'link' => $link, 'manager' => $manager, 'password' => md5($password), 'grade' => $grade, 'expired' => $expired, 'status' => $status]);
            if ($result == 1) {
                $this->success('保存数据成功');
            } else {
                $this->error('保存数据失败');
            }
        }

        $url = 'javascript: window.close();';
        Url::build($url);
        echo "<script>window.close();</script>";
        var_dump($basicInfo);
    }

    /**
     * 获得商务经理
     */
    public function getManagerList() {
        $manager = Db::query('select manager from tb_company');
        if ($manager == null) {
            $this->error('数据库里面还没有项目经理');
        }
        $this->view->assign('manager', $manager);
        return $this->view->fetch('company/company/detail');
    }

    /**
     * 获取登录用户名
     */
    public function getUsername() {
        $loginUser = Session::get('admin');
        printf($loginUser['username']);
    }

    /**
     * 公司审核
     */
    public function review() {

        return $this->view->fetch();
    }

    /**
     * 批量审核
     */
    public function multiReview() {

    }

    /**
     * 批量拒绝
     */
    public function multiRefuse() {

    }

}
