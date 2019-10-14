package com.perfect.core.serviceimpl.quartz;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.quartz.SJobEntity;
import com.perfect.core.mapper.quartz.SJobMapper;
import com.perfect.core.service.quartz.ISJobService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jobob
 * @since 2019-07-04
 */
@Service
public class SJobServiceImpl extends ServiceImpl<SJobMapper, SJobEntity> implements ISJobService {

}
