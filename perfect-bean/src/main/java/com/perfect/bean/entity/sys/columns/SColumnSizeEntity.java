package com.perfect.bean.entity.sys.columns;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 表格列宽
 * </p>
 *
 * @author zxh
 * @since 2020-06-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("s_column_size")
public class SColumnSizeEntity implements Serializable {

    private static final long serialVersionUID = 4111530048491353414L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 配置vue export default  name时所使用的type：constants_program.P_VUE_SETTING
     */
    @TableField("page_code")
    private String page_code;

    /**
     * 页面id
     */
    @TableField("page_id")
    private Long page_id;

    /**
     * 类型：基本上页面只有一个table，如果出现两个table则需要区分
     */
    @TableField("type")
    private String type;

    /**
     * 员工id
     */
    @TableField("staff_id")
    private Long staff_id;

    /**
     * 列宽
     */
    @TableField("size")
    private Integer size;

    /**
     * table的column的顺序id
     */
    @TableField("column_sort_id")
    private Integer column_sort_id;

}
