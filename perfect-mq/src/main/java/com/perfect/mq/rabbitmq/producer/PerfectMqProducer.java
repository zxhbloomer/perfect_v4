package com.perfect.mq.rabbitmq.producer;

import com.alibaba.fastjson.JSON;
import com.perfect.bean.entity.log.mq.SLogMqEntity;
import com.perfect.bean.pojo.mqsender.MqSenderPojo;
import com.perfect.common.constant.PerfectConstant;
import com.perfect.common.utils.redis.RedisUtil;
import com.perfect.core.service.log.mq.ISLogMqService;
import com.perfect.mq.rabbitmq.mqenum.MQEnum;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.core.MessageProperties;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * 生产者
 *
 * @author zxh
 * @date 2019年 10月14日 21:46:52
 */
@Component
@Slf4j
public class PerfectMqProducer {

    @Autowired
    ISLogMqService service;

    /**
     * 考虑数据放到redis中，然后需要回调则考虑回调，没有就没有
     *
     * CorrelationData的id，使用redis的key
     *
     */

    @Autowired
    @Qualifier("perfect_RabbitTemplate")
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
         * 数据库保存
         */
        insertToDbService(mqSenderPojo, mqenum, messageDataJson);

        /**
         * 保存mqSenderPojo到redis，key为mqSenderPojo.getKey()
         */
        redisUtil.putToMap(PerfectConstant.REDIS_PREFIX.MQ_SEND_PREFIX, mqSenderPojo.getKey(), messageDataJson);

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
        CorrelationData correlationData = new CorrelationData(mqSenderPojo.getKey());
        rabbitTemplate.setExchange(mqenum.getExchange());
        rabbitTemplate.convertAndSend(mqenum.getExchange(), mqenum.getRouting_key(), message, correlationData);
    }

    /**
     * 建立消息队列entity_bean
     * @param mqSenderPojo
     */
    private SLogMqEntity buildEntityBean(MqSenderPojo mqSenderPojo, MQEnum mqenum, String data){
        SLogMqEntity sLogMqEntity = new SLogMqEntity();
        sLogMqEntity.setCode(mqSenderPojo.getType());
        sLogMqEntity.setName(mqSenderPojo.getName());
        sLogMqEntity.setExchange(mqenum.getExchange());
        sLogMqEntity.setRouting_key(mqenum.getRouting_key());
        sLogMqEntity.setMq_data(data);
        sLogMqEntity.setConstruct_id(mqSenderPojo.getKey());
        sLogMqEntity.setProducer_status(true);
        sLogMqEntity.setConsumer_status(false);
        return sLogMqEntity;
    }

    /**
     * 执行保存操作
     * @param mqSenderPojo
     * @param mqenum
     * @param data
     */
    private void insertToDbService (MqSenderPojo mqSenderPojo, MQEnum mqenum, String data) {
        SLogMqEntity sLogMqEntity = buildEntityBean(mqSenderPojo, mqenum, data);
        service.insert(sLogMqEntity);
    }
}
