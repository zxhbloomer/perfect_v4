package com.perfect.bean.entity.sys.rabc.menu;

import com.baomidou.mybatisplus.annotation.*;

import java.time.LocalDateTime;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 菜单信息
 * </p>
 *
 * @author zxh
 * @since 2019-11-01
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("s_menu")
public class SMenuEntity implements Serializable {

    private static final long serialVersionUID = -56884437517276757L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 菜单编号
     */
    @TableField("code")
    private String code;

    /**
     * 菜单名称
     */
    @TableField("name")
    private String name;


    /**
     * 根节点ID
     */
    @TableField("root_id")
    private Long root_id;

    /**
     * 父菜单ID
     */
    @TableField("parent_id")
    private Long parent_id;

    /**
     * 儿子个数
     */
    @TableField("son_count")
    private Integer son_count;

    /**
     * 排序
     */
    @TableField("sort")
    private Integer sort;

    /**
     * 菜单类型（M目录 C菜单 F按钮）
     */
    @TableField("type")
    private String type;

    /**
     * 菜单状态（0显示 1隐藏）
     */
    @TableField("visible")
    private Boolean visible;

    /**
     * 权限标识
     */
    @TableField("perms")
    private String perms;

    /**
     * 模块id
     */
    @TableField("module_id")
    private String module_id;

    /**
     * 请求地址
     */
    @TableField("path")
    private String path;

    /**
     * 路由名，需要唯一，很重要，且需要vue这里手工录入
     */
    @TableField("route_name")
    private String route_name;

    /**
     * 菜单名
     */
    @TableField("meta_title")
    private String meta_title;

    /**
     * 菜单icon
     */
    @TableField("meta_icon")
    private String meta_icon;

    /**
     * 模块
     */
    @TableField("component")
    private String component;

    /**
     * 附在导航栏不可关闭
     */
    @TableField("affix")
    private Boolean affix;

    /**
     * 描述
     */
    @TableField("descr")
    private String descr;

    /**
     * 租户id
     */
    @TableField("tentant_id")
    private Long tentant_id;

    @TableField(value="c_id", fill = FieldFill.INSERT)
    private Long c_id;

    @TableField(value="c_time", fill = FieldFill.INSERT)
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


}
