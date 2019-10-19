package com.perfect.mq.rabbitmq.producer.callback;

import com.alibaba.fastjson.JSONObject;
import com.perfect.bean.pojo.mqsender.MqSenderPojo;
import com.perfect.common.constant.PerfectConstant;
import com.perfect.common.utils.redis.RedisUtil;
import com.perfect.common.utils.string.convert.Convert;
import com.perfect.mq.rabbitmq.callback.config.DefaultReutrnedCallback;
import com.perfect.mq.rabbitmq.callback.config.IReutrnedCallback;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.nio.charset.Charset;

/**
 * 默认交换机请求队列失败回调接口实现
 */
@Slf4j
@Configuration
public class PerfectReutrnedCallback implements IReutrnedCallback {

    @Autowired
    private RedisUtil redisUtil;

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

    /**
     * 覆盖默认失败回调接口实现
     *
     * @return PerfectReutrnedCallback
     */
    @Bean
    public IReutrnedCallback iReutrnedCallback() {
        return new PerfectReutrnedCallback();
    }
}
