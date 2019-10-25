package com.perfect.common.enumconfig.quartz;

import lombok.Getter;
import lombok.Setter;

/**
 * mq重要配置
 */
public enum QuartzEnum {
	TASK_TENTANT_ENABLE(
						QuartzInfo.TentantEnableTask.job_name,
						QuartzInfo.TentantEnableTask.job_group_code,
						QuartzInfo.TentantEnableTask.job_group_name,
						QuartzInfo.TentantEnableTask.job_desc,
						QuartzInfo.TentantEnableTask.job_simple_name,
						QuartzInfo.TentantEnableTask.job_serial_type,
						QuartzInfo.TentantEnableTask.ok_msg
						),

	TASK_TENTANT_DISABLE(
						QuartzInfo.TentantDisableTask.job_name,
						QuartzInfo.TentantDisableTask.job_group_code,
						QuartzInfo.TentantDisableTask.job_group_name,
						QuartzInfo.TentantDisableTask.job_desc,
						QuartzInfo.TentantDisableTask.job_simple_name,
						QuartzInfo.TentantDisableTask.job_serial_type,
						QuartzInfo.TentantDisableTask.ok_msg
						),
	;

	@Getter @Setter
	private String job_name;
	@Getter @Setter
	private String job_group_code;
	@Getter @Setter
	private String job_group_name;
	@Getter @Setter
	private String job_desc;
	@Getter @Setter
	private String job_simple_name;
	@Getter @Setter
	private String job_serial_type;
	@Getter @Setter
	private String ok_msg;

	/**
	 *
	 * @param job_name
	 * @param job_group_code
	 * @param job_group_name
	 * @param job_desc
	 * @param job_simple_name
	 * @param job_serial_type
	 * @param ok_msg
	 */
	private QuartzEnum(String job_name,
						String job_group_code,
						String job_group_name,
						String job_desc,
						String job_simple_name,
						String job_serial_type,
						String ok_msg) {
		this.job_name = job_name;
		this.job_group_code = job_group_code;
		this.job_group_name = job_group_name;
		this.job_desc = job_desc;
		this.job_simple_name = job_simple_name;
		this.job_serial_type = job_serial_type;
		this.ok_msg = ok_msg;
	}

	public static class QuartzInfo {

		/**
		 * 租户任务：启用
		 *
		 * @author zxh
		 * @date 2019年 10月12日 23:34:54
		 */
		public class TentantEnableTask {
			public static final String job_name = "租户定时任务：启用租户任务";
			public static final String job_group_code = "perfect_task_tentant";
			public static final String job_group_name = "租户定时任务";
			public static final String job_desc = "系统自动生产该项任务:租户定时任务，启用任务";
			public static final String job_simple_name = "租户启用任务";
			public static final String job_serial_type = "s_job_enable_task";
			public static final String ok_msg = "租户定时任务：启用租户任务——执行成功";
		}

		/**
		 * 租户任务：禁用，关闭
		 *
		 * @author zxh
		 * @date 2019年 10月12日 23:34:54
		 */
		public class TentantDisableTask {
			public static final String job_name = "租户定时任务：停止启用租户任务";
			public static final String job_group_code = "perfect_task_tentant";
			public static final String job_group_name = "租户定时任务";
			public static final String job_desc = "系统自动生产该项任务:租户定时任务，停止启用租户";
			public static final String job_simple_name = "租户停止任务";
			public static final String job_serial_type = "s_job_disable_task";
			public static final String ok_msg = "租户定时任务：停止启用租户任务——执行成功";
		}
	}
}
