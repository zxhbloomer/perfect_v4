package com.perfect.mq.rabbitmq.listener;

import com.rabbitmq.client.ShutdownSignalException;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.connection.Connection;

/**
 * 默认MQ连接监听器
 */
@Slf4j
public class DefaultConnectionListener implements IConnectionListener {


    @Override
    public void onCreate(Connection connection) {
        log.info("[MQ服务] 创建MQ新连接...");
    }

    @Override
    public void onClose(Connection connection) {
        log.info("[MQ服务] 关闭MQ新连接...");
    }

    @Override
    public void onShutDown(ShutdownSignalException signal) {
        log.info("[MQ服务] 停止MQ新连接...");
    }
}
