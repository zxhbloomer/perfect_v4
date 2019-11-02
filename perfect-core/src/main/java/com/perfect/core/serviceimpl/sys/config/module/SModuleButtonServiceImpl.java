package com.perfect.core.serviceimpl.sys.config.module;

import java.util.List;

import com.perfect.core.service.sys.config.module.IModuleButtonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.sys.config.module.SModuleButtonEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.vo.sys.config.module.SModuleButtonVo;
import com.perfect.common.constant.PerfectDictConstant;
import com.perfect.common.exception.BusinessException;
import com.perfect.core.mapper.sys.config.module.SModuleButtonMapper;
import com.perfect.core.service.sys.config.module.IModuleService;
import com.perfect.core.utils.mybatis.PageUtil;

/**
 * <p>
 * 模块表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2019-08-16
 */
@Service
public class SModuleButtonServiceImpl extends ServiceImpl<SModuleButtonMapper, SModuleButtonEntity> implements IModuleButtonService {

    @Autowired
    private SModuleButtonMapper mapper;

    /**
     * 获取列表，页面查询
     * 
     * @param searchCondition
     * @return
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    @Override
    public IPage<SModuleButtonVo> selectPage(SModuleButtonVo searchCondition)
        throws InstantiationException, IllegalAccessException {
        // 分页条件
        Page<SModuleButtonVo> pageCondition =
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
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    @Override
    public List<SModuleButtonVo> select(SModuleButtonVo searchCondition) {
        // 查询 数据
        List<SModuleButtonVo> list = mapper.select(searchCondition);
        return list;
    }

    /**
     * 获取列表，根据id查询所有数据
     * 
     * @param searchCondition
     * @return
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    @Override
    public List<SModuleButtonVo> selectIdsIn(List<SModuleButtonVo> searchCondition) {
        // 查询 数据
        List<SModuleButtonVo> list = mapper.selectIdsIn(searchCondition);
        return list;
    }

    /**
     * 批量删除复原
     *
     * @param searchCondition
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteByIdsIn(List<SModuleButtonVo> searchCondition) {
        // todo：物理删除逻辑
    }

    /**
     * 插入一条记录（选择字段，策略插入）
     * 
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public InsertResult<Integer> insert(SModuleButtonEntity entity) {
        // 插入前check
        CheckResult cr = checkLogic(entity, CheckResult.INSERT_CHECK_TYPE);
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
    public UpdateResult<Integer> update(SModuleButtonEntity entity) {
        // 更新前check
        CheckResult cr = checkLogic(entity, CheckResult.UPDATE_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 更新逻辑保存
        return UpdateResultUtil.OK(mapper.updateById(entity));
    }

    /**
     * 查询by id，返回结果
     *
     * @param id
     * @return
     */
    @Override
    public SModuleButtonVo selectByid(Long id) {
        // 查询 数据
        return mapper.selectId(id);
    }

    /**
     * 查询by code，返回结果
     *
     * @param code
     * @return
     */
    public List<SModuleButtonEntity> selectByCode(String code, Long equal_id, Long not_equal_id) {
        // 查询 数据
        List<SModuleButtonEntity> list = mapper.selectByCode(code, equal_id, not_equal_id);
        return list;
    }

    /**
     * 查询by 名称，返回结果
     *
     * @param name
     * @return
     */
    public List<SModuleButtonEntity> selectByName(String name, Long equal_id, Long not_equal_id) {
        // 查询 数据
        List<SModuleButtonEntity> list = mapper.selectByName(name, equal_id, not_equal_id);
        return list;
    }

    /**
     * 查询by 请求地址，返回结果
     */
    public List<SModuleButtonEntity> selectByPath(String path, Long equal_id, Long not_equal_id) {
        // 查询 数据
        List<SModuleButtonEntity> list = mapper.selectByPath(path, equal_id, not_equal_id);
        return list;
    }

    /**
     * 查询by 请求地址，返回结果
     */
    public List<SModuleButtonEntity> selectByRoute_name(String route_name, Long equal_id, Long not_equal_id) {
        // 查询 数据
        List<SModuleButtonEntity> list = mapper.selectByRoute_name(route_name, equal_id, not_equal_id);
        return list;
    }

    /**
     * check逻辑，模块编号 or 模块名称 不能重复
     * 
     * @return
     */
    public CheckResult checkLogic(SModuleButtonEntity entity, String moduleType) {
        switch(moduleType){
            case CheckResult.INSERT_CHECK_TYPE :
                List<SModuleButtonEntity> listCode_insertCheck = selectByCode(entity.getCode(), null, null);
                List<SModuleButtonEntity> listName_insertCheck = selectByName(entity.getName(), null, null);
                // 新增场合，不能重复
                if (listCode_insertCheck.size() >= 1) {
                    // 模块编号不能重复
                    return CheckResultUtil.NG("新增保存出错：模块编号出现重复", listCode_insertCheck);
                }
                if (listName_insertCheck.size() >= 1) {
                    // 模块名称不能重复
                    return CheckResultUtil.NG("新增保存出错：模块名称出现重复", listName_insertCheck);
                }

                break;
            case CheckResult.UPDATE_CHECK_TYPE :
                List<SModuleButtonEntity> listCode_updCheck = selectByCode(entity.getCode(), null, entity.getId());
                List<SModuleButtonEntity> listName_updCheckk = selectByName(entity.getName(), null, entity.getId());
                // 更新场合，不能重复设置
                if (listCode_updCheck.size() >= 1) {
                    // 模块编号不能重复
                    return CheckResultUtil.NG("更新保存出错：模块编号出现重复", listCode_updCheck);
                }
                if (listName_updCheckk.size() >= 1) {
                    // 模块名称不能重复
                    return CheckResultUtil.NG("更新保存出错：模块名称出现重复", listName_updCheckk);
                }
                break;
            default :

        }

        return CheckResultUtil.OK();
    }

}
