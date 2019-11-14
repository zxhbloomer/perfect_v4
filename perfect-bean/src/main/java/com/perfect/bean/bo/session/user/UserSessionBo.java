package com.perfect.bean.bo.session.user;

import com.perfect.bean.config.base.v1.SessionBean;
import com.perfect.bean.entity.master.user.MUserEntity;
import com.perfect.bean.vo.master.user.MStaffVo;
import com.perfect.bean.vo.sys.config.tenant.STentantVo;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

/**
 * @ClassName: UserSessionBo
 * @Description: TODO
 * @Author: zxh
 * @date: 2019/11/14
 * @Version: 1.0
 */
@Data
public class UserSessionBo extends SessionBean implements Serializable {

    private static final long serialVersionUID = 4115465265205543377L;

    /**
     * 用户 信息
     */
    private MUserEntity user_info;
    /**
     * 员工 信息
     */
    private MStaffVo staff_info;
    /**
     * 租户 信息
     */
    private STentantVo tentant_info;

}
