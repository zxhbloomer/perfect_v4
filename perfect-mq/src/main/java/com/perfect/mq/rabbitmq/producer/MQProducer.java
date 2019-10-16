package com.perfect.mq.rabbitmq.producer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.perfect.bean.pojo.mqsender.MqMessagePojo;
import com.perfect.bean.pojo.mqsender.MqSenderPojo;
import com.perfect.bean.pojo.reflection.CallInfoReflectionPojo;
import com.perfect.common.enumconfig.MqSenderEnum;
import com.perfect.common.utils.UuidUtil;
import com.perfect.common.utils.redis.RedisUtil;
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

    /**
     * todo:考虑数据放到redis中，然后需要回调则考虑回调，没有就没有
     * https://github.com/notMyPen/spring-cloud-clover/blob/126d26bdc0da8a51de68774897ee859dd67a3c31/clover-business-starter/src/main/java/rrx/cnuo/cncommon/utils/MqSendTool.java
     *
     * CorrelationData的id，使用redis的key
     *
     */

    @Autowired
    private RabbitTemplate rabbitTemplate;

    @Autowired
    private RedisUtil redisUtil;


    @Transactional(rollbackFor = Exception.class)
    public void send(MqSenderPojo mqSenderPojo, MQEnum mqenum) {
        String messageDataJson = JSON.toJSONString(mqSenderPojo);

        /**
         * 保存mqSenderPojo到redis，key为mqSenderPojo.getKey()
         */
        redisUtil.

        /**
         * 封装消息
         */
        Message message =
            MessageBuilder.withBody(messageDataJson.getBytes()).setContentType(MessageProperties.CONTENT_TYPE_JSON)
                .setContentEncoding("utf-8").setMessageId(mqSenderPojo.getKey()).build();
        /**
         * 确认消息是否到达broker服务器
         */
        this.rabbitTemplate.setMandatory(true);
        /**
         * 回调
         */
        if(null != mqSenderPojo.getCallBackInfo()){
            this.rabbitTemplate.setConfirmCallback(this);
        }
        CorrelationData correlationData = new CorrelationData(mqSenderPojo.getKey());
        rabbitTemplate.convertAndSend(mqenum.getExchange(), mqenum.getRouting_key(), message, correlationData);
    }

    /**
     * 发送mq，有callback
     * @param messageInfo
     * @param clazz
     * @param mqenum
     */
    @Transactional(rollbackFor = Exception.class)
    @Deprecated
    public void send(Object messageInfo, Class clazz, MQEnum mqenum) {
        Map<Class, Object> map = new ConcurrentHashMap<>();
        map.put(clazz, messageInfo);

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

    /**
     * 生产消息确认机制 生产者往服务器端发送消息的时候，采用应答机制
     *
     * @param correlationData
     * @param ack
     * @param cause
     */
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
