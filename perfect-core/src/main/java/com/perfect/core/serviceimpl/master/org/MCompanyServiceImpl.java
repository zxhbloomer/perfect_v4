package com.perfect.core.serviceimpl.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.master.org.MCompanyEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.vo.master.org.MCompanyVo;
import com.perfect.common.exception.BusinessException;
import com.perfect.core.mapper.master.org.MCompanyMapper;
import com.perfect.core.mapper.master.org.MGroupMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.master.org.IMCompanyService;
import com.perfect.core.service.master.org.IMGroupService;
import com.perfect.core.utils.mybatis.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 公司主表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Service
public class MCompanyServiceImpl extends BaseServiceImpl<MCompanyMapper, MCompanyEntity> implements IMCompanyService {

    @Autowired
    private MCompanyMapper mapper;

    /**
     * 获取列表，页面查询
     *
     * @param searchCondition
     * @return
     */
    @Override
    public IPage<MCompanyEntity> selectPage(MCompanyVo searchCondition) {
        searchCondition.setTentant_id(getUserSessionTentantId());
        // 分页条件
        Page<MCompanyEntity> pageCondition =
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
    public List<MCompanyEntity> select(MCompanyVo searchCondition) {
        searchCondition.setTentant_id(getUserSessionTentantId());
        // 查询 数据
        List<MCompanyEntity> list = mapper.select(searchCondition);
        return list;
    }

    /**
     * 获取列表，根据id查询所有数据
     *
     * @param searchCondition
     * @return
     */
    @Override
    public List<MCompanyEntity> selectIdsIn(List<MCompanyVo> searchCondition) {
        // 查询 数据
        List<MCompanyEntity> list = mapper.selectIdsIn(searchCondition, getUserSessionTentantId());
        return list;
    }

    /**
     * 批量删除复原
     * @param searchCondition
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteByIdsIn(List<MCompanyVo> searchCondition) {
        List<MCompanyEntity> list = mapper.selectIdsIn(searchCondition, getUserSessionTentantId());
        list.forEach(
            bean -> {
                bean.setIs_del(!bean.getIs_del());
                bean.setTentant_id(getUserSessionTentantId());
            }
        );
        saveOrUpdateBatch(list, 500);
    }

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public InsertResult<Integer> insert(MCompanyEntity entity) {
        entity.setTentant_id(getUserSessionTentantId());
        // 插入前check
        CheckResult cr = checkLogic(entity, CheckResult.INSERT_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 插入逻辑保存
        entity.setIs_del(false);
        return InsertResultUtil.OK(mapper.insert(entity));
    }

    /**
     * 更新一条记录（选择字段，策略更新）
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public UpdateResult<Integer> update(MCompanyEntity entity) {
        // 更新前check
        CheckResult cr = checkLogic(entity, CheckResult.UPDATE_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 更新逻辑保存
        entity.setC_id(null);
        entity.setC_time(null);
        entity.setTentant_id(getUserSessionTentantId());
        return UpdateResultUtil.OK(mapper.updateById(entity));
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param code
     * @return
     */
    public List<MCompanyEntity> selectByCode(String code, Long equal_id, Long not_equal_id) {
        // 查询 数据
        List<MCompanyEntity> list = mapper.selectByCode(code, equal_id, not_equal_id, getUserSessionTentantId());
        return list;
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param name
     * @return
     */
    public List<MCompanyEntity> selectByName(String name, Long equal_id, Long not_equal_id) {
        // 查询 数据
        List<MCompanyEntity> list = mapper.selectByName(name, equal_id, not_equal_id, getUserSessionTentantId());
        return list;
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param name
     * @return
     */
    public List<MCompanyEntity> selectBySimpleName(String name, Long equal_id, Long not_equal_id) {
        // 查询 数据
        List<MCompanyEntity> list = mapper.selectBySimpleName(name, equal_id, not_equal_id, getUserSessionTentantId());
        return list;
    }

    /**
     * check逻辑
     * @return
     */
    public CheckResult checkLogic(MCompanyEntity entity, String moduleType){
        switch (moduleType) {
            case CheckResult.INSERT_CHECK_TYPE:
                // 新增场合，不能重复
                List<MCompanyEntity> codeList_insertCheck = selectByCode(entity.getCode(), null, null);
                List<MCompanyEntity> nameList_insertCheck = selectByName(entity.getName(), null, null);
                List<MCompanyEntity> simple_name_insertCheck = selectBySimpleName(entity.getSimple_name(), null, null);
                if (codeList_insertCheck.size() >= 1) {
                    return CheckResultUtil.NG("新增保存出错：集团编号出现重复", entity.getCode());
                }
                if (nameList_insertCheck.size() >= 1) {
                    return CheckResultUtil.NG("新增保存出错：集团全称出现重复", entity.getName());
                }
                if (simple_name_insertCheck.size() >= 1) {
                    return CheckResultUtil.NG("新增保存出错：集团简称称出现重复", entity.getSimple_name());
                }
                break;
            case CheckResult.UPDATE_CHECK_TYPE:
                // 更新场合，不能重复设置
                List<MCompanyEntity> codeList_updCheck = selectByCode(entity.getCode(), null, entity.getId());
                List<MCompanyEntity> nameList_updCheck = selectByName(entity.getName(), null, entity.getId());
                List<MCompanyEntity> simple_name_updCheck = selectBySimpleName(entity.getSimple_name(), null, entity.getId());

                if (codeList_updCheck.size() >= 1) {
                    return CheckResultUtil.NG("更新保存出错：集团编号出现重复", entity.getCode());
                }
                if (nameList_updCheck.size() >= 1) {
                    return CheckResultUtil.NG("更新保存出错：集团全称出现重复", entity.getName());
                }
                if (simple_name_updCheck.size() >= 1) {
                    return CheckResultUtil.NG("更新保存出错：集团简称称出现重复", entity.getSimple_name());
                }
                break;
            default:
        }
        return CheckResultUtil.OK();
    }
}
