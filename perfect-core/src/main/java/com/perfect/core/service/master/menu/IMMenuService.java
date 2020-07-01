package com.perfect.core.service.master.menu;

import com.baomidou.mybatisplus.extension.service.IService;
import com.perfect.bean.entity.master.menu.MMenuEntity;
import com.perfect.bean.pojo.result.DeleteResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.vo.master.menu.MMenuDataVo;
import com.perfect.bean.vo.master.menu.MMenuVo;

import java.util.List;

/**
 * <p>
 * 菜单 服务类 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
public interface IMMenuService extends IService<MMenuEntity> {

    /**
     * 获取所有数据
     */
    MMenuVo getTreeData(MMenuDataVo searchCondition) ;

    /**
     * 获取所有数据：级联
     */
    List<MMenuDataVo> getCascaderList(MMenuVo searchCondition) ;

    /**
     * 获取所有数据：级联
     */
    MMenuVo getCascaderGet(MMenuVo searchCondition) ;

    /**
     * 查询by id，返回结果
     *
     * @param id
     * @return
     */
    MMenuVo selectByid(Long id);

    /**
     * 获取所选id的数据
     */
    List<MMenuEntity> selectIdsIn(List<MMenuVo> searchCondition) ;

    /**
     * 批量删除复原
     * @param searchCondition
     * @return
     */
    void visibleByIdsIn(List<MMenuVo> searchCondition);

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
    InsertResult<Integer> addMenuGroup(MMenuEntity entity);

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
    InsertResult<Integer> addSubMenu(MMenuEntity entity);

    /**
     * 更新一条记录（选择字段，策略更新）
     * @param entity 实体对象
     * @return
     */
    UpdateResult<Integer> update(MMenuEntity entity);

    /**
     * 批量物理删除
     * @param searchCondition
     * @return
     */
    DeleteResult<String> realDeleteByCode(MMenuVo searchCondition);
}
