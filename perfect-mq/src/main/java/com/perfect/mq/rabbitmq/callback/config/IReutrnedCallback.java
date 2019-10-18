package com.perfect.mq.rabbitmq.callback.config;

import org.springframework.amqp.rabbit.core.RabbitTemplate;

/**
 * 交换机请求队列失败回调接口
 *
 * @see DefaultReutrnedCallback
 */
public interface IReutrnedCallback extends RabbitTemplate.ReturnCallback {
}
