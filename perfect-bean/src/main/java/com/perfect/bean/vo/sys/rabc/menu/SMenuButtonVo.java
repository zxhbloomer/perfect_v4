package com.perfect.bean.vo.sys.rabc.menu;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 菜单按钮数据信息
 * </p>
 *
 * @author zxh
 * @since 2019-11-01
 */
@Data
@NoArgsConstructor
@ApiModel(value = "菜单按钮数据信息", description = "菜单按钮数据信息")
@EqualsAndHashCode(callSuper=false)
public class SMenuButtonVo implements Serializable {

    private static final long serialVersionUID = 800106008084499143L;

    /**
     * 按钮编号
     */
    private String code;

    /**
     * 按钮名称
     */
    private String name;

    /**
     * 按钮分组
     */
    private String button_group;

    /**
     * 按钮分组名
     */
    private String button_group_name;

    /**
     * 字典排序
     */
    private Integer sort;

}
