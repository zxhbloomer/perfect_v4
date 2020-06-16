package com.perfect.bean.vo.sys.pages;

import com.perfect.bean.vo.common.condition.PageCondition;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 页面按钮表
 * </p>
 *
 * @author zxh
 * @since 2020-06-04
 */
@Data
@NoArgsConstructor
@ApiModel(value = "页面按钮表vo", description = "页面按钮表vo")
@EqualsAndHashCode(callSuper=false)
public class SPagesFunctionVo implements Serializable {

    private static final long serialVersionUID = 6408649934054725183L;

    private Long id;

    /**
     * 类型：PAGE：主页面上，TABLE：表格上，POPUP：弹出框上
     */
    private String type;

    /**
     * 按钮编号：字典表过来
     */
    private String code;

    /**
     * 按钮名称
     */
    private String name;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 权限标识
     */
    private String perms;

    /**
     * 描述
     */
    private String descr;

    /**
     * 页面id，
     */
    private Long page_id;

    private Long c_id;

    private LocalDateTime c_time;

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
