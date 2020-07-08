package com.perfect.core.service.sys.config;

import com.baomidou.mybatisplus.extension.service.IService;
import com.perfect.bean.entity.sys.config.SIconEntity;
import com.perfect.bean.vo.sys.config.SIconVo;

import java.util.List;

/**
 * <p>
 *  系统icon 服务类
 * </p>
 *
 * @author zxh
 * @since 2020-07-08
 */
public interface ISIconService extends IService<SIconEntity> {
    /**
     * 获取系统Icon信息
     */
    List<SIconEntity> select(SIconVo searchCondition) ;
}
