package com.perfect.mq.rabbitmq.config;

import com.perfect.mq.rabbitmq.callback.config.IConfirmCallback;
import com.perfect.mq.rabbitmq.callback.config.IReutrnedCallback;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * RabbitTemplate配置类
 *
 * @author zxh
 * @date 2019年 10月19日 15:28:14
 */
@Configuration
public class RabbitTemplateConfiguration {

    @Bean("perfect_RabbitTemplate")
    public RabbitTemplate rabbitTemplate(CachingConnectionFactory connectionFactory,
                                        IConfirmCallback iConfirmCallback,
                                        IReutrnedCallback iReutrnedCallback) {
        RabbitTemplate amqpTemplate = new RabbitTemplate();
        amqpTemplate.setConnectionFactory(connectionFactory);
        amqpTemplate.setConfirmCallback(iConfirmCallback);
        amqpTemplate.setReturnCallback(iReutrnedCallback);
        amqpTemplate.setMandatory(true);
        return amqpTemplate;
    }
}
