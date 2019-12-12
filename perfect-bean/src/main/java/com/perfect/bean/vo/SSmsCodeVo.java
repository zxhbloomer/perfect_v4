package com.perfect.bean.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 短信验证码
 * </p>
 *
 * @author zxh
 * @since 2019-12-09
 */
@Data
public class SSmsCodeVo implements Serializable {

    private static final long serialVersionUID = -3343310432986309357L;

    private String mobile;

    private String sms_code;

}
