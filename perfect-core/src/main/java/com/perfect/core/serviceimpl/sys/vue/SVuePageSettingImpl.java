package com.perfect.core.serviceimpl.sys.vue;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.sys.vue.SVuePageSettingEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.vo.sys.vue.SVuePageSettingVo;
import com.perfect.common.exception.BusinessException;
import com.perfect.core.mapper.sys.vue.SVuePageSettingMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.sys.vue.ISVuePageSettingService;
import com.perfect.core.utils.mybatis.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 字典数据表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Service
public class SVuePageSettingImpl extends BaseServiceImpl<SVuePageSettingMapper, SVuePageSettingEntity> implements
    ISVuePageSettingService {

    @Autowired
    private SVuePageSettingMapper mapper;

    /**
     * 获取列表，页面查询
     *
     * @param searchCondition
     * @return
     */
    @Override
    public IPage<SVuePageSettingVo> selectPage(SVuePageSettingVo searchCondition) {
        // 分页条件
        Page<SVuePageSettingEntity> pageCondition =
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
    public List<SVuePageSettingVo> select(SVuePageSettingVo searchCondition) {
        // 查询 数据
        List<SVuePageSettingVo> list = mapper.select(searchCondition);
        return list;
    }

    /**
     * 获取列表，根据id查询所有数据
     *
     * @param searchCondition
     * @return
     */
    @Override
    public List<SVuePageSettingVo> selectIdsIn(List<SVuePageSettingVo> searchCondition) {
        // 查询 数据
        List<SVuePageSettingVo> list = mapper.selectIdsIn(searchCondition);
        return list;
    }

    /**
     * 查询by id，返回结果
     *
     * @param id
     * @return
     */
    @Override
    public SVuePageSettingVo selectByid(Long id) {
        // 查询 数据
        return mapper.selectId(id);
    }

    /**
     * 插入一条记录（选择字段，策略插入）
     * 
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public InsertResult<Integer> insert(SVuePageSettingEntity entity) {
        // 插入前check
        CheckResult cr = checkLogic(entity.getName(), "11", CheckResult.INSERT_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 插入逻辑保存
        return InsertResultUtil.OK(mapper.insert(entity));
    }

    /**
     * 更新一条记录（选择字段，策略更新）
     * 
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public UpdateResult<Integer> update(SVuePageSettingEntity entity) {
        // 更新前check
        CheckResult cr = checkLogic(entity.getName(), "11", CheckResult.UPDATE_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 更新逻辑保存
        entity.setC_id(null);
        entity.setC_time(null);
        return UpdateResultUtil.OK(mapper.updateById(entity));
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param name
     * @return
     */
    @Override
    public List<SVuePageSettingEntity> selectByName(String name) {
        // 查询 数据
        List<SVuePageSettingEntity> list = mapper.selectByName(name);
        return list;
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param key
     * @return
     */
    @Override
    public List<SVuePageSettingEntity> selectByKey(String key) {
        // 查询 数据
        List<SVuePageSettingEntity> list = mapper.selectByKey(key);
        return list;
    }

    /**
     * check逻辑
     * 
     * @return
     */
    public CheckResult checkLogic(String name, String key, String moduleType) {
        List<SVuePageSettingEntity> selectByName = selectByName(name);
        List<SVuePageSettingEntity> selectByKey = selectByKey(key);

        switch (moduleType) {
            case CheckResult.INSERT_CHECK_TYPE:
                // 新增场合，不能重复
                if (selectByName.size() >= 1) {
                    return CheckResultUtil.NG("新增保存出错：参数名称出现重复", name);
                }
                if (selectByKey.size() >= 1) {
                    return CheckResultUtil.NG("新增保存出错：参数键名出现重复", key);
                }
                break;
            case CheckResult.UPDATE_CHECK_TYPE:
                // 更新场合，不能重复设置
                if (selectByName.size() >= 2) {
                    return CheckResultUtil.NG("新增保存出错：参数名称出现重复", name);
                }
                if (selectByKey.size() >= 2) {
                    return CheckResultUtil.NG("新增保存出错：参数键名出现重复", key);
                }
                break;
            default:
        }
        return CheckResultUtil.OK();
    }

}