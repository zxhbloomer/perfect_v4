package com.perfect.core.serviceimpl.sys.rabc.menu;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.sys.rabc.menu.SMenuEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.utils.common.tree.TreeUtil;
import com.perfect.bean.vo.sys.config.tenant.STentantTreeVo;
import com.perfect.bean.vo.sys.rabc.menu.SMenuVo;
import com.perfect.common.exception.BusinessException;
import com.perfect.core.mapper.sys.rabc.menu.SMenuMapper;
import com.perfect.core.service.sys.rabc.menu.ISMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  菜单 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Service
public class SMenuServiceImpl extends ServiceImpl<SMenuMapper, SMenuEntity> implements ISMenuService {

    @Autowired
    private SMenuMapper mapper;

    /**
     * 获取列表，查询所有数据
     *
     * @param searchCondition
     * @return
     * @throws InstantiationException
     * @throws IllegalAccessException
     */
    @Override
    public List<SMenuVo> select(SMenuVo searchCondition) {
        // 查询 数据
        List<SMenuVo> list = mapper.select(searchCondition);
        List<SMenuVo> rtnList = TreeUtil.getTreeList(list);
        return rtnList;
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
    public List<SMenuEntity> selectIdsIn(List<SMenuVo> searchCondition) {
        // 查询 数据
        List<SMenuEntity> list = mapper.selectIdsIn(searchCondition);
        return list;
    }

    /**
     * 批量删除复原
     * @param searchCondition
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void visibleByIdsIn(List<SMenuVo> searchCondition) {
        List<SMenuEntity> list = mapper.selectIdsIn(searchCondition);
        list.forEach(
            bean -> {
                bean.setVisible(!bean.getVisible());
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
    public InsertResult<Integer> insert(SMenuEntity entity) {
        // 插入前check
        CheckResult cr = checkLogic(entity, CheckResult.INSERT_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 插入逻辑保存
        entity.setVisible(false);
        return InsertResultUtil.OK(mapper.insert(entity));
    }

    /**
     * 更新一条记录（选择字段，策略更新）
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public UpdateResult<Integer> update(SMenuEntity entity) {
        // 更新前check
        CheckResult cr = checkLogic(entity, CheckResult.UPDATE_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 更新逻辑保存
        return UpdateResultUtil.OK(mapper.updateById(entity));
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param code
     * @return
     */
    public List<SMenuEntity> selectByCode(String code, Long equal_id, Long not_equal_id) {
        // 查询 数据
        List<SMenuEntity> list = mapper.selectByCode(code, equal_id, not_equal_id);
        return list;
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param name
     * @return
     */
    public List<SMenuEntity> selectByName(String name, Long equal_id, Long not_equal_id) {
        // 查询 数据
        List<SMenuEntity> list = mapper.selectByName(name, equal_id, not_equal_id);
        return list;
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param name
     * @return
     */
    public List<SMenuEntity> selectBySimpleName(String name, Long equal_id, Long not_equal_id) {
        // 查询 数据
        List<SMenuEntity> list = mapper.selectBySimpleName(name, equal_id, not_equal_id);
        return list;
    }

    /**
     * check逻辑
     * @return
     */
    public CheckResult checkLogic(SMenuEntity entity, String moduleType){
//        switch (moduleType) {
//            case CheckResult.INSERT_CHECK_TYPE:
//                // 新增场合，不能重复
//                List<SMenuEntity> codeList_insertCheck = selectByCode(entity.getCode(), null, null);
//                List<SMenuEntity> nameList_insertCheck = selectByName(entity.getName(), null, null);
//                List<SMenuEntity> simple_name_insertCheck = selectBySimpleName(entity.getSimple_name(), null, null);
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
//                List<SMenuEntity> codeList_updCheck = selectByCode(entity.getCode(), null, entity.getId());
//                List<SMenuEntity> nameList_updCheck = selectByName(entity.getName(), null, entity.getId());
//                List<SMenuEntity> simple_name_updCheck = selectBySimpleName(entity.getSimple_name(), null, entity.getId());
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
