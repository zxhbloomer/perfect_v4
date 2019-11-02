package com.perfect.bean.vo.sys.rabc.menu;

import com.baomidou.mybatisplus.annotation.TableField;
import com.perfect.bean.vo.common.component.TreeNode;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

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
public class SMenuVo extends TreeNode implements Serializable {

    private static final long serialVersionUID = -8144262156342458120L;

    private Long id;

    /**
     * 菜单组编号
     */
    @TableField("menu_group_code")
    private String menu_group_code;

    /**
     * 菜单组名称
     */
    @TableField("menu_group_name")
    private String menu_group_name;

    /**
     * 菜单名称
     */
    private String name;

    /**
     * 父菜单ID
     */
    private Long parent_id;

    private String depth_name;

    /**
     * 菜单类型（M目录 C菜单 F按钮）
     */
    private String type;
    private String type_name;

    /**
     * 级联
     */
    private Long value;
    private String label;

    /**
     * 菜单状态（0显示 1隐藏）
     */
    private Boolean visible;

    /**
     * 权限标识
     */
    private String perms;

    /**
     * 请求地址
     */
    private String path;

    /**
     * 路由名，需要唯一，很重要，且需要vue这里手工录入
     */
    private String route_name;

    /**
     * 菜单名
     */
    private String meta_title;

    /**
     * 菜单icon
     */
    private String meta_icon;

    /**
     * 模块
     */
    private String component;

    /**
     * 附在导航栏不可关闭
     */
    private Boolean affix;

    /**
     * 描述
     */
    private String descr;

    /**
     * 租户id
     */
    private Long tentant_id;

    private Long c_id;

    private LocalDateTime c_time;

    private Long u_id;

    private LocalDateTime u_time;

    /**
     * 数据版本，乐观锁使用
     */
    private Integer dbversion;
}
