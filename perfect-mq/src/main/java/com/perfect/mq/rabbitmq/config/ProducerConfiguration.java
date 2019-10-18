package com.perfect.mq.rabbitmq.config;

import com.perfect.mq.rabbitmq.callback.config.IConfirmCallback;
import com.perfect.mq.rabbitmq.callback.config.IReutrnedCallback;
import com.perfect.mq.rabbitmq.listener.IConnectionListener;
import com.perfect.mq.rabbitmq.properties.MQProperties;
import org.springframework.amqp.core.*;
import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.amqp.rabbit.connection.CachingConnectionFactory;
import org.springframework.amqp.rabbit.connection.ConnectionFactory;
import org.springframework.amqp.rabbit.core.RabbitAdmin;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * MQ配置
 *
 */
@Configuration
@EnableRabbit
public class ProducerConfiguration {

    @Autowired
    private MQProperties mqProperties;

    @Bean
    public RabbitAdmin rabbitAdmin(CachingConnectionFactory connectionFactory,
                                    IConnectionListener iConnectionListener) {
        connectionFactory.addConnectionListener(iConnectionListener);
        return new RabbitAdmin(connectionFactory);
    }

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

    @Bean
    public Queue queue(RabbitAdmin rabbitAdmin) {
        Queue queue = new Queue(mqProperties.getProducer().getDefaultQueue());
        rabbitAdmin.declareQueue(queue);
        return queue;
    }

    @Bean
    public Exchange exchange(RabbitAdmin rabbitAdmin) {
        Exchange exchange = ExchangeBuilder.topicExchange(mqProperties.getProducer().getDefaultExchange()).durable(false).build();
        rabbitAdmin.declareExchange(exchange);
        return exchange;
    }

    @Bean
    public Binding binding(Queue queue, Exchange exchange, RabbitAdmin rabbitAdmin) {
        Binding binding = BindingBuilder.bind(queue).to(exchange).with(mqProperties.getProducer().getDefaultRoutingKey()).noargs();
        rabbitAdmin.declareBinding(binding);
        return binding;
    }
}
