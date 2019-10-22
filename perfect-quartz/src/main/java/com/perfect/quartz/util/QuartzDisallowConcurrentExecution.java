package com.perfect.quartz.util;

import com.perfect.bean.entity.quartz.SJobEntity;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.JobExecutionContext;

/**
 * 定时任务处理（禁止并发执行）
 *
 * @author
 */
@Deprecated
@DisallowConcurrentExecution
public class QuartzDisallowConcurrentExecution extends AbstractQuartzJob {
    @Override protected void doExecute(JobExecutionContext context, SJobEntity sysJob) throws Exception {
        JobInvokeUtil.invokeMethod(sysJob);
    }
}
