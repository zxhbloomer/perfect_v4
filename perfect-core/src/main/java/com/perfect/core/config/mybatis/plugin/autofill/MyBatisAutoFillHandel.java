package com.perfect.core.config.mybatis.plugin.autofill;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.perfect.core.utils.security.SecurityUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;

import java.time.LocalDateTime;

/**
 * @author zxh
 */
@Slf4j
public class MyBatisAutoFillHandel implements MetaObjectHandler {

    /**
     * 新增的时候自动填充
     * @param metaObject
     */
    @Override
    public void insertFill(MetaObject metaObject) {
        log.info(" ....新增的时候自动填充 ....");
        this.setFieldValByName("c_time", LocalDateTime.now(), metaObject);
        this.setFieldValByName("u_time", LocalDateTime.now(), metaObject);
        this.setFieldValByName("dbversion", 0, metaObject);

        this.setFieldValByName("c_id", SecurityUtil.getLoginUser_id() < 0 ? null : SecurityUtil.getLoginUser_id(), metaObject);
        this.setFieldValByName("u_id", SecurityUtil.getLoginUser_id() < 0 ? null : SecurityUtil.getLoginUser_id(), metaObject);
        // 默认未删除
        this.setFieldValByName("isdel", false, metaObject);
        // 默认未启用
        this.setFieldValByName("isenable", false, metaObject);

    }

    /**
     * 更新的时候自动填充
     * @param metaObject
     */
    @Override
    public void updateFill(MetaObject metaObject) {
        log.info(" ....更新的时候自动填充 ....");
        this.setFieldValByName("u_time", LocalDateTime.now(), metaObject);
        this.setFieldValByName("u_id", SecurityUtil.getLoginUser_id() < 0 ? null : SecurityUtil.getLoginUser_id(), metaObject);
    }
}
