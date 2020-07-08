package com.perfect.core.serviceimpl.sys.config;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.sys.config.SIconEntity;
import com.perfect.bean.vo.sys.config.SIconVo;
import com.perfect.common.constant.PerfectConstant;
import com.perfect.core.mapper.sys.config.SIconMapper;
import com.perfect.core.service.sys.config.ISIconService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  系统icon 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2020-07-08
 */
@Service
public class SIconServiceImpl extends ServiceImpl<SIconMapper, SIconEntity> implements ISIconService {

    @Autowired
    private SIconMapper mapper;

    /**
     * 获取系统Icon信息
     */
    @Cacheable(value = PerfectConstant.CACHE_PC.CACHE_SYSTEM_ICON_TYPE)
    @Override
    public List<SIconEntity> select(SIconVo searchCondition) {
        return mapper.selectList(new QueryWrapper<SIconEntity>()
            .orderByAsc("name")
        );
    }
}
