<?php

namespace app\admin\model;

use think\Model;

class Anchor extends Model
{
    // 表名
    protected $name = 'anchor';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'livestatus_text',
        'sign_text',
        'status_text'
    ];
    

    
    public function getLivestatusList()
    {
        return ['normal' => __('Normal'),'stop' => __('Stop')];
    }     

    public function getSignList()
    {
        return ['signed' => __('Signed'),'nosign' => __('Nosign')];
    }     

    public function getStatusList()
    {
        return ['normal' => __('Normal'),'stop' => __('Stop')];
    }     


    public function getLivestatusTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['livestatus'];
        $list = $this->getLivestatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getSignTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['sign'];
        $list = $this->getSignList();
        return isset($list[$value]) ? $list[$value] : '';
    }


    public function getStatusTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




    public function platform()
    {
        return $this->belongsTo('Platform', 'pid', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function company()
    {
        return $this->belongsTo('Company', 'cid', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
