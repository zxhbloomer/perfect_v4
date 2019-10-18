package com.perfect.mq.rabbitmq.config;

import com.perfect.mq.rabbitmq.listener.IChannelAwareMessageListener;
import com.perfect.mq.rabbitmq.properties.MQProperties;
import org.springframework.amqp.core.AcknowledgeMode;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.listener.SimpleMessageListenerContainer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * MQ客户端配置
 */
@Configuration
public class ConsumerConfiguration {

    @Autowired
    private MQProperties mqProperties;

    @Bean
    public SimpleMessageListenerContainer listenerContainer(ConnectionFactory connectionFactory,
                                        IChannelAwareMessageListener iChannelAwareMessageListener) {
        SimpleMessageListenerContainer container = new SimpleMessageListenerContainer();
        container.setAcknowledgeMode(AcknowledgeMode.MANUAL);
        container.setConnectionFactory(connectionFactory);
        container.setQueueNames(mqProperties.getConsumer().getDefaultQueue());
        container.setMessageListener(iChannelAwareMessageListener);
        return container;
    }
}
