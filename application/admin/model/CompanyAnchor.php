<?php

namespace app\admin\model;

use think\Model;

class CompanyAnchor extends Model
{
    // 表名
    protected $name = 'company_anchor';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = false;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
        'status_text'
    ];
    

    
    public function getStatusList()
    {
        return ['default' => __('Default'),'normal' => __('Normal'),'stop' => __('Stop')];
    }     


    public function getStatusTextAttr($value, $data)
    {        
        $value = $value ? $value : $data['status'];
        $list = $this->getStatusList();
        return isset($list[$value]) ? $list[$value] : '';
    }




    public function anchor()
    {
        return $this->belongsTo('Anchor', 'aid', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function platform()
    {
        return $this->belongsTo('Platform', 'pid', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function company()
    {
        return $this->belongsTo('Company', 'cid', 'id', [], 'LEFT')->setEagerlyType(0);
    }


    public function companygroup()
    {
        return $this->belongsTo('CompanyGroup', 'gid', 'id', [], 'LEFT')->setEagerlyType(0);
    }
}
