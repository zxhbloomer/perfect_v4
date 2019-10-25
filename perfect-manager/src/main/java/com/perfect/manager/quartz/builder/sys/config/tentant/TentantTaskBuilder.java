package com.perfect.manager.quartz.builder.sys.config.tentant;

import com.alibaba.fastjson.JSON;
import com.perfect.bean.entity.quartz.SJobEntity;
import com.perfect.bean.vo.sys.config.tenant.STentantVo;
import com.perfect.common.enumconfig.quartz.QuartzEnum;
import com.perfect.common.utils.bean.BeanUtilsSupport;

/**
 * 配置租户定时任务启动类
 *
 * @author zxh
 * @date 2019年 10月20日 21:35:07
 */
public class TentantTaskBuilder {

    /**
     * 禁用任务bean构筑
     * @param data
     * @return
     */
    public static SJobEntity builderDisableBean(STentantVo data, SJobEntity entity){
        SJobEntity rtnBean = new SJobEntity();
        if (entity == null){
            // 构筑新bean
            rtnBean = TentantTaskBuilder.builderNewDisableBean(data);
        } else {
            BeanUtilsSupport.copyProperties(entity, rtnBean);
            rtnBean.setBean_name(STentantVo.class.getName());
            rtnBean.setParams(JSON.toJSONString(data));
            // 下次运行时间：重要启动时间
            rtnBean.setNext_run_time(data.getDisable_time());
        }
        // 上次运行时间
        return rtnBean;
    }

    /**
     * 禁用任务bean构筑
     * @param data
     * @return
     */
    public static SJobEntity builderNewDisableBean(STentantVo data){
        SJobEntity sJobEntity = initBuilder();
        sJobEntity.setJob_name(QuartzEnum.TASK_TENTANT_DISABLE.getJob_name());
        sJobEntity.setJob_group_code(QuartzEnum.TASK_TENTANT_DISABLE.getJob_group_code());
        sJobEntity.setJob_group_name(QuartzEnum.TASK_TENTANT_DISABLE.getJob_group_name());
        sJobEntity.setJob_desc(QuartzEnum.TASK_TENTANT_DISABLE.getJob_desc());
        sJobEntity.setJob_simple_name(QuartzEnum.TASK_TENTANT_DISABLE.getJob_simple_name());
        sJobEntity.setJob_serial_id(data.getId());
        sJobEntity.setJob_serial_type(QuartzEnum.TASK_TENTANT_DISABLE.getJob_serial_type());
        sJobEntity.setBean_name(STentantVo.class.getName());
        sJobEntity.setParams(JSON.toJSONString(data));
        sJobEntity.setCron_expression(null);
        // 下次运行时间：重要启动时间
        sJobEntity.setNext_run_time(data.getDisable_time());
        // 上次运行时间
        sJobEntity.setLast_run_time(null);
        return sJobEntity;
    }

    /**
     * 禁用任务bean构筑
     * @param data
     * @return
     */
    public static SJobEntity builderEnableBean(STentantVo data, SJobEntity entity){
        SJobEntity rtnBean = new SJobEntity();
        if (entity == null){
            // 构筑新bean
            rtnBean = TentantTaskBuilder.builderNewEnableBean(data);
        } else {
            BeanUtilsSupport.copyProperties(entity, rtnBean);
            rtnBean.setBean_name(STentantVo.class.getName());
            rtnBean.setParams(JSON.toJSONString(data));
            // 下次运行时间：重要启动时间
            rtnBean.setNext_run_time(data.getEnable_time());
        }
        // 上次运行时间
        return rtnBean;
    }

    /**
     * 启用任务bean构筑
     * @param data
     * @return
     */
    public static SJobEntity builderNewEnableBean(STentantVo data){
        SJobEntity sJobEntity = initBuilder();
        sJobEntity.setJob_name(QuartzEnum.TASK_TENTANT_ENABLE.getJob_name());
        sJobEntity.setJob_group_code(QuartzEnum.TASK_TENTANT_ENABLE.getJob_group_code());
        sJobEntity.setJob_group_name(QuartzEnum.TASK_TENTANT_ENABLE.getJob_group_name());
        sJobEntity.setJob_desc(QuartzEnum.TASK_TENTANT_ENABLE.getJob_desc());
        sJobEntity.setJob_simple_name(QuartzEnum.TASK_TENTANT_ENABLE.getJob_simple_name());
        sJobEntity.setJob_serial_id(data.getId());
        sJobEntity.setJob_serial_type(QuartzEnum.TASK_TENTANT_ENABLE.getJob_serial_type());
        sJobEntity.setBean_name(STentantVo.class.getName());
        sJobEntity.setParams(JSON.toJSONString(data));
        sJobEntity.setCron_expression(null);
        // 下次运行时间：重要启动时间
        sJobEntity.setNext_run_time(data.getEnable_time());
        // 上次运行时间
        sJobEntity.setLast_run_time(null);
        return sJobEntity;
    }

    /**
     * 初始化
     * @return
     */
    public static SJobEntity initBuilder(){
        SJobEntity sJobEntity = SJobEntity.builder()
                                        // 任务ID：待赋值
//                                        .id()
                                        // 任务名称
                                        .job_name("租户定时任务")
                                        // 任务组
                                        .job_group_code("perfect_task")
                                        .job_group_name("租户定时任务")
                                        // 关联编号：待赋值
//                                        .job_serial_id(null)
                                        // 关联表名字：待赋值
//                                        .job_serial_type(null)
                                        // 任务描述
                                        .job_desc("系统自动生产该项任务")
                                        // 任务简称
                                        .job_simple_name("租户定时")
                                        // Bean名称：待赋值
//                                        .bean_name(null)
                                        // 方法名称：待赋值
//                                        .method_name(null)
                                        // 参数：待赋值
//                                        .params(null)
                                        // cron表达式：待赋值
//                                        .cron_expression(null)
                                        // 策略：计划策略：0=默认,1=立即触发执行,2=触发一次执行,3=不触发立即执行
                                        .misfire_policy("0")
                                        // 是否并发执行（0允许 1禁止）
                                        .concurrent(false)
                                        // 判断是否是cron表达式，还是simpletrigger
                                        .is_cron(false)
                                        // 是否是已经删除
                                        .is_del(false)
                                        // 下次运行时间：待赋值
//                                        .next_run_time(null)
                                        // 上次运行时间：待赋值
//                                        .last_run_time(null)
                                        // 运行次数：待赋值
//                                        .run_times(null)
                                        // 异常信息
                                        .msg(null)
                                        .build();
        return sJobEntity;
    }
}
