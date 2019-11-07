package com.perfect.bean.vo.master.user;

import com.baomidou.mybatisplus.annotation.*;
import com.perfect.bean.entity.base.entity.v1.BaseEntity;
import com.perfect.bean.vo.common.condition.PageCondition;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * <p>
 * 员工
 * </p>
 *
 * @author zxh
 * @since 2019-07-13
 */
@Data
@NoArgsConstructor
@ApiModel(value = "员工主表", description = "员工主表")
public class MStaffVo implements Serializable {

    private static final long serialVersionUID = 1245522329833935707L;

    private Long id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 全称拼音
     */
    private String name_py;

    /**
     * 简称
     */
    private String simple_name;

    /**
     * 简称拼音
     */
    private String simple_name_py;

    /**
     * 登陆用户id，关联id
     */
    private Long userid;

    /**
     * 男=1,女=2
     */
    private String sex;
    private String sex_text;

    /**
     * 生日
     */
    private LocalDate birthday;

    /**
     * 邮箱地址
     */
    private String email;

    /**
     * 审核状态:未审核=0,已审核=1
     */
    private Boolean state;

    /**
     * 家庭电话
     */
    private String home_phone;

    /**
     * 办公室电话
     */
    private String office_phone;

    /**
     * 手机号码
     */
    private String mobile_phone;

    /**
     * 备用手机号码
     */
    private String mobile_phone_backup;

    /**
     * 备用电子邮件
     */
    private String email_backup;

    /**
     * 身份证号码
     */
    private String id_card;

    /**
     * 护照号码
     */
    private String passport;

    /**
     * 是否在职：在职=1,不在职=0,离职=2,离退休=3,返聘=4
     */
    private String service;

    /**
     * 婚否
     */
    private Boolean is_wed;

    /**
     * 名族
     */
    private String nation;

    /**
     * 学历
     */
    private String degree;

    /**
     * 是否删除
     */
    private Boolean is_del;

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

    /**
     * 换页条件
     */
    private PageCondition pageCondition;
}
