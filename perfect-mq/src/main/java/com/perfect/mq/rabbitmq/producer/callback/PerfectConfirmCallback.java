package com.perfect.mq.rabbitmq.producer.callback;

import com.perfect.common.constant.PerfectConstant;
import com.perfect.common.utils.redis.RedisUtil;
import com.perfect.core.service.log.mq.ISLogMqService;
import com.perfect.mq.rabbitmq.callback.config.DefaultConfirmCallback;
import com.perfect.mq.rabbitmq.callback.config.IConfirmCallback;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.connection.CorrelationData;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 请求交换机接口实现
 */
@Slf4j
@Configuration
public class PerfectConfirmCallback implements IConfirmCallback {

    @Autowired
    ISLogMqService service;

    /**
     * 考虑数据放到redis中，然后需要回调则考虑回调，没有就没有
     *
     * CorrelationData的id，使用redis的key
     *
     */
    @Autowired
    private RedisUtil redisUtil;

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
     * 覆盖默认确认回调接口实现
     *
     * @return PerfectConfirmCallback
     */
    @Bean
    public IConfirmCallback iConfirmCallback() {
        return new PerfectConfirmCallback();
    }
}
