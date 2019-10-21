package com.perfect.quartz.scheduler.task.builder.sys.config.tenant;

import com.perfect.bean.entity.quartz.SJobEntity;
import com.perfect.bean.pojo.quartz.SchedulerPoJo;
import com.perfect.common.utils.UuidUtil;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;

import java.time.LocalDateTime;

/**
 * 配置租户定时任务启动类
 *
 * @author zxh
 * @date 2019年 10月20日 21:35:07
 */
public class TentantTaskBuilder {

    public static SJobEntity build(LocalDateTime begin_date, LocalDateTime end_date){
        SJobEntity sJobEntity = SJobEntity.builder()
                                        // 任务名称
                                        .job_name("租户定时任务")
                                        // 任务组名
                                        .job_group("定时任务")
                                        // 关联编号
                                        .job_serial_code(null)
                                        // 关联表名字
                                        .job_serial_type(null)
                                        // 任务描述
                                        .job_desc("系统自动生产该项任务")
                                        // 任务简称
                                        .job_simple_name("租户定时")
                                        // Bean名称
                                        .bean_name(null)
                                        // 方法名称
                                        .method_name(null)
                                        // 参数
                                        .params(null)
                                        // cron表达式
                                        .cron_expression(null)
                                        // 策略：计划策略：0=默认,1=立即触发执行,2=触发一次执行,3=不触发立即执行
                                        .misfire_policy("0")
                                        // 是否并发执行（0允许 1禁止）
                                        .concurrent(false)
                                        // 判断是否是cron表达式，还是simpletrigger
                                        .is_cron(false)
                                        // 是否是已经删除
                                        .is_del(false)
                                        // 下次运行时间
                                        .next_run_time(null)
                                        // 上次运行时间
                                        .last_run_time(null)
                                        // 起始有效时间
                                        .begin_date(begin_date)
                                        // 结束有效时间
                                        .end_date(end_date)
                                        // 运行次数
                                        .run_times(null)
                                        // 异常信息
                                        .error(null)
                                        .build();
        return sJobEntity;
    }
}
