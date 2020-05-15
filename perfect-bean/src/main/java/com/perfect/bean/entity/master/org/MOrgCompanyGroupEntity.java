package com.perfect.bean.entity.master.org;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 部门与企业关系表
 * </p>
 *
 * @author zxh
 * @since 2020-05-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("m_org_company_group")
public class MOrgCompanyGroupEntity implements Serializable {

    private static final long serialVersionUID = 7172311837544110876L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 部门id
     */
    @TableField("current_id")
    private Long current_id;

    /**
     * 所属企业id
     */
    @TableField("parent_id")
    private Long parent_id;

    /**
     * 租户id
     */
    @TableField("tenant_id")
    private Long tenant_id;

    @TableField(value="c_id", fill = FieldFill.INSERT, updateStrategy = FieldStrategy.NOT_EMPTY)
    private Long c_id;

    @TableField(value="c_time", fill = FieldFill.INSERT, updateStrategy = FieldStrategy.NOT_EMPTY)
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
