package com.perfect.quartz.util;

import com.perfect.bean.entity.quartz.SJobEntity;
import com.perfect.bean.entity.quartz.SJobLogEntity;
import com.perfect.common.constant.ScheduleConstants;
import com.perfect.common.utils.ExceptionUtil;
import com.perfect.common.utils.bean.BeanUtilsSupport;
import com.perfect.common.utils.string.StringUtil;
import com.perfect.core.service.quartz.ISJobLogService;

import lombok.extern.slf4j.Slf4j;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;


import java.time.LocalDateTime;
import java.time.ZoneOffset;

/**
 * 抽象quartz调用
 *
 * @author
 */
@Slf4j
public abstract class AbstractQuartzJob implements Job {

    /**
     * 线程本地变量
     */
    private static ThreadLocal<LocalDateTime> threadLocal = new ThreadLocal<>();

    @Override public void execute(JobExecutionContext context) throws JobExecutionException {
        SJobEntity sysJob = new SJobEntity();
        BeanUtilsSupport.copyProperties(context.getMergedJobDataMap().get(ScheduleConstants.TASK_PROPERTIES), sysJob);
        try {
            before(context, sysJob);
            if (sysJob != null) {
                doExecute(context, sysJob);
            }
            after(context, sysJob, null);
        } catch (Exception e) {
            log.error("任务执行异常  - ：", e);
            after(context, sysJob, e);
        }
    }

    /**
     * 执行前
     *
     * @param context 工作执行上下文对象
     * @param sysJob  系统计划任务
     */
    protected void before(JobExecutionContext context, SJobEntity sysJob) {
        threadLocal.set(LocalDateTime.now());
    }

    /**
     * 执行后
     *
     */
    protected void after(JobExecutionContext context, SJobEntity sysJob, Exception e) {
        LocalDateTime startTime = threadLocal.get();
        threadLocal.remove();

        final SJobLogEntity sysJobLog = new SJobLogEntity();
        BeanUtilsSupport.copyProperties(sysJob, sysJobLog);
        sysJobLog.setBegin_date(startTime);
        sysJobLog.setEnd_date(LocalDateTime.now());

        long runMs = sysJobLog.getEnd_date().toEpochSecond(ZoneOffset.of("+8")) - sysJobLog.getBegin_date().toEpochSecond(ZoneOffset.of("+8"));
        sysJobLog.setCost(runMs);
        if (e != null) {
            sysJobLog.setStatus(false);
            String errorMsg = StringUtil.substring(ExceptionUtil.getException(e), 0, 2000);
            sysJobLog.setError(errorMsg);
        } else {
            sysJobLog.setStatus(true);
        }

        // 写入数据库当中
        BeanUtilsSupport.getBean(ISJobLogService.class).addJobLog(sysJobLog);
    }

    /**
     * 执行方法，由子类重载
     *
     * @param context 工作执行上下文对象
     * @param sysJob  系统计划任务
     * @throws Exception 执行过程中的异常
     */
    protected abstract void doExecute(JobExecutionContext context, SJobEntity sysJob) throws Exception;
}
