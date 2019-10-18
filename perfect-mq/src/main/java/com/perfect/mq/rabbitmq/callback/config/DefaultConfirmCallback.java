package com.perfect.mq.rabbitmq.callback.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.connection.CorrelationData;

/**
 * 默认请求交换机接口实现
 */
public class DefaultConfirmCallback implements IConfirmCallback {

    private static final Logger LOGGER = LoggerFactory.getLogger(DefaultConfirmCallback.class);

    @Override
    public void confirm(CorrelationData correlationData, boolean ack, String cause) {
        LOGGER.info("[MQ服务] ack:{}, cause:{}", ack, cause);
    }
}
