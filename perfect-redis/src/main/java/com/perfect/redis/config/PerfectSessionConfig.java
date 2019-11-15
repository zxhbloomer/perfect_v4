package com.perfect.redis.config;

import com.perfect.common.properies.PerfectConfigProperies;
import com.perfect.redis.listener.SpringHttpSessionListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.session.data.redis.config.annotation.web.http.RedisHttpSessionConfiguration;

import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;
import java.util.List;

/**
 *
 */
@Configuration
@EnableConfigurationProperties(PerfectConfigProperies.class)
public class PerfectSessionConfig extends RedisHttpSessionConfiguration {

    @Autowired
    private PerfectConfigProperies perfectConfigProperies;

    public PerfectSessionConfig() {
        List<HttpSessionListener> list = new ArrayList<>();
        list.add(new SpringHttpSessionListener());
        this.setHttpSessionListeners(list);
        this.setMaxInactiveIntervalInSeconds(perfectConfigProperies.getRedisCacheExpiredMin() * 60);
    }

    /**
     * 添加session 监听
     * @param listeners
     */
    @Override
    public void setHttpSessionListeners(List<HttpSessionListener> listeners) {
        super.setHttpSessionListeners(listeners);
    }

    /**
     * 设置session过期时间
     * @param maxInactiveIntervalInSeconds
     */
    @Override
    public void setMaxInactiveIntervalInSeconds(int maxInactiveIntervalInSeconds) {
        super.setMaxInactiveIntervalInSeconds(maxInactiveIntervalInSeconds);
    }
}