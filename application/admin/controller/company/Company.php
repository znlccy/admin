<?php

namespace app\admin\controller\company;

use app\common\controller\Backend;
use app\admin\model\Company as ConfigModel;

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

        $siteList = [];
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
        $this->view->assign('groupList', ConfigModel::getGroupList());

        /*基础信息*/
        $this->view->assign('basicInfo', ConfigModel::basicInfo());

        /*分组管理*/
        $this->view->assign('groupManager', ConfigModel::groupManager());

        /*主播管理*/
        $this->view->assign('anchorManager', ConfigModel::anchorManager());

        /*跟进记录*/
        $this->view->assign('traceRecord', ConfigModel::traceRecord());

        $row = $this->model->get(['id' => $ids]);
        if (!$row)
            $this->error(__('No Results were found'));
        $this->view->assign("row", $row->toArray());
        return $this->view->fetch();
    }

}
