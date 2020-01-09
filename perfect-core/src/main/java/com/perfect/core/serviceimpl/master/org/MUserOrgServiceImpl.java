package com.perfect.core.serviceimpl.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.master.org.MPositionEntity;
import com.perfect.bean.entity.master.org.MUserOrgEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.vo.master.org.MPositionVo;
import com.perfect.common.exception.BusinessException;
import com.perfect.common.utils.string.StringUtil;
import com.perfect.core.mapper.master.org.MPositionMapper;
import com.perfect.core.mapper.master.org.MUserOrgMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.master.org.IMPositionService;
import com.perfect.core.service.master.org.IMUserOrgService;
import com.perfect.core.serviceimpl.common.autocode.MPositionAutoCodeImpl;
import com.perfect.core.utils.mybatis.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  用户组织机构关系表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Service
public class MUserOrgServiceImpl extends BaseServiceImpl<MUserOrgMapper, MUserOrgEntity> implements IMUserOrgService {

    @Autowired
    private MUserOrgMapper mapper;

}
