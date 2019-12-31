package com.perfect.core.serviceimpl.sys;

import com.perfect.bean.entity.sys.SLogSysEntity;
import com.perfect.core.mapper.sys.SLogMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.sys.ISLogService;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zxh
 * @since 2019-07-04
 */
@Service
public class SLogServiceImpl extends BaseServiceImpl<SLogMapper, SLogSysEntity> implements ISLogService {

}
