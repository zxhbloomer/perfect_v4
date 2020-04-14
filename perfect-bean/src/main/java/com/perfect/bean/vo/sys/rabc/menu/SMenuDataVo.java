package com.perfect.bean.vo.sys.rabc.menu;

import com.perfect.bean.vo.common.component.TreeNode;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 菜单数据信息
 * </p>
 *
 * @author zxh
 * @since 2019-11-01
 */
@Data
@NoArgsConstructor
@ApiModel(value = "菜单数据信息", description = "菜单数据信息")
@EqualsAndHashCode(callSuper=false)
public class SMenuDataVo extends TreeNode implements Serializable {

    private static final long serialVersionUID = -8144262156342458120L;

    private Long id;

    /**
     * 菜单编号
     */
    private String code;

    /**
     * 菜单名称
     */
    private String name;

    /**
     * 根节点ID
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

    private String parent_depth_id;
    public List<Long> getParent_depth_id(){
        List<Long> rtn = new ArrayList<>();
        if(parent_depth_id == null){
            return null;
        }
        String[] split = parent_depth_id.split(",");
        for (int i = 0; i < split.length; i++) {
            rtn.add(Long.valueOf(split[i]));
        }
        return rtn;
    }


    private String depth_name;
    private String depth_id;
    public List<Long> getDepth_id(){
        List<Long> rtn = new ArrayList<>();
        if(depth_id == null){
            return null;
        }
        String[] split = depth_id.split(",");
        for (int i = 0; i < split.length; i++) {
            rtn.add(Long.valueOf(split[i]));
        }
        return rtn;
    }

//    public List<Long> getDepth_id(){
//        List<Long> rtn = new ArrayList<>();
//        String[] split = depth_id.split(",");
//        for (int i = 0; i < split.length; i++) {
//            rtn.add(Long.valueOf(split[i]));
//        }
//        return rtn;
//    }

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
     * 模块id
     */
    private String module_id;

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

    private List<SModuleInfoVo> module_info;

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
