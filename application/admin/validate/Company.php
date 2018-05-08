<?php

namespace app\admin\validate;

use think\Validate;

class Company extends Validate
{
    /**
     * 验证规则
     */
    protected $rule = [
        'cellphone' =>  'require|max:13|unique:company',
        'password'  =>  'require',
        'name'      =>  'require',
        'link'      =>  'require'
    ];
    /**
     * 提示消息
     */
    protected $message = [
    ];
    /**
     * 验证场景
     */
    protected $scene = [
        'add'  => ['cellphone', 'password', 'name', 'link'],
        'edit' => ['cellphone', 'password', 'name', 'link'],
    ];

    /**
     * Company constructor.
     * @param array $rule
     * @param array $message
     * @param array $scene
     */
    public function __construct(array $rules = [], $message = [], $field = [])
    {
        $this->field = [
            'cellphone' => __('Cellphone'),
            'name' => __('Name'),
            'password' => __('Password'),
            'link'    => __('Email'),
        ];
        parent::__construct($rules, $message, $field);
    }

}
