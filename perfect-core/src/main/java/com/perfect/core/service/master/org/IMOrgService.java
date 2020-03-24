package com.perfect.core.service.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.perfect.bean.entity.master.org.MOrgEntity;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.vo.common.component.NameAndValueVo;
import com.perfect.bean.vo.master.org.*;
import com.perfect.bean.vo.master.user.MStaffVo;

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
     * 获取所有的组织以及子组织数量，仅仅是数量
     * @param searchCondition
     * @return
     */
    MOrgCountsVo getAllOrgDataCount(MOrgVo searchCondition);

    /**
     * 获取组织数据
     * @param searchCondition
     * @return
     */
    List<MOrgTreeVo> getOrgs(MOrgVo searchCondition);

    /**
     * 获取集团数据
     * @param searchCondition
     * @return
     */
    IPage<MGroupVo> getGroups(MOrgTreeVo searchCondition);

    /**
     * 获取企业数据
     * @param searchCondition
     * @return
     */
    IPage<MCompanyVo> getCompanies(MOrgTreeVo searchCondition);

    /**
     * 获取部门数据
     * @param searchCondition
     * @return
     */
    IPage<MDeptVo> getDepts(MOrgTreeVo searchCondition);

    /**
     * 获取岗位数据
     * @param searchCondition
     * @return
     */
    IPage<MPositionVo> getPositions(MOrgTreeVo searchCondition);

    /**
     * 获取员工数据
     * @param searchCondition
     * @return
     */
    List<MStaffVo> getStaffs(MOrgVo searchCondition);

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

    /**
     * 拖拽保存
     * @param bean
     * @return
     */
    Boolean dragsave(List<MOrgTreeVo> bean);

    /**
     * 获取员工清单，为穿梭框服务
     * @return
     */
    MStaffPositionTransferVo getStaffTransferList(MStaffTransferVo condition);

    /**
     * 保存穿梭框数据，员工岗位设置
     * @return
     */
    MStaffPositionTransferVo setStaffTransfer(MStaffTransferVo bean);

    /**
     * 获取员工列表，页面查询
     */
    List<MStaffTabVo> selectStaff(MStaffTabVo searchCondition) ;

}
