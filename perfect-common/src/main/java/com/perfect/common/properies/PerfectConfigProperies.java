package com.perfect.common.properies;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * @author zxh
 */
@Component
@Configuration
@ConfigurationProperties(prefix = "perfect.config")
@Data
public class PerfectConfigProperies {

    private boolean simpleModel;

    private boolean logSaveDb;

    private boolean logPrint;

    private boolean openAopLog;

    /**
     * 上传url
     */
    private String fsUrl;

    private String fsAppid;
    private String fsUsername;
    private String fsGroupid;

    /**
     * redis 过期时间
     */
    private int redisCacheExpiredMin = 30;
}
