package com.perfect.bean.vo.master.user;

import com.baomidou.mybatisplus.annotation.*;
import com.perfect.bean.entity.base.entity.v1.BaseEntity;
import com.perfect.bean.entity.master.user.MUserEntity;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

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
@NoArgsConstructor
@ApiModel(value = "员工主表", description = "员工主表")
public class MUserVo  implements Serializable {

    private static final long serialVersionUID = -6225833382087802641L;

    private Long id;

    /**
     * 登录用户名
     */
    private String login_name;

    /**
     * 系统用户=10,职员=20,客户=30,供应商=40,其他=50,认证管理员=60,审计管理员=70
     */
    private String type;
    private String type_text;

    /**
     * 自我介绍
     */
    private String introduction;

    /**
     * 密码

     */
    private String pwd;

    /**
     * 是否锁定

     */
    private Boolean is_lock;

    /**
     * 是否禁用

     */
    private Boolean is_enable;

    /**
     * 生效时间

     */
    private LocalDateTime effective_date;

    /**
     * 失效时间

     */
    private LocalDateTime invalidation_date;

    /**
     * 登录错误次数

     */
    private Integer err_count;

    /**
     * 所属用户组
     用户组织范围
     包含下级组织的组织范围

     */
    private String group_id;

    private Long staff_id;

    /**
     * 用户锁定时间
     */
    private LocalDateTime locked_time;

    /**
     * 是否为业务管理员
     */
    private Boolean is_biz_admin;

    /**
     * 是否修改过密码
     */
    private Boolean is_changed_pwd;

    /**
     * 传统认证方式=0,智能钥匙认证=1,动态密码锁=2,指纹认证方式=3
     */
    private Boolean login_author_way;

    /**
     * 历史密码
     */
    private String pwd_his_pwd;

    /**
     * 头像路径
     */
    private String avatar;

    /**
     * 最后登录时间
     */
    private LocalDateTime last_login_date;

    /**
     * 是否删除
     */
    private Boolean is_del;

    private Long c_id;

    private LocalDateTime c_time;

    private Long u_id;

    private LocalDateTime u_time;

    /**
     * 数据版本，乐观锁使用
     */
    private Integer dbversion;
}
