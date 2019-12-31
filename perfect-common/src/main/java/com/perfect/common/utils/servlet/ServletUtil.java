package com.perfect.common.utils.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.perfect.common.constant.PerfectConstant;

/**
 * 获取session工具类
 */
public class ServletUtil {

    /**
     * 获取session
     *
     * @return
     */
    public static HttpSession getSession() {
        HttpServletRequest request =
            ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
        return request.getSession();
    }

    /**
     * 返回session中保存的user session
     *
     */
    public static Object getUserSession() {
        HttpSession session = getSession();
        String sessionId = ServletUtil.getSession().getId();
        String key = PerfectConstant.SESSION_PREFIX.SESSION_USER_PREFIX_PREFIX + "_" + sessionId;
        return session.getAttribute(key);
    }
}
