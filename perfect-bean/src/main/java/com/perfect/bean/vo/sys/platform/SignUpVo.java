package com.perfect.bean.vo.sys.platform;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @ClassName: SignUpVo
 * @Description: 注册相关的bean
 * @Author: zxh
 * @date: 2019/12/16
 * @Version: 1.0
 */
@Data
@NoArgsConstructor
@ApiModel(value = "注册相关bean", description = "注册相关bean")
public class SignUpVo implements Serializable {
    private static final long serialVersionUID = -6155075974626444433L;
    /** 手机号码 */
    private String mobile;
    /** 密码 */
    private String password;
    private String encodePassword;
    /** 租户名称 */
    private String tenant;
    /** 管理员名称 */
    private String admin;
    /** 租户id */
    private Long tenant_id;


}