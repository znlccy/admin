<?php

namespace app\admin\model;

use think\Model;

class Session extends Model
{
    // 表名
    protected $name = 'session';
    
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


}
