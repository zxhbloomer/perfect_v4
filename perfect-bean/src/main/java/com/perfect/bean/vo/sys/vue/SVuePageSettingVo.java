package com.perfect.bean.vo.sys.vue;

import com.baomidou.mybatisplus.annotation.*;
import com.perfect.bean.vo.common.condition.PageCondition;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author zxh
 * @since 2020-04-03
 */
@Data
@EqualsAndHashCode(callSuper = false)
@ApiModel(value = "vue页面配置表", description = "资源表导出Bean")
public class SVuePageSettingVo implements Serializable {

    private static final long serialVersionUID = -7712359095709901953L;
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * vue export default 的 name
     */
    @TableField("name")
    private String name;

    /**
     * 配置vue export default  name时所使用的type
     */
    @TableField("code")
    private String code;

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

    /**
     * 换页条件
     */
    private PageCondition pageCondition;
}
