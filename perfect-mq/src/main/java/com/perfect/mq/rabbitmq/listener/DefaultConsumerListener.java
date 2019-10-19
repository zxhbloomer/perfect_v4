package com.perfect.mq.rabbitmq.listener;

import com.alibaba.fastjson.JSONObject;
import com.rabbitmq.client.Channel;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.core.Message;

import java.util.Optional;

/**
 * 默认消费者监听器
 */
@Slf4j
public class DefaultConsumerListener implements IChannelAwareMessageListener {

    @Override
    public void onMessage(Message message, Channel channel) throws Exception {
        try {
            Optional<String> opl = JSONObject.parseObject(message.getBody(), String.class);
            log.info("[MQ服务] 接收消息:{}", opl.orElse(""));
            channel.basicAck(message.getMessageProperties().getDeliveryTag(), false);
        } catch (Exception e) {
            channel.basicNack(message.getMessageProperties().getDeliveryTag(), false, false);
        }
    }
}
