package com.perfect.core.serviceimpl.master.org;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.master.org.MOrgDeptDeptEntity;
import com.perfect.core.mapper.master.org.MOrgDeptDeptMapper;
import com.perfect.core.service.master.org.IMOrgDeptDeptService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 部门与部门关系表，多部门嵌套关系表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2020-05-15
 */
@Service
public class MOrgDeptDeptServiceImpl extends ServiceImpl<MOrgDeptDeptMapper, MOrgDeptDeptEntity> implements
    IMOrgDeptDeptService {

}
