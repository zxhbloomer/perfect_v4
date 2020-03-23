package com.perfect.core.serviceimpl.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.master.org.MStaffOrgEntity;
import com.perfect.bean.entity.master.user.MStaffEntity;
import com.perfect.bean.vo.master.user.MStaffVo;
import com.perfect.core.mapper.client.user.MUserMapper;
import com.perfect.core.mapper.master.org.MStaffOrgMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.master.org.IMStaffOrgService;
import com.perfect.core.utils.mybatis.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
public class MStaffOrgServiceImpl extends BaseServiceImpl<MStaffOrgMapper, MStaffOrgEntity> implements IMStaffOrgService {

    @Autowired
    private MStaffOrgMapper mapper;

    @Autowired
    private MUserMapper mUserMapper;


    /**
     * 获取列表，页面查询
     *
     * @param searchCondition
     * @return
     */
    @Override
    public IPage<MStaffVo> selectPage(MStaffVo searchCondition) {
        searchCondition.setTenant_id(getUserSessionTenantId());
        // 分页条件
        Page<MStaffEntity> pageCondition =
            new Page(searchCondition.getPageCondition().getCurrent(), searchCondition.getPageCondition().getSize());
        // 通过page进行排序
        PageUtil.setSort(pageCondition, searchCondition.getPageCondition().getSort());
        return mapper.selectPage(pageCondition, searchCondition);

    }

    /**
     * 获取列表，查询所有数据
     *
     * @param searchCondition
     * @return
     */
    @Override
    public List<MStaffVo> select(MStaffVo searchCondition) {
        searchCondition.setTenant_id(getUserSessionTenantId());
        // 查询 数据
        List<MStaffVo> list = mapper.select(searchCondition);
        return list;
    }
}
