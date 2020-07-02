package com.perfect.bean.vo.master.menu;

import com.perfect.bean.vo.common.component.TreeNode;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 菜单信息
 * </p>
 *
 * @author zxh
 * @since 2020-07-01
 */
@Data
@NoArgsConstructor
@ApiModel(value = "菜单信息vo", description = "菜单信息vo")
@EqualsAndHashCode(callSuper=false)
public class MMenuDataVo extends TreeNode implements Serializable {

    private static final long serialVersionUID = 2600003769017036105L;

    private Long id;

    /**
     * 编码
     */
    private String code;

    /**
     * 菜单名称
     */
    private String name;

    /**
     * 根节点id
     */
    private Long root_id;

    /**
     * 父菜单ID
     */
    private Long parent_id;

    /**
     * 儿子个数
     */
    private Integer son_count;

//    /**
//     * 排序
//     */
//    private Integer sort;

    /**
     * 菜单类型（M目录 C菜单 F按钮）
     */
    private String type;
    private String type_name;

    /**
     * 菜单状态（0显示 1隐藏）
     */
    private Boolean visible;

    /**
     * 权限标识
     */
    private String perms;

    /**
     * 页面id
     */
    private Long page_id;

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

    private List<MFunctionInfoVo> function_info;

    /**
     * 租户id
     */
    private Long tenant_id;

    private Long c_id;

    private LocalDateTime c_time;

    private Long u_id;

    private LocalDateTime u_time;

    /**
     * 数据版本，乐观锁使用
     */
    private Integer dbversion;


}
