package com.perfect.core.service.sys.pages;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.perfect.bean.entity.sys.pages.SPagesFunctionEntity;
import com.perfect.bean.pojo.result.DeleteResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.vo.sys.pages.SPagesFunctionVo;

import java.util.List;

/**
 * <p>
 * 页面按钮表 服务类
 * </p>
 *
 * @author zxh
 * @since 2020-06-05
 */
public interface ISPagesFunctionService extends IService<SPagesFunctionEntity> {
    /**
     * 获取列表，页面查询
     */
    IPage<SPagesFunctionVo> selectPage(SPagesFunctionVo searchCondition) ;

    /**
     * 获取所有数据
     */
    List<SPagesFunctionVo> select(SPagesFunctionVo searchCondition) ;


    /**
     * 查询by id，返回结果
     *
     * @param id
     * @return
     */
    SPagesFunctionVo selectByid(Long id);


    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
    InsertResult<SPagesFunctionVo> insert(SPagesFunctionVo entity);

    /**
     * 更新一条记录（选择字段，策略更新）
     * @param entity 实体对象
     * @return
     */
    UpdateResult<SPagesFunctionVo> update(SPagesFunctionVo entity);

    /**
     * 更新一条记录（选择字段，策略更新），指定字段
     * @param entity 实体对象
     * @return
     */
    UpdateResult<SPagesFunctionVo> update_assign(SPagesFunctionVo entity);


    /**
     * 批量物理删除
     * @param searchCondition
     * @return
     */
    DeleteResult<Integer> realDeleteByIdsIn(List<SPagesFunctionVo> searchCondition);
}
