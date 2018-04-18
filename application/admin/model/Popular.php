<?php

namespace app\admin\model;

use think\Model;

class Popular extends Model
{
    // 表名
    protected $name = 'popular';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [

    ];
    

    







    public function platform()
    {
        return $this->belongsTo('Platform', 'pid', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function user()
    {
        return $this->belongsTo('User', 'aid', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
