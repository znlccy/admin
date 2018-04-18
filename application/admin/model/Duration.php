<?php

namespace app\admin\model;

use think\Model;

class Duration extends Model
{
    // 表名
    protected $name = 'duration';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'livetime_text'
    ];
    

    



    public function getLivetimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['livetime'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setLivetimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


    public function platform()
    {
        return $this->belongsTo('Platform', 'pid', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function user()
    {
        return $this->belongsTo('User', 'aid', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
