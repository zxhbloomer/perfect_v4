package com.perfect.core.serviceimpl.master.org;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.master.org.MOrgGroupGroupEntity;
import com.perfect.core.mapper.master.org.MOrgGroupGroupMapper;
import com.perfect.core.service.master.org.IMOrgGroupGroupService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 集团与集团关系表，多集团嵌套关系表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2020-05-15
 */
@Service
public class MOrgGroupGroupServiceImpl extends ServiceImpl<MOrgGroupGroupMapper, MOrgGroupGroupEntity> implements
    IMOrgGroupGroupService {

}
