package com.perfect.bean.pojo.quartz;

import io.swagger.annotations.ApiModel;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.Tolerate;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 任务类
 *
 * @author zxh
 * @date 2019年 10月19日 23:08:08
 */
@Data
@ApiModel(value = "任务bean", description = "任务bean")
@Builder
public class SchedulerPoJo implements Serializable {

    private static final long serialVersionUID = 1920362818220852657L;

    @Tolerate
    SchedulerPoJo(){}

    /**
     * 任务ID
     */
    private Long id;

    /**
     * 任务key:uuid
     */
    private Long key;

    /**
     * 任务名称
     */
    private String job_name;

    /**
     * 任务组名
     */
    private String job_group;

    /**
     * 任务编号
     */
    private String job_serial_code;

    /**
     * 任务描述
     */
    private String job_desc;

    /**
     * 任务简称
     */
    private String job_simple_name;

    /**
     * 表达式
     */
    private String cron_expression;

    /**
     * 计划策略：0=默认,1=立即触发执行,2=触发一次执行,3=不触发立即执行
     */
    private String misfire_policy;

    /**
     * 是否并发执行（0允许 1禁止）
     */
    private Boolean concurrent;

    /**
     * 判断是否是cron表达式，还是simpletrigger
     */
    private Boolean isCron;


    /**
     * 起始有效时间
     */
    private LocalDateTime begin_date;

    /**
     * 结束有效时间
     */
    private LocalDateTime end_date;

    /**
     * 重复执行次数
     */
    private int repeat_count;

    /**
     * 重复执行次数
     */
    private int repeat_interval;

    /**
     * 运行次数
     */
    private Integer run_times;

    /**
     * 运行结果
     */
    private Boolean status;

    /**
     * 异常信息
     */
    private String error;
}
