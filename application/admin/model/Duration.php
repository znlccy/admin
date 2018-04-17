<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/17
 * Time: 10:59
 * Comment: 时长数据
 */
namespace app\admin\model;

use think\Model;

class Duration extends Model {

    /**
     * 自动开启写入时间戳字段
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