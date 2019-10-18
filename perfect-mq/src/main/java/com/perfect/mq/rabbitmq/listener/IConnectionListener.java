package com.perfect.mq.rabbitmq.listener;

import org.springframework.amqp.rabbit.connection.ConnectionListener;

/**
 * MQ连接监听器接口 默认实现
 *
 * @see DefaultConnectionListener
 */
public interface IConnectionListener extends ConnectionListener {
}
