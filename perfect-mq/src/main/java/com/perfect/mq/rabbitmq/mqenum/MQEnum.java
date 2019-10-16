/**
 *
 */
package com.perfect.mq.rabbitmq.mqenum;

/**
 * mq重要配置
 */
public enum MQEnum {
	MQ_OPER_LOG(MqInfo.Log.queueCode,
				MqInfo.Log.name,
				MqInfo.Log.exchange,
				MqInfo.Log.routing_key);

	private String queueCode;
	private String name;
	private String exchange;
	private String routing_key;

	private MQEnum(String queueCode, String name, String exchange, String routing_key) {
		this.queueCode = queueCode;
		this.name = name;
		this.exchange = exchange;
		this.routing_key = routing_key;
	}

	public String getQueueCode() {
		return queueCode;
	}

	public void setQueueCode(String queueCode) {
		this.queueCode = queueCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getExchange() {
		return exchange;
	}

	public void setExchange(String exchange) {
		this.exchange = exchange;
	}

	public String getRouting_key() {
		return routing_key;
	}

	public void setRouting_key(String routing_key) {
		this.routing_key = routing_key;
	}

	public static class MqInfo {

		/**
		 * 日志类
		 *
		 * @author zxh
		 * @date 2019年 10月12日 23:34:54
		 */
		public class Log {
			public static final String queueCode = "perfect-log";
			public static final String name = "平台操作日志";
			public static final String exchange = "perfect-log-exchange";
			public static final String routing_key = "perfect-log.#";
		}

		/**
		 * 任务类
		 *
		 * @author zxh
		 * @date 2019年 10月12日 23:34:54
		 */
		public class task {
			public static final String queueCode = "perfect-task";
			public static final String name = "平台任务类";
			public static final String exchange = "perfect-task-exchange";
			public static final String routing_key = "perfect-task.#";
		}
	}
}
