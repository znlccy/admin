<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/17
 * Time: 10:28
 * Comment: 公司实体类
 */
namespace app\admin\model;

use think\Model;

class Company extends Model {

    /**
     * 声明使用的表名
     */
    protected $name = "company";

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

    /**
     * 初始化数据
     */
    public static function init()
    {
        self::beforeUpdate(function ($row) {
            $changed = $row->getChangedData();
        });
    }

    /**
     * 查看页面
     */
    public function index() {

    }

}