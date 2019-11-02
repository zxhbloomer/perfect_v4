package com.perfect.bean.entity.sys.config.module;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 模块按钮信息
 * </p>
 *
 * @author zxh
 * @since 2019-11-02
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("s_module_button")
public class SModuleButtonEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 按钮编号
     */
    @TableField("code")
    private String code;

    /**
     * 按钮名称
     */
    @TableField("name")
    private String name;

    /**
     * 排序
     */
    @TableField("sort")
    private Integer sort;

    /**
     * 权限标识
     */
    @TableField("perms")
    private String perms;

    /**
     * 页面id，
     */
    @TableField("parent_id")
    private Long parent_id;

    @TableField("c_id")
    private Long c_id;

    @TableField("c_time")
    private LocalDateTime c_time;

    @TableField("u_id")
    private Long u_id;

    @TableField("u_time")
    private LocalDateTime u_time;

    /**
     * 数据版本，乐观锁使用
     */
    @TableField("dbversion")
    private Integer dbversion;


}
