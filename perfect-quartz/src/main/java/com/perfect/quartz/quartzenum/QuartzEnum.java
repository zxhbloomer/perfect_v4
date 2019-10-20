/**
 *
 */
package com.perfect.quartz.quartzenum;

import lombok.Getter;
import lombok.Setter;

/**
 * mq重要配置
 */
public enum QuartzEnum {
	TASK_TENTANT(QuartzInfo.TentantTask.job_code,
				QuartzInfo.TentantTask.job_name,
				QuartzInfo.TentantTask.job_group_code,
				QuartzInfo.TentantTask.job_group_name,
				QuartzInfo.TentantTask.job_desc,
				QuartzInfo.TentantTask.job_simple_name),
	;

//	@Getter @Setter
//	private String key;
//	@Getter @Setter
//	private String name;
	@Getter @Setter
	private String job_code;
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

	/**
	 *
	 * @param job_code
	 * @param job_name
	 * @param job_group_code
	 * @param job_group_name
	 * @param job_desc
	 * @param job_simple_name
	 */
	private QuartzEnum(String job_code, String job_name, String job_group_code, String job_group_name, String job_desc, String job_simple_name) {
		this.job_code = job_code;
		this.job_name = job_name;
		this.job_group_code = job_group_code;
		this.job_group_name = job_group_name;
		this.job_desc = job_desc;
		this.job_simple_name = job_simple_name;
	}

	public static class QuartzInfo {

		/**
		 * 租户任务
		 *
		 * @author zxh
		 * @date 2019年 10月12日 23:34:54
		 */
		public class TentantTask {
			public static final String job_code = "task-tentant";
			public static final String job_name = "租户任务";
			public static final String job_group_code = "task-group-tentant";
			public static final String job_group_name = "租户任务消息队列";
			public static final String job_desc = "租户任务";
			public static final String job_simple_name = "租户任务";
		}
	}
}
