package com.perfect.bean.vo.sys.rabc.menu;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 模块按钮信息
 * </p>
 *
 * @author zxh
 * @since 2019-11-01
 */
@Data
@NoArgsConstructor
@ApiModel(value = "模块按钮信息", description = "模块按钮信息")
@EqualsAndHashCode(callSuper=false)
public class SModuleInfoVo implements Serializable {

    private static final long serialVersionUID = -2575013529361794418L;

    private Long id;

    /**
     * 按钮编号：字典表过来
     */
    private String code;

    /**
     * 按钮名称
     */
    private String name;

    /**
     * 权限标识
     */
    private String perms;
}
