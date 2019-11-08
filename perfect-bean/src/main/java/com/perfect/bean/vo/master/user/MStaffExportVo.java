package com.perfect.bean.vo.master.user;

import com.perfect.bean.vo.common.condition.PageCondition;
import com.perfect.common.annotation.Excel;
import io.swagger.annotations.ApiModel;
import lombok.Data;
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
@ApiModel(value = "员工主表导出Bean", description = "员工主表导出Bean")
public class MStaffExportVo implements Serializable {

    private static final long serialVersionUID = 4733748930234972849L;

    private Long id;

    /**
     * 姓名
     */
    @Excel(name = "员工")
    private String name;

    /**
     * 全称拼音
     */
    @Excel(name = "员工全称拼音")
    private String name_py;

    /**
     * 简称
     */
    @Excel(name = "员工简称")
    private String simple_name;

    /**
     * 简称拼音
     */
    @Excel(name = "员工简称拼音")
    private String simple_name_py;

    /**
     * 男=1,女=2
     */
    @Excel(name = "性别")
    private String sex_text;

    /**
     * 生日
     */
    @Excel(name = "生日")
    private LocalDate birthday;

    /**
     * 邮箱地址
     */
    @Excel(name = "邮箱地址")
    private String email;

    /**
     * 家庭电话
     */
    @Excel(name = "家庭电话")
    private String home_phone;

    /**
     * 办公室电话
     */
    @Excel(name = "办公室电话")
    private String office_phone;

    /**
     * 手机号码
     */
    @Excel(name = "手机号码")
    private String mobile_phone;

    /**
     * 备用手机号码
     */
    @Excel(name = "备用手机号码")
    private String mobile_phone_backup;

    /**
     * 备用电子邮件
     */
    @Excel(name = "备用电子邮件")
    private String email_backup;

    /**
     * 身份证号码
     */
    @Excel(name = "身份证号码")
    private String id_card;

    /**
     * 护照号码
     */
    @Excel(name = "护照号码")
    private String passport;

    /**
     * 是否在职：在职=1,不在职=0,离职=2,离退休=3,返聘=4
     */
    @Excel(name = "是否在职")
    private String service_text;

    /**
     * 婚否
     */
    @Excel(name = "是否在职")
    private String is_wed_text;

    /**
     * 名族
     */
    @Excel(name = "名族")
    private String nation;

    /**
     * 学历
     */
    @Excel(name = "学历")
    private String degree_text;

    /**
     * 是否删除
     */
    private Boolean is_del;

}
