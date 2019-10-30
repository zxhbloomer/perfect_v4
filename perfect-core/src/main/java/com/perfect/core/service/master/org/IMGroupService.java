package com.perfect.core.service.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.perfect.bean.entity.master.org.MGroupEntity;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.vo.master.org.MGroupVo;

import java.util.List;

/**
 * <p>
 * 集团主表 服务类
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
public interface IMGroupService extends IService<MGroupEntity> {
    /**
     * 获取列表，页面查询
     */
    IPage<MGroupEntity> selectPage(MGroupVo searchCondition) throws InstantiationException, IllegalAccessException;

    /**
     * 获取所有数据
     */
    List<MGroupEntity> select(MGroupVo searchCondition) throws InstantiationException, IllegalAccessException;

    /**
     * 获取所选id的数据
     */
    List<MGroupEntity> selectIdsIn(List<MGroupVo> searchCondition) throws InstantiationException, IllegalAccessException;

    /**
     * 批量导入
     */
    boolean saveBatches(List<MGroupEntity> entityList);

    /**
     * 批量删除复原
     * @param searchCondition
     * @return
     */
    void deleteByIdsIn(List<MGroupVo> searchCondition);

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
    InsertResult<Integer> insert(MGroupEntity entity);

    /**
     * 更新一条记录（选择字段，策略更新）
     * @param entity 实体对象
     * @return
     */
    UpdateResult<Integer> update(MGroupEntity entity);
}
