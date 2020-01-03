package com.perfect.common.annotations;

import com.perfect.common.enums.OperationEnum;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 用来标注需要进行操作日志的服务函数上
 * @author zxh
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface OperationLogAnnotion {
	/** 操作业务名 */
	String name();
	/** 操作类型 */
	OperationEnum type();
	/** 具体的操作，日志中需要保存的内容 */
	OperationDetailLogAnnotion[] operationDetails() default {};
}
