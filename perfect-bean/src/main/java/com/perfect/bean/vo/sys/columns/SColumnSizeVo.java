package com.perfect.bean.vo.sys.columns;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

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
@NoArgsConstructor
@ApiModel(value = "表格列宽vo", description = "表格列宽vo")
@EqualsAndHashCode(callSuper=false)
public class SColumnSizeVo implements Serializable {

    private static final long serialVersionUID = 5189684771582598858L;

    private Long id;

    /**
     * 配置vue export default  name时所使用的type：constants_program.P_VUE_SETTING
     */
    private String page_code;

    /**
     * 页面id
     */
    private Long page_id;

    /**
     * 类型：基本上页面只有一个table，如果出现两个table则需要区分
     */
    private String type;

    /**
     * 员工id
     */
    private Long staff_id;

    /**
     * table的column的属性
     */
    @TableField("column_property")
    private String column_property;

    /**
     * 列宽
     */
    @TableField("size")
    private Integer size;

}
