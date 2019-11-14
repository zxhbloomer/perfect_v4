package com.perfect.common.utils.servlet;

import com.alibaba.fastjson.JSON;
import com.perfect.common.constant.PerfectConstant;
import com.perfect.common.utils.redis.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class ServletUtil {

    @Autowired
    private RedisUtil redisUtil;

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
