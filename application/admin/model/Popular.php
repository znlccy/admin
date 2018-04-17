<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/17
 * Time: 11:08
 * Comment: 名气数据实体类
 */

namespace app\admin\model;

use think\Model;

class Popular extends Model {

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
