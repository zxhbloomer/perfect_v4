package com.perfect.security.handler;

import com.alibaba.fastjson.JSON;
import com.perfect.bean.bo.session.user.UserSessionBo;
import com.perfect.bean.bo.sys.SysInfoBo;
import com.perfect.bean.pojo.redis.user.UserInSessionPojo;
import com.perfect.bean.result.utils.v1.ResponseResultUtil;
import com.perfect.common.constant.PerfectConstant;
import com.perfect.common.utils.redis.RedisUtil;
import com.perfect.common.utils.servlet.ServletUtil;
import com.perfect.core.service.client.user.IMUserService;
import com.perfect.core.utils.security.SecurityUtil;
import com.perfect.security.properties.PerfectSecurityProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 登录成功处理器
 */
public class PerfectAuthenticationSucessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private IMUserService iMUserService;

    @Autowired
    private RedisUtil redisUtil;

    private SessionRegistry sessionRegistry;

    @Autowired
    private PerfectSecurityProperties perfectSecurityProperties;

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws IOException {
        // 设置返回值
//        WebAuthenticationDetails details = (WebAuthenticationDetails) authentication.getDetails();

        response.setContentType(PerfectConstant.JSON_UTF8);
//        response.getWriter().write(mapper.writeValueAsString(ResponseBo.ok()));
        Map<String,String> token = new HashMap<String,String>();
        token.put("token",getSessionId(authentication, request.getSession().getId()));

        // 处理缓存
        setUserSession(SecurityUtil.getLoginUser_id());

        ResponseResultUtil.responseWriteOK(token, response);
    }
    public void setSessionRegistry(SessionRegistry sessionRegistry) {
        this.sessionRegistry = sessionRegistry;
    }

    /**
     * 获取sessionid
     * @param authentication
     * @param dflt
     * @return
     */
    private String getSessionId(Authentication authentication, String dflt) {
        if (authentication != null && authentication.isAuthenticated() && authentication.getDetails() instanceof WebAuthenticationDetails) {
            String sessionId = ((WebAuthenticationDetails) authentication.getDetails()).getSessionId();
            return sessionId == null ? dflt : sessionId;
        } else {
            // anonymous
            return dflt;
        }
    }

    /**
     * 执行usersession往session中保存的逻辑
     *
     * @param user_id
     */
    public void setUserSession(long user_id) {
        UserSessionBo userSessionBo = iMUserService.getUserBean(user_id);
        String sessionId = ServletUtil.getSession().getId();

        // 设置系统信息
        SysInfoBo sysInfoBo = new SysInfoBo();
        sysInfoBo.setDevelopModel(perfectSecurityProperties.getDevelopModel());
        userSessionBo.setSys_Info(sysInfoBo);

        // 设置session id
        userSessionBo.setSession_id(sessionId);
        userSessionBo.setAppKey("PC_APP");
        userSessionBo.setTenant_Id(userSessionBo.getStaff_info().getTentant_id());
        userSessionBo.setTenantAdmin(false);

        // 保存到redis中
        HttpSession session = ServletUtil.getSession();
        String key = PerfectConstant.SESSION_PREFIX.SESSION_USER_PREFIX_PREFIX + "_" + sessionId;
        if (ServletUtil.getUserSession() != null) {
            session.removeAttribute(key);
            session.setAttribute(key, userSessionBo);
        } else {
            session.setAttribute(key, userSessionBo);
        }
    }
}
