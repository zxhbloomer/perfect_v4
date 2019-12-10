package com.perfect.manager.controller.code.sms;

import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.SSmsCodeVo;
import com.perfect.common.annotation.Limit;
import com.perfect.common.annotation.RepeatSubmit;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.constant.PerfectConstant;
import com.perfect.framework.base.controller.v1.BaseController;
import com.perfect.security.code.ValidateCode;
import com.perfect.security.code.ValidateCodeGenerator;
import com.perfect.security.code.img.ImageCode;
import com.perfect.security.code.sms.SmsCodeSender;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.social.connect.web.HttpSessionSessionStrategy;
import org.springframework.social.connect.web.SessionStrategy;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.ServletWebRequest;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * 短信验证码
 *
 * @author
 */
@RestController
@RequestMapping("/api/v1")
@Slf4j
@Api("短信验证码")
public class SysSmsCodeController extends BaseController {

    private SessionStrategy sessionStrategy = new HttpSessionSessionStrategy();

    @Autowired
    private ValidateCodeGenerator smsCodeGenerator;

    @Autowired
    private SmsCodeSender smsCodeSender;

    /**
     * 测试限流注解，下面配置说明该接口 60秒内最多只能访问 10次，保存到 redis的键名为 limit_test，
     * 即 prefix + "_" + key，也可以根据 IP 来限流，需指定 limitType = LimitType.IP
     */
    @SysLog("短信发送")
    @ApiOperation("短信发送")
    @Limit(key = "smscode", period = 60, count = 5, name = "短信验证码", prefix = "limit")
    @PostMapping("/sms/code")
    @ResponseBody
    @RepeatSubmit
    public ResponseEntity<JsonResult<String>> createSmsCode(HttpServletRequest request, HttpServletResponse response,
            @RequestBody SSmsCodeVo mobileBean)
        throws Exception {
        ValidateCode smsCode = smsCodeGenerator.createCode();
        sessionStrategy.setAttribute(new ServletWebRequest(request), PerfectConstant.SESSION_KEY_SMS_CODE + mobileBean.getMobile(), smsCode);
        // 发送短信
        smsCodeSender.sendCode(mobileBean.getMobile(), smsCode.getCode(), PerfectConstant.SMS_CODE_TYPE.SMS_CODE_TYPE_REGIST);
        return ResponseEntity.ok().body(ResultUtil.OK("OK"));
    }
}