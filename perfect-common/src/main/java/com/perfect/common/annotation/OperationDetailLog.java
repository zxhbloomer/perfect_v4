package com.perfect.common.annotation;

import com.perfect.common.enums.OperationEnum;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 具体的操作，日志中需要保存的内容
 * @author zxh
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface OperationDetailLog {
	/** 业务名 */
	String name();
	/** 操作类型 */
	OperationEnum type();
	/** 业务操作描述 */
	String oper_info();
	/** 表名 */
	String table_name();
	/** 需要记录的字段 */
	String[] cloums() default {};
	/** id字段的值 */
	String id() default "";

//	/** 业务名 */
//	String name();
//	/** 表名 */
//	String table();
//	/** id 在函数的字段名 */
//	int idRef() default -1;
//	/** 需要记录的字段 */
//	String[] cloum() default {};
//	/** 操作类型 */
//	OperationEnum type();
}