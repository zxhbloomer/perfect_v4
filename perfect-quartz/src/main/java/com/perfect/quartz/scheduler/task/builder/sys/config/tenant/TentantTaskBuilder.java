package com.perfect.quartz.scheduler.task.builder.sys.config.tenant;

import com.perfect.bean.pojo.quartz.SchedulerPoJo;
import com.perfect.common.utils.UuidUtil;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;

/**
 * 配置租户定时任务启动类
 *
 * @author zxh
 * @date 2019年 10月20日 21:35:07
 */
public class TentantTaskBuilder {

    public static SchedulerPoJo build(){
        SchedulerPoJo schedulerPoJo = SchedulerPoJo.builder()
                                                    .key(UuidUtil.randomUUID())
                                                    // 任务名称
                                                    .job_name("租户定时任务")
                                                    // 任务组名
                                                    .job_group("定时任务")
                                                    // 任务编号
                                                    .job_serial_code("")
                                                    // 任务描述
                                                    .job_desc("系统自动生产该项任务")
                                                    // 任务简称
                                                    .job_simple_name("租户定时")
                                                    // cron表达式
                                                    .cron_expression(null)
                                                    // 策略：计划策略：0=默认,1=立即触发执行,2=触发一次执行,3=不触发立即执行
                                                    .misfire_policy(0)
                                                    // 是否并发执行（0允许 1禁止）
                                                    .concurrent(false)
                                                    // 判断是否是cron表达式，还是simpletrigger
                                                    .isCron(false)
                                                    // 起始有效时间
                                                    .begin_date(null)
                                                    // 结束有效时间
                                                    .end_date(null)
                                                    // 重复执行次数
                                                    .repeat_count(0)
                                                    // 重复执行次数，执行时间隔间
                                                    .repeat_interval(null)
                                                    // 运行结果
                                                    .status(false)
                                                    .build();
        return schedulerPoJo;
    }
}
