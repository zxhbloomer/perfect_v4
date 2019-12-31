package com.perfect.common.annotation;

import java.lang.annotation.*;

/**
 * 自定义注解防止表单重复提交 注解
 * 
 * @author
 *
 */
@Inherited
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RepeatSubmit {

}