package com.perfect.mq.rabbitmq.callback.config;

import org.springframework.amqp.rabbit.core.RabbitTemplate;

/**
 * 请求交换机回调接口
 *
 * @see DefaultConfirmCallback
 */
public interface IConfirmCallback extends RabbitTemplate.ConfirmCallback {
}
