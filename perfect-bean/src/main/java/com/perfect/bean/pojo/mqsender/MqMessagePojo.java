package com.perfect.bean.pojo.mqsender;

import lombok.Builder;
import lombok.Data;

/**
 * @ClassName: MqMessagePojo
 * @Description: mq的消息体
 * @Author: zxh
 * @date: 2019/10/16
 * @Version: 1.0
 */
@Data
@Builder
public class MqMessagePojo {

    /**
     * messagebean类
     */
    private String messageBeanClass;

    /**
     * message内容：json
     */
    private String parameterJson;
}
