package com.perfect.mq.rabbitmq.producer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.perfect.mq.rabbitmq.mqenum.MQEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

/**
 * 生产者
 *
 * @author zxh
 * @date 2019年 10月14日 21:46:52
 */
@Component
@Slf4j
public class MQProducer implements RabbitTemplate.ConfirmCallback {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Transactional(rollbackFor = Exception.class)
    public void send(Object o, Class clazz, MQEnum mqenum) {
        Map<Class, Object> map = new ConcurrentHashMap<>();
        map.put(clazz, o);

        String jsonString = JSON.toJSONString(map);
        String messAgeId = UUID.randomUUID().toString().replace("-", "");
        // 封装消息
        Message message =
            MessageBuilder.withBody(jsonString.getBytes()).setContentType(MessageProperties.CONTENT_TYPE_JSON)
                .setContentEncoding("utf-8").setMessageId(messAgeId).build();
        // 构建回调返回的数据（消息id）
        this.rabbitTemplate.setMandatory(true);
        this.rabbitTemplate.setConfirmCallback(this);
        CorrelationData correlationData = new CorrelationData(jsonString);
        rabbitTemplate.convertAndSend(mqenum.getExchange(), mqenum.getRouting_key(), message, correlationData);

    }

    // 生产消息确认机制 生产者往服务器端发送消息的时候，采用应答机制
    @Override
    public void confirm(CorrelationData correlationData, boolean ack, String cause) {
        String jsonString = correlationData.getId();
        System.out.println("消息id:" + correlationData.getId());
        if (ack) {
            log.info("------使用MQ消息确认机制确保消息一定要投递到MQ中成功----");
            return;
        } else {
            JSONObject jsonObject = JSONObject.parseObject(jsonString);
            log.error("------使用MQ消息确认：传送失败----");
            log.error("------传送失败：" + jsonObject);

        }
    }
}
