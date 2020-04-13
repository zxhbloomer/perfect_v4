package com.perfect.core.serviceimpl.sys.rabc.menu;

import com.perfect.bean.entity.sys.rabc.menu.SMenuEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.DeleteResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.DeleteResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.utils.common.tree.TreeUtil;
import com.perfect.bean.vo.sys.rabc.menu.SMenuVo;
import com.perfect.common.exception.BusinessException;
import com.perfect.common.utils.string.StringUtil;
import com.perfect.core.mapper.sys.rabc.menu.SMenuMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.sys.rabc.menu.ISMenuService;
import com.perfect.core.serviceimpl.common.autocode.SysMenuAutoCodeImpl;
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
public class SMenuServiceImpl extends BaseServiceImpl<SMenuMapper, SMenuEntity> implements ISMenuService {

    @Autowired
    private SMenuMapper mapper;
    @Autowired
    private SysMenuAutoCodeImpl sysMenuAutoCode;

    /**
     * 获取列表，查询所有数据
     *
     * @param searchCondition
     * @return
     */
    @Override
    public List<SMenuVo> getTreeList(SMenuVo searchCondition) {
        // 查询 数据
        List<SMenuVo> list = mapper.select(searchCondition);
        System.out.println(list.get(7));
        System.out.println(list.get(7).getModule_info());
        System.out.println(list.get(7).getModule_info().get(0));
        System.out.println(list.get(7).getModule_info().get(0).getPerms());

        List<SMenuVo> rtnList = TreeUtil.getTreeList(list);
        return rtnList;
    }

    /**
     * 级联：获取列表，查询所有数据
     *
     * @param searchCondition
     * @return
     */
    @Override
    public List<SMenuVo> getCascaderList(SMenuVo searchCondition) {
        // 查询 数据
        List<SMenuVo> list = mapper.getCascaderList(searchCondition);
        List<SMenuVo> rtnList = TreeUtil.getTreeList(list);
        return rtnList;
    }

    /**
     * 级联：获取列表，查询所有数据
     *
     * @param searchCondition
     * @return
     */
    @Override
    public SMenuVo getCascaderGet(SMenuVo searchCondition) {
        // 查询 数据
        SMenuVo vo = mapper.getCascaderGet(searchCondition);
        return vo;
    }

    /**
     * 查询by id，返回结果
     *
     * @param id
     * @return
     */
    @Override
    public SMenuVo selectByid(Long id) {
        // 查询 数据
        return mapper.selectId(id);
    }

    /**
     * 获取列表，根据id查询所有数据
     *
     * @param searchCondition
     * @return
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
    public InsertResult<Integer> addMenuGroup(SMenuEntity entity) {
        // 插入前check
        CheckResult cr = checkLogic(entity, CheckResult.INSERT_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 插入逻辑保存
        entity.setVisible(false);
        // 获取id
        int insertCount = mapper.insert(entity);
        // 修改root_id
        entity.setRoot_id(entity.getId());
        // 更新数据库
        entity.setC_id(null);
        entity.setC_time(null);
        if(StringUtil.isEmpty(entity.getCode())){
            entity.setCode(sysMenuAutoCode.autoCode().getCode());
        }
        int updCount = mapper.updateById(entity);
        return InsertResultUtil.OK(updCount);
    }

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public InsertResult<Integer> addSubMenu(SMenuEntity entity) {
        // 插入逻辑保存
        entity.setVisible(false);

        // 获取父亲的entity
        SMenuEntity parentEntity = getById(entity.getParent_id());
        Integer son_count = parentEntity.getSon_count();
        son_count = (son_count == null ? 0 : son_count)  + 1;
        parentEntity.setSon_count(son_count);
        // 保存父亲的儿子的个数
        parentEntity.setC_id(null);
        parentEntity.setC_time(null);
        mapper.updateById(parentEntity);

        // 获取父亲的code
        String parentCode = parentEntity.getCode();
        // 计算当前编号
        // 获取当前son_count
        // 0 代表前面补充0
        // 4 代表长度为4
        // d 代表参数为正数型
        String str = String.format("%04d", son_count);
        entity.setCode(parentCode + str);
        entity.setSon_count(0);

        // 插入前check
        CheckResult cr = checkLogic(entity, CheckResult.INSERT_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }

        // 保存儿子个数
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
        entity.setC_id(null);
        entity.setC_time(null);
        return UpdateResultUtil.OK(mapper.updateById(entity));
    }

    /**
     * 批量删除复原
     *
     * @param searchCondition
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public DeleteResult<String> realDeleteByCode(SMenuVo searchCondition) {
        // 删除当前以及子菜单
        mapper.realDeleteByCode(searchCondition);
        return DeleteResultUtil.OK("OK");
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
     * check逻辑
     * @return
     */
    public CheckResult checkLogic(SMenuEntity entity, String moduleType){
        switch (moduleType) {
            case CheckResult.INSERT_CHECK_TYPE:
                // 新增场合，不能重复
                List<SMenuEntity> codeList_insertCheck = selectByCode(entity.getCode(), null, null);
                if (codeList_insertCheck.size() >= 1) {
                    return CheckResultUtil.NG("新增保存出错：集团编号出现重复", entity.getCode());
                }
                break;
            case CheckResult.UPDATE_CHECK_TYPE:
                // 更新场合，不能重复设置
                List<SMenuEntity> codeList_updCheck = selectByCode(entity.getCode(), null, entity.getId());

                if (codeList_updCheck.size() >= 1) {
                    return CheckResultUtil.NG("更新保存出错：集团编号出现重复", entity.getCode());
                }
                break;
            default:
        }
        return CheckResultUtil.OK();
    }
}
