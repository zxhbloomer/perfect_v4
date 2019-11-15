package com.perfect.framework.listener;

import com.perfect.common.constant.PerfectConstant;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@Configuration
@Slf4j
public class SpringHttpSessionListener {

    @Bean
    public HttpSessionListener httpSessionListener() {
        return new HttpSessionListener() {
            @Override
            public void sessionCreated(HttpSessionEvent se) {
                log.debug("session 生成，session_id：" + se.getSession().getId());
            }

            @Override
            public void sessionDestroyed(HttpSessionEvent se) {
                log.debug("session 过期了，session_id：" + se.getSession().getId());
                String id = PerfectConstant.SESSION_PREFIX.SESSION_USER_PREFIX_PREFIX + "_" + se.getSession().getId();
                log.debug("开始执行userbean销毁操作，id：" + id);
                se.getSession().removeAttribute(id);
                log.debug("执行userbean销毁操作成功");
                log.debug("session 销毁，session_id：" + se.getSession().getId());
            }
        };
    }

    @Bean
    public HttpSessionAttributeListener httpSessionAttributeListener() {
        return new HttpSessionAttributeListener() {
            @Override
            public void attributeAdded(HttpSessionBindingEvent se) {
                log.debug("Attribute 添加内容");
                log.debug("Attribute Name:" + se.getName());
                log.debug("Attribute Value:" + se.getValue());
            }

            @Override
            public void attributeRemoved(HttpSessionBindingEvent se) {
                log.debug("attribute 删除:" + se.getName());
            }

            @Override
            public void attributeReplaced(HttpSessionBindingEvent se) {
                log.debug("Attribute 替换内容");
                log.debug("Attribute Name:" + se.getName());
                log.debug("Attribute Old Value:" + se.getValue());
            }
        };
    }
}
