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

    protected $autoWriteTimestamp = 'int';

    protected $createTime = 'createtime';

    protected $updateTime = 'updatetime';

}