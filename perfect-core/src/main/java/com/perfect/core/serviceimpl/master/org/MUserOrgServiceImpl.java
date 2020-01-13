package com.perfect.core.serviceimpl.master.org;

import com.perfect.bean.entity.master.org.MStaffOrgEntity;
import com.perfect.core.mapper.master.org.MUserOrgMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.master.org.IMUserOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  用户组织机构关系表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Service
public class MUserOrgServiceImpl extends BaseServiceImpl<MUserOrgMapper, MStaffOrgEntity> implements IMUserOrgService {

    @Autowired
    private MUserOrgMapper mapper;

}
