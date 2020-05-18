package com.perfect.core.serviceimpl.master.org;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.master.org.MOrgCompanyDeptEntity;
import com.perfect.core.mapper.master.org.MOrgCompanyDeptMapper;
import com.perfect.core.service.master.org.IMOrgCompanyDeptService;
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
public class MOrgCompanyDeptServiceImpl extends ServiceImpl<MOrgCompanyDeptMapper, MOrgCompanyDeptEntity> implements
    IMOrgCompanyDeptService {

}
