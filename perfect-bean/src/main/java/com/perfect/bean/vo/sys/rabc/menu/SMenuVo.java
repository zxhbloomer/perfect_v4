package com.perfect.bean.vo.sys.rabc.menu;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

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
public class SMenuVo implements Serializable {

    private static final long serialVersionUID = -8144262156342458120L;

    private Long id;

    /**
     * 菜单名称
     */
    private String name;

    /**
     * 父菜单ID
     */
    private Long parent_id;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 菜单类型（M目录 C菜单 F按钮）
     */
    private String type;

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
