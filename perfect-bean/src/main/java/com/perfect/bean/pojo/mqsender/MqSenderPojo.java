package com.perfect.bean.pojo.mqsender;

import com.perfect.bean.pojo.reflection.CallInfoReflectionPojo;
import lombok.Builder;
import lombok.Data;

/**
 * @ClassName: MqSenderPojo
 * @Description: 消息队列pojo
 * @Author: zxh
 * @date: 2019/10/16
 * @Version: 1.0
 */
@Data
@Builder
public class MqSenderPojo {

    /**
     * 消息队列主键
     */
    private String key;

    /**
     * 类型
     */
    private String type;

    private String name;

    /**
     * 状态：-1（失败），0（成功）,1（已发送）
     */
    private String status;

    /**
     * 消息体
     */
    private MqMessagePojo mqMessagePojo;

    /**
     * 回调
     */
    private CallInfoReflectionPojo callBackInfo;
}
