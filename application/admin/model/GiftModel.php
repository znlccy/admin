<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/23
 * Time: 13:54
 * Comment: 礼物详情配置
 */
namespace app\admin\model;

use think\Model;

class GiftModel extends Model {

    protected $name = "gift_config";

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
    protected $updateTime = 'upudatetime';

    /**
     * 追加属性
     */
    protected $append = [
        ];


}