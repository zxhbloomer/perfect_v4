package com.perfect.bean.entity.client.user;

import com.baomidou.mybatisplus.annotation.*;
import com.perfect.bean.entity.base.entity.v1.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 用户主表
 * </p>
 *
 * @author zxh
 * @since 2019-07-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("m_user")
public class MUserEntity extends BaseEntity<MUserEntity> implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField("login_name")
    private String login_name;

    /**
     * 用户实名
     */
    @TableField("name")
    private String name;

    /**
     * 简称
     */
    @TableField("simple_name")
    private String simple_name;

    /**
     * 系统用户=10,职员=20,客户=30,供应商=40,其他=50,认证管理员=60,审计管理员=70
     */
    @TableField("type")
    private String type;

    /**
     * 描述
     */
    @TableField("descr")
    private String descr;

    /**
     * 密码

     */
    @TableField("pwd")
    private String pwd;

    /**
     * 是否是已经删除

     */
    @TableField("is_del")
    private Boolean is_del;

    /**
     * 是否锁定

     */
    @TableField("is_lock")
    private Boolean is_lock;

    /**
     * 是否禁用

     */
    @TableField("is_enable")
    private Boolean is_enable;

    /**
     * 生效时间

     */
    @TableField("effective_date")
    private LocalDateTime effective_date;

    /**
     * 失效时间

     */
    @TableField("invalidation_date")
    private LocalDateTime invalidation_date;

    /**
     * 登录错误次数

     */
    @TableField("err_count")
    private Integer err_count;

    /**
     * 所属用户组
     用户组织范围
     包含下级组织的组织范围

     */
    @TableField("group_id")
    private String group_id;

    @TableField("staff_id")
    private Long staff_id;

    /**
     * 密码生效日期

     */
    @TableField("pwd_effective_date")
    private LocalDateTime pwd_effective_date;

    /**
     * 用户锁定时间
     */
    @TableField("locked_time")
    private LocalDateTime locked_time;

    /**
     * 是否为业务管理员
     */
    @TableField("is_biz_admin")
    private Boolean is_biz_admin;

    /**
     * 是否修改过密码
     */
    @TableField("is_changed_pwd")
    private Boolean is_changed_pwd;

    /**
     * 传统认证方式=0,智能钥匙认证=1,动态密码锁=2,指纹认证方式=3
     */
    @TableField("login_author_way")
    private Boolean login_author_way;

    /**
     * 历史密码
     */
    @TableField("pwd_his_pwd")
    private String pwd_his_pwd;

    @TableField("email")
    private String email;

    /**
     * 家庭电话
     */
    @TableField("home_telno")
    private String home_telno;

    /**
     * 办公室电话
     */
    @TableField("office_telno")
    private String office_telno;

    /**
     * 手机号码
     */
    @TableField("cell_telno")
    private String cell_telno;

    /**
     * 租户代码
     */
    @TableField("corp_code")
    private String corp_code;

    /**
     * 租户名称
     */
    @TableField("corp_name")
    private String corp_name;

    /**
     * 性别
     */
    @TableField("sex")
    private Boolean sex;

    /**
     * 头像路径
     */
    @TableField("avatar")
    private String avatar;

    /**
     * 最后登陆时间
     */
    @TableField("last_login_date")
    private LocalDateTime last_login_date;

    @TableField(value="c_id", fill = FieldFill.INSERT)
    private Long c_id;

    @TableField(value="c_time", fill = FieldFill.INSERT)
    private LocalDateTime c_time;

    @TableField(value="u_id", fill = FieldFill.INSERT_UPDATE)
    private Long u_id;

    @Version
    @TableField(value="u_time", fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime u_time;

    /**
     * 数据版本，乐观锁使用
     */
    @Version
    @TableField(value="dbversion", fill = FieldFill.INSERT_UPDATE)
    private Integer dbversion;
}
