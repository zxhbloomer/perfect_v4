package com.perfect.bean.pojo.redis.user;

import com.perfect.bean.entity.master.user.MStaffEntity;
import com.perfect.bean.entity.master.user.MUserEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserInSessionPojo implements Serializable {

    private static final long serialVersionUID = -5257629364895826626L;

    // 用户 信息
    private MUserEntity user_info;
    // 员工 信息
    private MStaffEntity staff_info;

}
