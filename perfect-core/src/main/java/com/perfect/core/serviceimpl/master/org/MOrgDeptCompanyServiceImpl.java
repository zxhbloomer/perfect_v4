package com.perfect.core.serviceimpl.master.org;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.master.org.MOrgDeptCompanyEntity;
import com.perfect.core.mapper.master.org.MOrgDeptCompanyMapper;
import com.perfect.core.service.master.org.IMOrgDeptCompanyService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 企业与集团关系表，企业不存在嵌套 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2020-05-15
 */
@Service
public class MOrgDeptCompanyServiceImpl extends ServiceImpl<MOrgDeptCompanyMapper, MOrgDeptCompanyEntity> implements
    IMOrgDeptCompanyService {

}
