package com.perfect.bean.bo.sys;

import lombok.Data;

/**
 * @ClassName: SysInfoBo
 * @Description: 系统的关键参数
 * @Author: zxh
 * @date: 2019/12/5
 * @Version: 1.0
 */
@Data
public class SysInfoBo {
    /** 开发者模式，可以跳过验证码 */
    private Boolean developModel;
}
