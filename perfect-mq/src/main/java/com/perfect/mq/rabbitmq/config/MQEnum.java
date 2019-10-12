/**
 *
 */
package com.perfect.mq.rabbitmq.config;

/**
 *
 */
public enum MQEnum {
	MQ_OPER_LOG(Constants.MQ_OPER_LOG, "平台操作日志");

	private String code;
	private String name;

	private MQEnum(String code, String name) {
		this.code = code;
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public static class Constants {
		public static final String MQ_OPER_LOG = "perfect-log";
	}
}
