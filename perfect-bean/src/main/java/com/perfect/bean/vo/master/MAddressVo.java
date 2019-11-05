package com.perfect.bean.vo.master;

import com.baomidou.mybatisplus.annotation.*;
import com.perfect.bean.vo.common.condition.PageCondition;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 地址簿
 * </p>
 *
 * @author zxh
 * @since 2019-10-30
 */
@Data
@NoArgsConstructor
@ApiModel(value = "地址簿", description = "地址簿")
public class MAddressVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    /**
     * 邮编
     */
    private String postal_code;

    /**
     * 联系人
     */
    private String link_man;

    /**
     * 电话
     */
    private String phone;

    /**
     * 默认
     */
    private Boolean is_default;

    /**
     * 标签
     */
    private String tag;

    /**
     * 省
     */
    private Integer province_code;
    private String province_name;

    /**
     * 市
     */
    private Integer city_code;
    private String city_name;

    /**
     * 区
     */
    private Integer area_code;
    private String area_name;

    /**
     * 详细地址
     */
    private String detail_address;

    /**
     * 关联单号
     */
    private String serial_no;

    /**
     * 关联单号类型
     */
    private String serial_type;

    /**
     * 是否删除
     */
    private Boolean is_del;

    /**
     * 租户id
     */
    private Long tentant_id;

    private Long c_id;


    private Long u_id;

    private LocalDateTime u_time;

    /**
     * 数据版本，乐观锁使用
     */
    private Integer dbversion;

    /**
     * 换页条件
     */
    private PageCondition pageCondition;
}
