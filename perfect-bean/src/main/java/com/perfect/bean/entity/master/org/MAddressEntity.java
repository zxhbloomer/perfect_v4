package com.perfect.bean.entity.master.org;

import com.baomidou.mybatisplus.annotation.*;

import java.time.LocalDateTime;
import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 地址簿
 * </p>
 *
 * @author zxh
 * @since 2019-10-30
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("m_address")
public class MAddressEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId("id")
    private Long id;

    /**
     * 邮编
     */
    @TableField("postal_code")
    private String postal_code;

    /**
     * 省
     */
    @TableField("province_code")
    private Integer province_code;

    /**
     * 市
     */
    @TableField("city_code")
    private Integer city_code;

    /**
     * 区
     */
    @TableField("area_code")
    private Integer area_code;

    /**
     * 详细地址
     */
    @TableField("detail_address")
    private String detail_address;

    /**
     * 是否删除
     */
    @TableField("is_del")
    private Boolean is_del;

    /**
     * 租户id
     */
    @TableField("tentant_id")
    private Long tentant_id;

    @TableField(value="c_id", fill = FieldFill.INSERT)
    private Long c_id;

    @TableField(value="c_time", fill = FieldFill.INSERT)
    private LocalDateTime c_time;

    @TableField(value="u_id", fill = FieldFill.INSERT_UPDATE)
    private Long u_id;

    @TableField(value="u_time", fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime u_time;

    /**
     * 数据版本，乐观锁使用
     */
    @Version
    @TableField(value="dbversion", fill = FieldFill.INSERT_UPDATE)
    private Integer dbversion;


}
