package com.perfect.bean.entity.quartz;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 定时任务调度日志表
 * </p>
 *
 * @author zxh
 * @since 2019-10-14
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("s_job_log")
public class SJobLogEntity implements Serializable {

    private static final long serialVersionUID = 5865456934996150751L;

    /**
     * 任务ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 任务名称
     */
    @TableField("job_name")
    private String job_name;

    /**
     * 任务组名
     */
    @TableField("job_group")
    private String job_group;

    /**
     * 任务编号
     */
    @TableField("job_serial_code")
    private String job_serial_code;

    /**
     * 任务描述
     */
    @TableField("job_desc")
    private String job_desc;

    /**
     * 任务简称
     */
    @TableField("job_simple_name")
    private String job_simple_name;

    /**
     * Bean名称
     */
    @TableField("bean_name")
    private String bean_name;

    /**
     * 方法名称
     */
    @TableField("method_name")
    private String method_name;

    /**
     * 参数
     */
    @TableField("params")
    private String params;

    /**
     * 表达式
     */
    @TableField("cron_expression")
    private String cron_expression;

    /**
     * 是否是已经删除

     */
    @TableField("isdel")
    private Boolean isdel;

    /**
     * 是否有效
     */
    @TableField("is_effected")
    private Boolean is_effected;

    /**
     * 下次运行时间
     */
    @TableField("next_run_time")
    private LocalDateTime next_run_time;

    /**
     * 上次运行时间
     */
    @TableField("last_run_time")
    private LocalDateTime last_run_time;

    /**
     * 起始有效时间
     */
    @TableField("begin_date")
    private LocalDateTime begin_date;

    /**
     * 结束有效时间
     */
    @TableField("end_date")
    private LocalDateTime end_date;

    /**
     * 运行次数
     */
    @TableField("run_times")
    private Integer run_times;

    @TableField("status")
    private Boolean status;

    /**
     * 异常信息
     */
    @TableField("error")
    private String error;

    /**
     * 耗时（毫秒）
     */
    @TableField("cost")
    private Long cost;

    @TableField("c_id")
    private Long c_id;

    @TableField("c_time")
    private LocalDateTime c_time;

    @TableField("u_id")
    private Long u_id;

    @TableField("u_time")
    private LocalDateTime u_time;


}
