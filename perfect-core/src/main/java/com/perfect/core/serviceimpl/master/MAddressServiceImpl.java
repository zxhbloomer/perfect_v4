package com.perfect.core.serviceimpl.master;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.master.MAddressEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.vo.master.MAddressVo;
import com.perfect.common.exception.BusinessException;
import com.perfect.core.mapper.master.MAddressMapper;
import com.perfect.core.service.master.IMAddressService;
import com.perfect.core.utils.mybatis.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  集团主表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Service
public class MAddressServiceImpl extends ServiceImpl<MAddressMapper, MAddressEntity> implements IMAddressService {

    @Autowired
    private MAddressMapper mapper;

    /**
     * 获取列表，页面查询
     *
     * @param searchCondition
     * @return
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    @Override
    public IPage<MAddressVo> selectPage(MAddressVo searchCondition)
        throws InstantiationException, IllegalAccessException {
        // 分页条件
        Page<MAddressEntity> pageCondition =
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
    public List<MAddressVo> select(MAddressVo searchCondition) {
        // 查询 数据
        List<MAddressVo> list = mapper.select(searchCondition);
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
    public List<MAddressEntity> selectIdsIn(List<MAddressEntity> searchCondition) {
        // 查询 数据
        List<MAddressEntity> list = mapper.selectIdsIn(searchCondition);
        return list;
    }

    /**
     * 批量删除复原
     * @param searchCondition
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void deleteByIdsIn(List<MAddressEntity> searchCondition) {
        List<MAddressEntity> list = mapper.selectIdsIn(searchCondition);
        list.forEach(
            bean -> {
                bean.setIs_del(!bean.getIs_del());
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
    public InsertResult<Integer> insert(MAddressEntity entity) {
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
    public UpdateResult<Integer> update(MAddressEntity entity) {
        // 更新前check
        CheckResult cr = checkLogic(entity, CheckResult.UPDATE_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 更新逻辑保存
        return UpdateResultUtil.OK(mapper.updateById(entity));
    }

    /**
     * check逻辑
     * @return
     */
    public CheckResult checkLogic(MAddressEntity entity, String moduleType){
//        switch (moduleType) {
//            case CheckResult.INSERT_CHECK_TYPE:
//                // 新增场合，不能重复
//                List<MAddressEntity> codeList_insertCheck = selectByCode(entity.getCode(), null, null);
//                List<MAddressEntity> nameList_insertCheck = selectByName(entity.getName(), null, null);
//                List<MAddressEntity> simple_name_insertCheck = selectBySimpleName(entity.getSimple_name(), null, null);
//                if (codeList_insertCheck.size() >= 1) {
//                    return CheckResultUtil.NG("新增保存出错：集团编号出现重复", entity.getCode());
//                }
//                if (nameList_insertCheck.size() >= 1) {
//                    return CheckResultUtil.NG("新增保存出错：集团全称出现重复", entity.getName());
//                }
//                if (simple_name_insertCheck.size() >= 1) {
//                    return CheckResultUtil.NG("新增保存出错：集团简称称出现重复", entity.getSimple_name());
//                }
//                break;
//            case CheckResult.UPDATE_CHECK_TYPE:
//                // 更新场合，不能重复设置
//                List<MAddressEntity> codeList_updCheck = selectByCode(entity.getCode(), null, entity.getId());
//                List<MAddressEntity> nameList_updCheck = selectByName(entity.getName(), null, entity.getId());
//                List<MAddressEntity> simple_name_updCheck = selectBySimpleName(entity.getSimple_name(), null, entity.getId());
//
//                if (codeList_updCheck.size() >= 1) {
//                    return CheckResultUtil.NG("更新保存出错：集团编号出现重复", entity.getCode());
//                }
//                if (nameList_updCheck.size() >= 1) {
//                    return CheckResultUtil.NG("更新保存出错：集团全称出现重复", entity.getName());
//                }
//                if (simple_name_updCheck.size() >= 1) {
//                    return CheckResultUtil.NG("更新保存出错：集团简称称出现重复", entity.getSimple_name());
//                }
//                break;
//            default:
//        }
        return CheckResultUtil.OK();
    }
}
