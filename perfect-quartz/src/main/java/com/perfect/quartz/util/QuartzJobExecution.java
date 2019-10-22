package com.perfect.quartz.util;

import com.perfect.bean.entity.quartz.SJobEntity;
import org.quartz.JobExecutionContext;

/**
 * 定时任务处理（允许并发执行）
 * 
 * @author
 *
 */
@Deprecated
public class QuartzJobExecution extends AbstractQuartzJob {
    @Override protected void doExecute(JobExecutionContext context, SJobEntity sysJob) throws Exception {
        JobInvokeUtil.invokeMethod(sysJob);
    }
}
