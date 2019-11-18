package com.perfect.redis.listener;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.connection.Message;
import org.springframework.data.redis.listener.KeyExpirationEventMessageListener;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Component;

@Component
@Slf4j
public class RedisKeyExpirationListener extends KeyExpirationEventMessageListener {

    public RedisKeyExpirationListener(
        @Qualifier("perfect_redis_listener_container") RedisMessageListenerContainer listenerContainer) {
        super(listenerContainer);
    }

    /**
     * redis失效key事件处理
     *
     * @param message
     * @param pattern
     */
    @Override public void onMessage(Message message, byte[] pattern) {
        String expiredKey = message.toString();
        log.info("失效key:" + expiredKey + "====" + "修改完成");
    }
}