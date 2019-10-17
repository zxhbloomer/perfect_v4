package com.perfect.mq.rabbitmq.producer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.perfect.bean.pojo.mqsender.MqMessagePojo;
import com.perfect.bean.pojo.mqsender.MqSenderPojo;
import com.perfect.bean.pojo.reflection.CallInfoReflectionPojo;
import com.perfect.common.constant.PerfectConstant;
import com.perfect.common.enumconfig.MqSenderEnum;
import com.perfect.common.utils.UuidUtil;
import com.perfect.common.utils.redis.RedisUtil;
import com.perfect.common.utils.string.convert.Convert;
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

import java.nio.charset.Charset;
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
public class MQProducer implements RabbitTemplate.ConfirmCallback, RabbitTemplate.ReturnCallback {

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

    /**
     * 消息发送
     * @param mqSenderPojo
     * @param mqenum
     */
    @Transactional(rollbackFor = Exception.class)
    public void send(MqSenderPojo mqSenderPojo, MQEnum mqenum) {
        String messageDataJson = JSON.toJSONString(mqSenderPojo);

        /**
         * 保存mqSenderPojo到redis，key为mqSenderPojo.getKey()
         */
        redisUtil.putToMap(PerfectConstant.REDIS_PREFIX.MQ_CONSUME_FAILT_PREFIX, mqSenderPojo.getKey(), messageDataJson);

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
        if(correlationData != null) {
            // 处理返回
            if (ack) {
                log.info("------使用MQ消息确认：消息发送成功----");
//                Object redisRtn = redisUtil.getFromMap(PerfectConstant.REDIS_PREFIX.MQ_SEND_PREFIX, correlationData.getId());
                // 删除redis
                redisUtil.removeFromMap(PerfectConstant.REDIS_PREFIX.MQ_SEND_PREFIX, correlationData.getId());
            } else {
                log.error("------使用MQ消息确认：传送失败----");
                Object redisRtn = redisUtil.getFromMap(PerfectConstant.REDIS_PREFIX.MQ_SEND_PREFIX, correlationData.getId());
                redisUtil.putToMap(PerfectConstant.REDIS_PREFIX.MQ_CONSUME_FAILT_PREFIX, correlationData.getId(), redisRtn);
                redisUtil.removeFromMap(PerfectConstant.REDIS_PREFIX.MQ_SEND_PREFIX, correlationData.getId());
            }
        }
    }

    /**
     * 消息退回，存放到redis中
     * @param message
     * @param replyCode
     * @param replyText
     * @param exchange
     * @param routingKey
     */
    @Override
    public void returnedMessage(Message message, int replyCode, String replyText, String exchange, String routingKey) {
        String messageData = Convert.str(message.getBody(), (Charset)null);
        MqSenderPojo mqSenderPojo = JSONObject.parseObject(messageData, MqSenderPojo.class);

        Object redisRtn = redisUtil.getFromMap(PerfectConstant.REDIS_PREFIX.MQ_SEND_PREFIX, mqSenderPojo.getKey());
        redisUtil.putToMap(PerfectConstant.REDIS_PREFIX.MQ_CONSUME_RETURN_PREFIX, mqSenderPojo.getKey(), redisRtn);
        redisUtil.removeFromMap(PerfectConstant.REDIS_PREFIX.MQ_SEND_PREFIX, mqSenderPojo.getKey());
        System.out.println("消息被退回");
        System.out.println("被退回的消息是 :" + messageData);
        System.out.println("被退回的消息编码是 :" + replyCode);
    }
}
