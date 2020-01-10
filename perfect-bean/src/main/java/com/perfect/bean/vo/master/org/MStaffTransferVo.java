package com.perfect.bean.vo.master.org;

import com.perfect.bean.config.base.v1.BaseVo;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @ClassName: MStaffVo
 * @Description: 员工bean，为穿梭框服务
 * @Author: zxh
 * @date: 2020/1/10
 * @Version: 1.0
 */
@Data
@NoArgsConstructor
@ApiModel(value = "员工bean，为穿梭框服务", description = "员工bean，为穿梭框服务")
public class MStaffTransferVo extends BaseVo implements Serializable {

    private static final long serialVersionUID = -9210387507700702600L;

    /** 穿梭框 key */
    private Long key;
    /** 穿梭框 label */
    private String label;
    /**
     * 租户id
     */
    private Long tenant_id;

    /** 岗位ID */
    private Long position_id;
}
