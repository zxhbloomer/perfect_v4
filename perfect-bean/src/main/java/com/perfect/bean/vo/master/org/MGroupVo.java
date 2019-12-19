package com.perfect.bean.vo.master.org;

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
 * 集团主表
 * </p>
 *
 * @author zxh
 * @since 2019-10-30
 */
@Data
@NoArgsConstructor
@ApiModel(value = "集团主表", description = "集团主表")
public class MGroupVo implements Serializable {

    private static final long serialVersionUID = -7466167220853981131L;

    private Long id;

    /**
     * 集团编码
     */
    private String code;

    /**
     * 集团名称
     */
    private String name;

    /**
     * 简称
     */
    private String simple_name;

    /**
     * 描述
     */
    private String descr;

    /**
     * 是否删除
     */
    private Boolean is_del;

    /**
     * 租户id
     */
    private Long tenant_id;

    private Long c_id;

    private LocalDateTime c_time;

    private Long u_id;

    @TableField(value="u_time", fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime u_time;

    /**
     * 数据版本，乐观锁使用
     */
    private Integer dbversion;

    /**
     * 关联单号
     */
    private Long parent_serial_id;

    /**
     * 关联单号类型
     */
    private String parent_serial_type;
    private String parent_name;
    private String parent_simple_name;
    private String parent_type_text;

    /**
     * 换页条件
     */
    private PageCondition pageCondition;
}
