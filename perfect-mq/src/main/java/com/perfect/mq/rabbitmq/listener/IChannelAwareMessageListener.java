package com.perfect.mq.rabbitmq.listener;

import org.springframework.amqp.rabbit.listener.api.ChannelAwareMessageListener;

/**
 * MQ消费者服务监听接口 默认实现
 *
 * @see DefaultConsumerListener
 */
public interface IChannelAwareMessageListener extends ChannelAwareMessageListener {
}
