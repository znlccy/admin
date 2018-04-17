<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/17
 * Time: 11:04
 * Comment: 礼物详情实体类
 */
namespace app\admin\model;

use think\Model;

class Detail extends Model {

    protected $name = "tb_gift_detail";

    /**
     * 开启自动写入时间
     */
    protected $autoWriteTimestamp = 'int';

    /**
     * 声明
     */
    protected $createTime = 'createtime';

    protected $updateTime = 'updatetime';

}