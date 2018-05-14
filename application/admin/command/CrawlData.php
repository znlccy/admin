<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/14
 * Time: 10:00
 * Comment: 爬取数据
 */
namespace app\admin\command;

use think\console\Command;
use think\console\Input;
use think\console\Output;

class CrawlData extends Command {

    /**
     * 配置方法
     */
    protected function configure()
    {
        $this->setName('crawldata')->setDescription('Here is remark');
    }

    /**
     * 执行方法
     * @param Input $input
     * @param Output $output
     * @return int|null|void
     */
    protected function execute(Input $input, Output $output)
    {
        $output->writeln("Crawl Data Command");
    }

}