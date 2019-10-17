package com.perfect.framework.utils.mq;

import com.alibaba.fastjson.JSONObject;
import com.perfect.bean.pojo.mqsender.MqSenderPojo;
import com.perfect.common.utils.string.convert.Convert;
import com.perfect.framework.utils.reflection.ReflectionUtil;
import org.springframework.amqp.core.Message;

import java.nio.charset.Charset;

/**
 * @ClassName: MessageUtil
 * @Description: TODO
 * @Author: zxh
 * @date: 2019/10/17
 * @Version: 1.0
 */
public class MessageUtil {

    /**
     * 获取mqSenderPojo bean
     * @param messageDataObject
     * @return
     */
    public static MqSenderPojo getMessageBodyBean(Message messageDataObject){
        String messageData = Convert.str(messageDataObject.getBody(), (Charset)null);
        MqSenderPojo mqSenderPojo = JSONObject.parseObject(messageData, MqSenderPojo.class);
        return mqSenderPojo;
    }

    /**
     * 获取 mqSenderPojo.MqMessagePojo 消息体
     * @param messageDataObject
     * @return
     */
    public static Object getMessageContextBean(Message messageDataObject){
        String messageData = Convert.str(messageDataObject.getBody(), (Charset)null);
        MqSenderPojo mqSenderPojo = JSONObject.parseObject(messageData, MqSenderPojo.class);
        Object messageContext = ReflectionUtil.getClassBean(mqSenderPojo.getMqMessagePojo().getMessageBeanClass(), mqSenderPojo.getMqMessagePojo().getParameterJson());

        return messageContext;
    }


}
