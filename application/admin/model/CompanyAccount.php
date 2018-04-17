<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/17
 * Time: 13:03
 * Comment: 公司账号模型
 */
namespace app\admin\model;

use think\Model;

class CompanyAccount extends Model {

    /**
     * 开启自动写入时间
     */
    protected $autoWriteTimestamp = 'int';

    /**
     * 声明创建时间戳字段
     */
    protected $createTime = 'createtime';

    /**
     * 声明更新时间戳字段
     */
    protected $updateTime = 'updatetime';

}