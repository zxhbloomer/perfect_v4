package com.perfect.bean.vo.master.org;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.perfect.bean.vo.common.condition.PageCondition;
import com.perfect.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;

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
@ApiModel(value = "集团主表导出Bean", description = "集团主表导出Bean")
public class MGroupExportVo implements Serializable {

    private static final long serialVersionUID = -7466167220853981131L;

    private Long id;

    /**
     * 集团编码
     */
    @Excel(name = "集团编码")
    private String code;

    /**
     * 集团名称
     */
    @Excel(name = "集团名称")
    private String name;

    /**
     * 简称
     */
    @Excel(name = "集团简称")
    private String simple_name;

    /**
     * 描述
     */
    @Excel(name = "集团描述")
    private String descr;

    /**
     * 是否删除
     */
    @Excel(name = "是否删除")
    private Boolean is_del;

    /**
     * 租户id
     */
    private Long tentant_id;

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
     * 换页条件
     */
    private PageCondition pageCondition;
}
