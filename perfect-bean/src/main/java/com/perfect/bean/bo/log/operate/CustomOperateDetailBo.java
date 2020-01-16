package com.perfect.bean.bo.log.operate;

import com.perfect.common.enums.OperationEnum;
import lombok.Data;

import java.util.Collection;

/**
 * @ClassName: CustomOperateDetailBo
 * @Description: TODO
 * @Author: zxh
 * @date: 2020/1/16
 * @Version: 1.0
 */
@Data
public class CustomOperateDetailBo<T> {

    /** 业务名 */
    private String name;

    /** 业务名 */
    private OperationEnum type;

    /** 业务操作描述 */
    private String oper_info;

    /** 旧值 */
    private T oldData;

    /** 新值 */
    private T newData;

}
