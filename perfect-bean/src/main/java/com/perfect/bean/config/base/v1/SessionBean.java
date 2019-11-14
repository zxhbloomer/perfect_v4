package com.perfect.bean.config.base.v1;

import lombok.Data;
import lombok.EqualsAndHashCode;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Data
public class SessionBean implements Serializable {

    private static final long serialVersionUID = 6503859853529665708L;

    /**
     * 会话ID
     */
    private String session_id;

    /**
     * 帐号ID
     */
    private Long accountId;

    /**
     * 应用标识
     */
    private String appKey;

    /**
     * 帐号所属租户ID
     */
    private Long tenant_Id;

    /**
     * 帐号是否租户的管理员
     */
    private Boolean tenantAdmin;

    /**
     * 帐号所拥有的权限
     */
    private Set<String> operationSet = new HashSet<String>();

    private String extra;

}
