package com.perfect.bean.pojo.result;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;

/**
 * @author zxh
 *
 */
@Data
@Builder
@AllArgsConstructor
public class JsonResult<T> implements Serializable {

    private static final long serialVersionUID = -3548881362738874861L;

    private String timestamp;
    /** 返回状态: http status */
    private Integer http_status;
    /** 返回消息：返回的code */
    private int code;
    /** 返回消息：返回的消息 */
    private String message;
    /** 调用路径：路径 */
    private String path;
    /** 调用方法：post，get */
    private String method;
    /** 是否成功[true:成功;false:失败]，默认失败 */
    private boolean success;
    /** json 导出是否把null也输出*/
    @Builder.Default
    private boolean json_null_out = true;
    /** 返回数据，如果类型是数组且为null，返回[] */
    private T data;
}
