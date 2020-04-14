package com.perfect.core.service.sys.rabc.menu;

import com.baomidou.mybatisplus.extension.service.IService;
import com.perfect.bean.entity.sys.rabc.menu.SMenuEntity;
import com.perfect.bean.pojo.result.DeleteResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.vo.sys.rabc.menu.SMenuDataVo;
import com.perfect.bean.vo.sys.rabc.menu.SMenuVo;

import java.util.List;

/**
 * <p>
 * 菜单 服务类 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
public interface ISMenuService extends IService<SMenuEntity> {

    /**
     * 获取所有数据
     */
    SMenuVo getTreeData(SMenuDataVo searchCondition) ;

    /**
     * 获取所有数据：级联
     */
    List<SMenuDataVo> getCascaderList(SMenuVo searchCondition) ;

    /**
     * 获取所有数据：级联
     */
    SMenuVo getCascaderGet(SMenuVo searchCondition) ;

    /**
     * 查询by id，返回结果
     *
     * @param id
     * @return
     */
    SMenuVo selectByid(Long id);

    /**
     * 获取所选id的数据
     */
    List<SMenuEntity> selectIdsIn(List<SMenuVo> searchCondition) ;

    /**
     * 批量删除复原
     * @param searchCondition
     * @return
     */
    void visibleByIdsIn(List<SMenuVo> searchCondition);

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
    InsertResult<Integer> addMenuGroup(SMenuEntity entity);

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
    InsertResult<Integer> addSubMenu(SMenuEntity entity);

    /**
     * 更新一条记录（选择字段，策略更新）
     * @param entity 实体对象
     * @return
     */
    UpdateResult<Integer> update(SMenuEntity entity);

    /**
     * 批量物理删除
     * @param searchCondition
     * @return
     */
    DeleteResult<String> realDeleteByCode(SMenuVo searchCondition);
}
