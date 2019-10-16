package com.perfect.mq.rabbitmq.callback.manager.config.tentant;

import java.util.List;

/**
 * @ClassName: TentantMqCallbackInterface
 * @Description: 回调接口
 * @Author: zxh
 * @date: 2019/10/16
 * @Version: 1.0
 */
public interface TentantMqCallbackInterface {
    /**
     * 实现回调的内容
     * @param parameterClass
     * @param parameter
     */
    void mqCallBackTestFunction(String parameterClass , String parameter);


    void mqCallBackTestFunction(List<String> callbackBean);
}
