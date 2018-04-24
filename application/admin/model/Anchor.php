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


    /**
     * 正则表达式
     */
    public static function getRegexList()
    {
        $regexList = [
            'required' => '必选',
            'digits'   => '数字',
            'letters'  => '字母',
            'date'     => '日期',
            'time'     => '时间',
            'email'    => '邮箱',
            'url'      => '网址',
            'qq'       => 'QQ号',
            'IDcard'   => '身份证',
            'tel'      => '座机电话',
            'mobile'   => '手机号',
            'zipcode'  => '邮编',
            'chinese'  => '中文',
            'username' => '用户名',
            'password' => '密码'
        ];
        return $regexList;
    }

    /**
     * 读取配置类型
     * @return array
     */
    public static function getTypeList()
    {
        $typeList = [
            'string'   => __('String'),
            'text'     => __('Text'),
            'editor'   => __('Editor'),
            'number'   => __('Number'),
            'date'     => __('Date'),
            'time'     => __('Time'),
            'datetime' => __('Datetime'),
            'select'   => __('Select'),
            'selects'  => __('Selects'),
            'image'    => __('Image'),
            'images'   => __('Images'),
            'file'     => __('File'),
            'files'    => __('Files'),
            'checkbox' => __('Checkbox'),
            'radio'    => __('Radio'),
            'array'    => __('Array'),
            'custom'   => __('Custom'),
        ];
        return $typeList;
    }

    /**
     * 读取分类分组列表
     * @return array
     */
    public static function getGroupList()
    {
        $groupList = config('site.anchorgroup');
        foreach ($groupList as $k => &$v)
        {
            $v = __($v);
        }
        return $groupList;
    }

    /**
     * 将字符串解析成键值数组
     * @param string $text
     * @return array
     */
    public static function decode($text, $split = "\r\n")
    {
        $content = explode($split, $text);
        $arr = [];
        foreach ($content as $k => $v)
        {
            if (stripos($v, "|") !== false)
            {
                $item = explode('|', $v);
                $arr[$item[0]] = $item[1];
            }
        }
        return $arr;
    }

    /**
     * 将键值数组转换为字符串
     * @param array $array
     * @return string
     */
    public static function encode($array, $split = "\r\n")
    {
        $content = '';
        if ($array && is_array($array))
        {
            $arr = [];
            foreach ($array as $k => $v)
            {
                $arr[] = "{$k}|{$v}";
            }
            $content = implode($split, $arr);
        }
        return $content;
    }
    
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

    /*获取基本信息*/
    public static function basicInfo() {

    }

    /*获取账号设置*/
    public static function accountSetting() {

    }

    /*获取跟进记录*/
    public static function traceRecord() {

    }

    /*获取刷礼记录*/
    public static function brushRecord() {

    }

}
