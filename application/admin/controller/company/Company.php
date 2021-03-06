<?php

namespace app\admin\controller\company;

use app\common\controller\Backend;
use app\admin\model\Company as ConfigModel;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use think\Db;
use think\Request as Request;
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

        $manager = Db::query('select username as manager from tb_admin');
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
        $cid = Request::instance()->get('id');
        $this->redirect('admin/company/companyanchor', ['cid' => $cid]);
    }

    /**
     * 分组管理
     */
    public function group() {
        $cid = Request::instance()->get('id');
        $this->redirect('admin/company/companygroup', ['cid' => $cid]);
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
        $grade = $_POST['grade'];
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

        /*$url = 'javascript: window.close();';
        Url::build($url);
        echo "<script>window.close();</script>";
        var_dump($basicInfo);*/
    }

    /**
     * 获得商务经理
     */
    /*public function getManagerList() {
        $manager = Db::query('select username from tb_admin');
        if ($manager == null) {
            $this->error('数据库里面还没有项目经理');
        }
        $this->view->assign('manager', $manager);
        return $this->view->fetch('company/company/detail');
    }*/

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
        $review = Db::query("select id,name,legalperson,registeredaddress,businesslicense  from tb_company where status <> 'normal'");
        $this->view->assign('company', $review);
        return $this->view->fetch();
    }

    /**
     * 批量审核
     */
    public function multiReview() {
        /*$getId = $_REQUEST['id'];
        var_dump($getId);*/
    }

    /**
     * 批量拒绝
     */
    public function multiRefuse($arrayId) {
        echo '批量拒绝';
    }

    /**
     * 上传页面
     */
    public function upload() {
        /*echo $_POST['id'];*/
        return $this->view->fetch();
    }

    /**
     * 上传凭证
     */
    public function uploadLicense() {
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('image');

        $requestId = Request::instance()->get('id');
        if ($requestId == null) {
            $this->error('传递id为空');
        }
        else {
            // 移动到框架应用根目录/public/uploads/ 目录下
            if ($file) {
                $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
                if ($info) {
                    // 成功上传后 获取上传信息
                    // 输出 jpg
                    //转换\为/
                    /*$id = $_POST['id'];*/
                    $keepPath = str_replace("\\", "/", $info->getSaveName());
                    $result = Db::table('tb_company')->where('id', $requestId)->update(['businesslicense' => '/uploads/' . $keepPath]);
                    if ($result == 1) {
                        return $this->success('上传成功');
                    } else {
                        return $this->error('上传失败');
                    }
                    /*echo $info->getExtension();
                    // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
                    echo $info->getSaveName();
                    // 输出 42a79759f284b767dfcb2a0197904287.jpg
                    echo $info->getFilename();*/
                } else {
                    // 上传失败获取错误信息
                    /*echo $file->getError();*/
                    return $this->error('上传失败');
                }
            }
        }
    }

    /**
     * 实现单个审核
     */
    public function singleReview() {
        /*var_dump($_POST['id']);*/
        $requestId = Request::instance()->get('id');
        echo $requestId;
        if ($requestId == null) {
            return $this->error('请求参数为空');
        } else {
            $result = Db::table('tb_company')->where('id', $requestId)->update(['status' => 'normal']);
            if ($result == 1) {
                return $this->success('审核通过');
            } else {
                return $this->error('审核失败');
            }
        }
    }

    /**
     * 实现单个拒绝
     */
    public function singleRefuse() {
        $requestId = Request::instance()->get('id');
        if ($requestId == null) {
            return $this->error('请求参数为空');
        } else {
            $result = Db::table('tb_company')->where('id', $requestId)->update(['status' => 'stop']);
            if ($result == 1) {
                return $this->success('拒绝成功');
            } else {
                return $this->error('拒绝失败');
            }
        }
    }

    public function index() {

        $loginUser = Session::get('admin');
        $username = $loginUser['username'];
        $where = 'manager='.$username;

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
            if ($username == 'admin') {
                $total = $this->model
                    ->where($where)
                    ->order($sort, $order)
                    ->count();

                $list = $this->model
                    ->where($where)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();
            } else {
                $total = $this->model
                    ->where('manager', $username)
                    ->order($sort, $order)
                    ->count();

                $list = $this->model
                    ->where('manager', $username)
                    ->order($sort, $order)
                    ->limit($offset, $limit)
                    ->select();
            }
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
     * 添加部门
     */
    public function addPartment() {
        $partment = new \app\admin\model\Partment();
        $data = $partment::get(1);
        var_dump($data);
    }

    /**
     * 删除部门
     */
    public function deletePartment() {

    }

    /**
     * 修改部门
     */
    public function updateParment() {

    }

    /**
     * 获取所有部门
     */
    public function getPartmentAll() {

    }

    /**
     * 获取一个部门
     */
    public function getPartment() {

    }
}
