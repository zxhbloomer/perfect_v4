package com.perfect.bean.vo.sys.rabc.menu;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 菜单信息
 * </p>
 *
 * @author zxh
 * @since 2019-11-01
 */
@Data
@NoArgsConstructor
@ApiModel(value = "菜单信息", description = "菜单信息")
@EqualsAndHashCode(callSuper=false)
public class SMenuVo implements Serializable {

    private static final long serialVersionUID = 2656744540402515370L;

    /**
     * 树菜单信息
     */
    List<SMenuDataVo> menu_data;

    /**
     * 按钮清单
     */
    List<SMenuButtonVo> menu_buttons;
}
