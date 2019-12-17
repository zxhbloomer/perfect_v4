package com.perfect.core.service.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.perfect.bean.entity.master.org.MOrgEntity;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.vo.common.component.NameAndValueVo;
import com.perfect.bean.vo.master.org.MDeptVo;
import com.perfect.bean.vo.master.org.MOrgAllDataVo;
import com.perfect.bean.vo.master.org.MOrgTreeVo;
import com.perfect.bean.vo.master.org.MOrgVo;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 岗位主表 服务类 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
public interface IMOrgService extends IService<MOrgEntity> {

    /**
     * 获取所有数据，左侧树数据
     */
    List<MOrgTreeVo> getTreeList(MOrgTreeVo searchCondition) ;

    /**
     * 获取所有数据
     */
    List<MOrgTreeVo> select(MOrgVo searchCondition) ;

    /**
     * 获取所有的组织数据
     * @param searchCondition
     * @return
     */
    MOrgAllDataVo getAllOrgData(MOrgVo searchCondition);


    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
    InsertResult<Integer> insert(MOrgEntity entity);

    /**
     * 更新一条记录（选择字段，策略更新）
     * @param entity 实体对象
     * @return
     */
    UpdateResult<Integer> update(MOrgEntity entity);

    /**
     * 获取数据byid
     * @param id
     * @return
     */
    MOrgVo selectByid(Long id);

    /**
     * 新增模式下，可新增子节点得类型
     * @return
     */
    List<NameAndValueVo> getCorrectTypeByInsertStatus(MOrgVo vo);

    /**
     * 删除
     * @param entity
     * @return
     */
    Boolean deleteById(MOrgEntity entity);

    /**
     * 根据code，进行 like 'code%'，匹配当前节点以及子节点
     * @param vo
     * @return
     */
    List<MOrgEntity> getDataByCode(MOrgEntity vo);
}
