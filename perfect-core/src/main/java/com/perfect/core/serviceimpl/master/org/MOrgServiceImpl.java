package com.perfect.core.serviceimpl.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.google.common.collect.Lists;
import com.perfect.bean.bo.log.operate.CustomOperateBo;
import com.perfect.bean.bo.log.operate.CustomOperateDetailBo;
import com.perfect.bean.entity.master.org.MCompanyEntity;
import com.perfect.bean.entity.master.org.MGroupEntity;
import com.perfect.bean.entity.master.org.MOrgEntity;
import com.perfect.bean.entity.master.org.MStaffOrgEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.utils.common.tree.TreeUtil;
import com.perfect.bean.utils.servlet.ServletUtil;
import com.perfect.bean.vo.common.component.NameAndValueVo;
import com.perfect.bean.vo.common.component.TreeNode;
import com.perfect.bean.vo.master.org.*;
import com.perfect.bean.vo.master.user.MStaffVo;
import com.perfect.common.annotations.LogByIdAnnotion;
import com.perfect.common.annotations.LogByIdsAnnotion;
import com.perfect.common.annotations.OperationLogAnnotion;
import com.perfect.common.constant.PerfectConstant;
import com.perfect.common.constant.PerfectDictConstant;
import com.perfect.common.enums.OperationEnum;
import com.perfect.common.enums.ParameterEnum;
import com.perfect.common.exception.BusinessException;
import com.perfect.common.utils.ArrayPfUtil;
import com.perfect.common.utils.bean.BeanUtilsSupport;
import com.perfect.core.mapper.master.org.MOrgMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.common.ICommonComponentService;
import com.perfect.core.service.master.org.IMOrgService;
import com.perfect.core.serviceimpl.log.operate.SLogOperServiceImpl;
import com.perfect.core.utils.mybatis.PageUtil;
import com.perfect.core.utils.security.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * <p>
 *  岗位主表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Service
public class MOrgServiceImpl extends BaseServiceImpl<MOrgMapper, MOrgEntity> implements IMOrgService {

    @Autowired
    private MOrgMapper mapper;

    @Autowired
    private ICommonComponentService iCommonComponentService;

    @Autowired
    private MOrgServiceImpl self;

    @Autowired
    private MStaffOrgServiceImpl mStaffOrgService;

    @Autowired
    private SLogOperServiceImpl sLogOperService;

    /** 组织entity数组 */
//    List<MOrgEntity> entities;

    /**
     * 获取所有数据，左侧树数据
     */
    @Override
    public List<MOrgTreeVo> getTreeList(MOrgTreeVo searchCondition) {
        searchCondition.setTenant_id(getUserSessionTenantId());
        // 查询 数据
        List<MOrgTreeVo> list = mapper.getTreeList(searchCondition);

        List<MOrgTreeVo> rtnList = TreeUtil.getTreeList(list);
        return rtnList;
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param searchCondition
     * @return
     */
    @Override
    public List<MOrgTreeVo> select(MOrgVo searchCondition) {
        searchCondition.setTenant_id(getUserSessionTenantId());
        // 查询 数据
        List<MOrgTreeVo> list = mapper.select(searchCondition);
        List<MOrgTreeVo> rtnList = TreeUtil.getTreeList(list);
        return rtnList;
    }

    /**
     * 获取所有的组织数据
     * @param searchCondition
     * @return
     */
    @Override
    public MOrgCountsVo getAllOrgDataCount(MOrgVo searchCondition) {
        MOrgCountsVo mOrgCountsVo = mapper.getAllOrgDataCount(searchCondition);
        return mOrgCountsVo;
    }

    /**
     * 获取组织数据
     * @param searchCondition
     * @return
     */
    @Override
    public List<MOrgTreeVo> getOrgs(MOrgVo searchCondition) {
        List<MOrgTreeVo> listOrg = select(searchCondition);
        return listOrg;
    }

    /**
     * 获取集团数据
     * @param searchCondition
     * @return
     */
    @Override
    public IPage<MGroupVo> getGroups(MOrgTreeVo searchCondition) {
        // 分页条件
        Page<MGroupEntity> pageCondition =
            new Page(searchCondition.getPageCondition().getCurrent(), searchCondition.getPageCondition().getSize());
        // 通过page进行排序
        PageUtil.setSort(pageCondition, searchCondition.getPageCondition().getSort());
        IPage<MGroupVo> listGroup = mapper.getGroupList(pageCondition, searchCondition);
        return listGroup;
    }

    /**
     * 获取企业数据
     * @param searchCondition
     * @return
     */
    @Override
    public IPage<MCompanyVo> getCompanies(MOrgTreeVo searchCondition) {
        // 分页条件
        Page<MCompanyEntity> pageCondition =
            new Page(searchCondition.getPageCondition().getCurrent(), searchCondition.getPageCondition().getSize());
        // 通过page进行排序
        PageUtil.setSort(pageCondition, searchCondition.getPageCondition().getSort());
        IPage<MCompanyVo> listcompany = mapper.getCompanyList(pageCondition, searchCondition);
        return listcompany;
    }

    /**
     * 获取部门数据
     * @param searchCondition
     * @return
     */
    @Override
    public IPage<MDeptVo> getDepts(MOrgTreeVo searchCondition) {
        // 分页条件
        Page<MDeptVo> pageCondition =
                new Page(searchCondition.getPageCondition().getCurrent(), searchCondition.getPageCondition().getSize());
        // 通过page进行排序
        PageUtil.setSort(pageCondition, searchCondition.getPageCondition().getSort());
        IPage<MDeptVo> listDept =  mapper.getDeptList(pageCondition, searchCondition);
        return listDept;
    }

    /**
     * 获取岗位数据
     * @param searchCondition
     * @return
     */
    @Override
    public IPage<MPositionVo> getPositions(MOrgTreeVo searchCondition) {
        // 分页条件
        Page<MDeptVo> pageCondition =
                new Page(searchCondition.getPageCondition().getCurrent(), searchCondition.getPageCondition().getSize());
        // 通过page进行排序
        PageUtil.setSort(pageCondition, searchCondition.getPageCondition().getSort());
        IPage<MPositionVo> listPosition =  mapper.getPositionList(pageCondition, searchCondition);
        return listPosition;
    }

    /**
     * 获取员工数据
     * @param searchCondition
     * @return
     */
    @Override
    public List<MStaffVo> getStaffs(MOrgVo searchCondition) {
        return null;
    }

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
    @OperationLogAnnotion(
        name = PerfectConstant.OPERATION.M_ORG.OPER_INSERT,
        type = OperationEnum.ADD,
        logById = @LogByIdAnnotion(
            name = PerfectConstant.OPERATION.M_ORG.OPER_INSERT,
            type = OperationEnum.ADD,
            oper_info = "",
            table_name = PerfectConstant.OPERATION.M_ORG.TABLE_NAME,
            id = "#{entity.id}"
        )
    )
    @Transactional(rollbackFor = Exception.class)
    @Override
    public InsertResult<Integer> insert(MOrgEntity entity) {
        // 设置entity
        entity.setTenant_id(getUserSessionTenantId());
        switch (entity.getType()) {
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_TENANT:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_TENANT_SERIAL_TYPE);
                break;
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_GROUP:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_GROUP_SERIAL_TYPE);
                break;
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_COMPANY:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_COMPANY_SERIAL_TYPE);
                break;
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_DEPT:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_DEPT_SERIAL_TYPE);
                break;
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION_SERIAL_TYPE);
                break;
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_STAFF:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_STAFF_SERIAL_TYPE);
                break;
        }

        // 插入前check
        CheckResult cr = checkLogic(entity, CheckResult.INSERT_CHECK_TYPE);

        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 获取父亲的entity
        MOrgEntity parentEntity = getById(entity.getParent_id());
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

        return InsertResultUtil.OK(mapper.insert(entity));
    }

    /**
     * 更新一条记录（选择字段，策略更新）
     * @param entity 实体对象
     * @return
     */
    @OperationLogAnnotion(
        name = PerfectConstant.OPERATION.M_ORG.OPER_UPDATE,
        type = OperationEnum.UPDATE,
        logById = @LogByIdAnnotion(
            name = PerfectConstant.OPERATION.M_ORG.OPER_UPDATE,
            type = OperationEnum.UPDATE,
            oper_info = "",
            table_name = PerfectConstant.OPERATION.M_ORG.TABLE_NAME,
            id = "#{entity.id}"
        )
    )
    @Transactional(rollbackFor = Exception.class)
    @Override
    public UpdateResult<Integer> update(MOrgEntity entity) {
        // 设置entity
        entity.setTenant_id((ServletUtil.getUserSession()).getTenant_Id());
        switch (entity.getType()) {
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_TENANT:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_TENANT_SERIAL_TYPE);
                break;
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_GROUP:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_GROUP_SERIAL_TYPE);
                break;
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_COMPANY:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_COMPANY_SERIAL_TYPE);
                break;
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_DEPT:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_DEPT_SERIAL_TYPE);
                break;
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION_SERIAL_TYPE);
                break;
            case PerfectDictConstant.DICT_ORG_SETTING_TYPE_STAFF:
                entity.setSerial_type(PerfectDictConstant.DICT_ORG_SETTING_TYPE_STAFF_SERIAL_TYPE);
                break;
        }

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
     * 获取数据byid
     * @param id
     * @return
     */
    @Override
    public MOrgVo selectByid(Long id){
        return mapper.selectByid(id, getUserSessionTenantId());
    }

    /**
     * 查询添加的子节点是否合法
     *
     * @return
     */
    public Integer selectNodeInsertStatus(String code, String type) {
        // 查询 数据
        Integer count = mapper.selectNodeInsertStatus(code, type, getUserSessionTenantId());
        return count;
    }

    /**
     * 查询添加的子节点是否合法，子节点被重复选择使用的情况
     *
     * @return
     */
    public Integer getCountBySerial(MOrgEntity entity, Long equal_id, Long not_equal_id) {
        // 查询 数据
        Integer count = mapper.getCountBySerial(entity, equal_id, not_equal_id);
        return count;
    }

    /**
     * check逻辑
     * @return
     */
    public CheckResult checkLogic(MOrgEntity entity, String moduleType){
        Integer count = 0;
        switch (moduleType) {
            case CheckResult.INSERT_CHECK_TYPE:
                // 查看子节点是否正确：租户->集团->企业->部门->岗位->员工
                Integer countInsert = this.selectNodeInsertStatus(entity.getCode(),entity.getType());
                if(countInsert > 0){
                    String nodeTypeName = iCommonComponentService.getDictName(PerfectDictConstant.DICT_ORG_SETTING_TYPE, entity.getType());
                    return CheckResultUtil.NG("新增保存出错：新增的子节点类型不能是" + "【" + nodeTypeName + "】", countInsert);
                }
                // 查看当前节点是否已经被选择使用
                count = getCountBySerial(entity, null, null);
                if(count > 0){
                    return CheckResultUtil.NG("新增保存出错：您选择的子节点已经在组织架构中，请选择尚未被使用的组织。", count);
                }
                break;
            case CheckResult.UPDATE_CHECK_TYPE:
                // 查看子节点是否正确：租户->集团->企业->部门->岗位->员工
                Integer countUpdate = this.selectNodeInsertStatus(entity.getCode(),entity.getType());
                if(countUpdate > 0){
                    String nodeTypeName = iCommonComponentService.getDictName(PerfectDictConstant.DICT_ORG_SETTING_TYPE, entity.getType());
                    return CheckResultUtil.NG("新增保存出错：更新的当前节点类型不能是" + "【" + nodeTypeName + "】", countUpdate);
                }
                // 查看当前节点是否已经被选择使用
                count = getCountBySerial(entity, null, entity.getId());
                if(count > 0){
                    return CheckResultUtil.NG("新增保存出错：您选择的子节点已经在组织架构中，请选择尚未被使用的组织。", count);
                }
                break;
            default:
        }
        return CheckResultUtil.OK();
    }

    /**
     * 新增模式下，可新增子节点得类型
     * @return
     */
    @Override
    public List<NameAndValueVo> getCorrectTypeByInsertStatus(MOrgVo vo) {
        vo.setTenant_id(getUserSessionTenantId());
        // 查询 数据
        List<NameAndValueVo> rtn = mapper.getCorrectTypeByInsertStatus(vo);
        return rtn;
    }

    /**
     * 删除
     * @param entity
     * @return
     */
    @OperationLogAnnotion(
        name = PerfectConstant.OPERATION.M_ORG.OPER_DELETE,
        type = OperationEnum.DELETE,
        logById = @LogByIdAnnotion(
            name = PerfectConstant.OPERATION.M_ORG.OPER_DELETE,
            type = OperationEnum.DELETE,
            oper_info = "",
            table_name = PerfectConstant.OPERATION.M_ORG.TABLE_NAME,
            id = "#{entity.id}"
        )
    )
    @Transactional(rollbackFor = Exception.class)
    @Override
    public Boolean deleteById(MOrgEntity entity) {
        // 检索子组织数据
        List<MOrgEntity> rtnList = getDataByCode(entity);
        rtnList.forEach(bean -> {
            // 删除 数据
            mapper.deleteById(bean.getId());
        });;
        return true;
    }

    /**
     * 根据code，进行 like 'code%'，匹配当前节点以及子节点
     * @param entity
     * @return
     */
    @Override
    public List<MOrgEntity> getDataByCode(MOrgEntity entity) {
        entity.setTenant_id(getUserSessionTenantId());
        List<MOrgEntity> rtnList = mapper.getDataByCode(entity);
        return rtnList;
    }

    /**
     * 拖拽保存
     * 未使用乐观锁，需要注意
     * @param beans
     * @return
     */
    @Override
    public Boolean dragsave(List<MOrgTreeVo> beans) {
        List<MOrgEntity> entities = new ArrayList<>();
        int code = 0;
        List<MOrgEntity> beanList = dragData2List(beans, null ,entities, code);
        /**
         * 注意调用方法，必须使用外部调用，激活aop，内部调用不能激活aop和注解
         */
        return self.dragsave2Db(beanList);
    }

    /**
     * 拖拽保存
     * @param list
     * @return
     */
    @OperationLogAnnotion(
        name = PerfectConstant.OPERATION.M_ORG.OPER_DRAG_DROP,
        type = OperationEnum.DRAG_DROP,
        logByIds = @LogByIdsAnnotion(
            name = PerfectConstant.OPERATION.M_ORG.OPER_DRAG_DROP,
            type = OperationEnum.DRAG_DROP,
            oper_info = "",
            table_name = PerfectConstant.OPERATION.M_ORG.TABLE_NAME,
            id_position = ParameterEnum.FIRST,
            ids = "#{beans.id}"
        )
    )
    @Transactional(rollbackFor = Exception.class)
    public Boolean dragsave2Db(List<MOrgEntity> list){
        // 编号重置
        for (MOrgEntity entity : list) {
            if(entity.getParent_id() != null){
                setParentSonCount(list, entity.getParent_id());
            }
        }
        // 更新开始
        for (MOrgEntity entity : list) {
            entity.setSon_count(entity.getSon_count() == null ? 0 : entity.getSon_count());
            entity.setU_id(SecurityUtil.getLoginUser_id());
            entity.setU_time(LocalDateTime.now());
            mapper.updateDragSave(entity);
        }
        return true;
    }

    /**
     * 设置儿子个数
     * @return
     */
    private List<MOrgEntity> setParentSonCount(List<MOrgEntity> entities, Long parent_id) {
        for(MOrgEntity entity : entities){
            if(entity.getId().equals(parent_id)){
                entity.setSon_count(entity.getSon_count() == null ? 1 : entity.getSon_count() + 1);
            }
        }
        return entities;
    }

    /**
     * 拖拽数据规整
     * @param beans         ：循环的beans
     * @param parent_bean   ：父亲bean
     * @param entities      ：最终返回的list bean
     * @param code          ：
     * @return
     */
    private List<MOrgEntity> dragData2List(List<? extends TreeNode> beans, MOrgEntity parent_bean, List<MOrgEntity> entities, int code) {
        for (TreeNode bean : beans) {
            code = code + 1;
            MOrgEntity entity = new MOrgEntity();
            entity.setId(bean.getId());
            entity.setParent_id(bean.getParent_id());
            if(parent_bean == null) {
                entity.setCode(String.format("%04d", code));
            } else {
                entity.setCode(parent_bean.getCode() + String.format("%04d", code));
            }
            entities.add(entity);
            if(bean.getChildren().size() !=0){
                dragData2List(bean.getChildren(), entity, entities, 0);
            }
        }
        return entities;
    }

    /**
     * 获取员工清单，为穿梭框服务
     * @return
     */
    @Override
    public MStaffPositionTransferVo getStaffTransferList(MStaffTransferVo condition) {

        MStaffPositionTransferVo rtn = new MStaffPositionTransferVo();
        // 获取全部用户
        rtn.setStaff_all(mapper.getAllStaffTransferList(condition));
        // 获取该岗位已经设置过得用户
        List<Long> rtnList = mapper.getUsedStaffTransferList(condition);
        rtn.setStaff_positions(rtnList.toArray(new Long[rtnList.size()]));
        return rtn;
    }

    /**
     * 设置员工关系，删除剔除的员工，增加选择的员工
     * @param bean 员工id list
     * @return
     */
    @Override
    public MStaffPositionTransferVo setStaffTransfer(MStaffTransferVo bean) {
        // 操作日志bean初始化
        CustomOperateBo cobo = new CustomOperateBo();
        cobo.setName(PerfectConstant.OPERATION.M_STAFF_ORG.OPER_POSITION_STAFF);
        cobo.setPlatform(PerfectConstant.PLATFORM.PC);
        cobo.setType(OperationEnum.BATCH_UPDATE_INSERT_DELETE);


        // 查询出需要剔除的员工list
        List<MStaffPositionOperationVo> deleteMemgerList = mapper.selete_delete_member(bean);
        // 查询出需要添加的员工list
        List<MStaffPositionOperationVo> insertMemgerList = mapper.selete_insert_member(bean);

        // 执行保存逻辑，并返回员工数量
        return self.saveMemberList(deleteMemgerList, insertMemgerList, cobo, bean);
    }

    /**
     * 保存员工关系，删除剔除的员工，增加选择的员工
     * @param deleteMemberList
     * @param insertMemgerList
     * @param cobo
     * @param bean
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    public MStaffPositionTransferVo saveMemberList(List<MStaffPositionOperationVo> deleteMemberList,
        List<MStaffPositionOperationVo> insertMemgerList,
        CustomOperateBo cobo,
        MStaffTransferVo bean) {

        List<CustomOperateDetailBo> detail = new ArrayList<>();

        // ---------------------------------操作日志 新增 start-----------------------------------------------------
        // 操作日志：记录删除前数据
        for(MStaffPositionOperationVo vo : deleteMemberList) {
            CustomOperateDetailBo<MStaffPositionOperationVo> bo = new CustomOperateDetailBo<>();
            bo.setName(cobo.getName());
            bo.setType(OperationEnum.DELETE);
            bo.setTable_name(PerfectConstant.OPERATION.M_STAFF_ORG.TABLE_NAME);
            bo.setNewData(null);
            bo.setOldData(vo);
            setColumnsMap(bo);
            detail.add(bo);
        }
        // ---------------------------------操作日志 新增 end-----------------------------------------------------

        // 删除剔除的员工
        List<MStaffOrgEntity> delete_list =
            BeanUtilsSupport.copyProperties(deleteMemberList, MStaffOrgEntity.class, new String[] {"c_time", "u_time"});
        List<Long> ids = Lists.newArrayList();
        delete_list.forEach(beans -> {
            ids.add(beans.getId());
        });
        if (ArrayPfUtil.isNotEmpty(ids)) {
            mStaffOrgService.removeByIds(ids);
        }

        // 增加选择的员工
        Long[] staff_positions = new Long[insertMemgerList.size()];
        int i = 0;
        List<MStaffOrgEntity> mStaffOrgEntities = new ArrayList<>();
        for( MStaffPositionOperationVo vo : insertMemgerList ) {
            MStaffOrgEntity mStaffOrgEntity = new MStaffOrgEntity();
            mStaffOrgEntity.setStaff_id(vo.getId());
            mStaffOrgEntity.setSerial_id(bean.getPosition_id());
            mStaffOrgEntity.setSerial_type(PerfectDictConstant.DICT_SYS_CODE_TYPE_M_POSITION);
            mStaffOrgEntity.setTenant_id(bean.getTenant_id());
            mStaffOrgEntities.add(mStaffOrgEntity);

            staff_positions[i] = vo.getId();
            i = i + 1;
        }

        mStaffOrgService.saveBatch(mStaffOrgEntities);

        // ---------------------------------操作日志 新增 start-----------------------------------------------------
        // 记录更新后数据
        MStaffTransferVo condition = new MStaffTransferVo();
        condition.setTenant_id(bean.getTenant_id());
        condition.setPosition_id(bean.getPosition_id());
        condition.setStaff_positions(staff_positions);
        List<MStaffPositionOperationVo> seleteMemgerList = mapper.selete_member(bean);
        for(MStaffPositionOperationVo vo: seleteMemgerList) {
            // 操作日志：记录新增数据
            CustomOperateDetailBo<MStaffPositionOperationVo> bo = new CustomOperateDetailBo<>();
            bo.setName(cobo.getName());
            bo.setType(OperationEnum.ADD);
            bo.setTable_name(PerfectConstant.OPERATION.M_STAFF_ORG.TABLE_NAME);
            bo.setNewData(vo);
            bo.setOldData(null);
            setColumnsMap(bo);
            detail.add(bo);
        }
        cobo.setDetail(detail);
        // ---------------------------------操作日志 新增 end-----------------------------------------------------

        // 保存操作日志
        sLogOperService.save(cobo);

        // 查询最新数据并返回
        // 获取该岗位已经设置过得用户
        List<Long> rtnList = mapper.getUsedStaffTransferList(condition);
        MStaffPositionTransferVo mStaffPositionTransferVo = new MStaffPositionTransferVo();
        mStaffPositionTransferVo.setStaff_positions_count(rtnList.size());
        return mStaffPositionTransferVo;
    }

    /**
     * 设置列相对应的列名称
     */
    private void setColumnsMap(CustomOperateDetailBo<MStaffPositionOperationVo> bean){
        Map<String, String> columns = new ConcurrentHashMap<>();
        columns.put("staff_name", "员工名称");
        columns.put("position_name", "岗位名称");
        columns.put("c_id", "新增人id");
        columns.put("c_time", "新增时间");
        columns.put("u_id", "更新人id");
        columns.put("u_time", "更新时间");
        bean.setColumns(columns);
    }

    /**
     * 获取列表，页面查询
     *
     * @param searchCondition
     * @return
     */
    @Override
    public MStaffTabVo selectStaff(MStaffTabDataVo searchCondition) {
        MStaffTabVo mStaffTabVo = new MStaffTabVo();
        searchCondition.setTenant_id(getUserSessionTenantId());
        // 这个需要提前运行
        mStaffTabVo.setCurrentOrgStaffCount(getCurrentOrgStaffCount(searchCondition));

        /**
         * 表数据
         * 判断是当前组织下还是全部员工
         * 0:当前组织
         * 1：全部员工
         * */
        if (searchCondition.getActive_tabs_index() == 1){
            // 1：全部员工
            mStaffTabVo.setList(mapper.getAllOrgStaff(searchCondition));
        } else {
            // 0:当前组织
            mStaffTabVo.setList(mapper.selectStaff(searchCondition));
        }

        // count 数据
        mStaffTabVo.setAllOrgStaffCount(getAllOrgStaffCount(searchCondition));
        return mStaffTabVo;
    }

    /**
     * 获取当组织下员工count
     */
    @Override
    public Integer getCurrentOrgStaffCount(MStaffTabDataVo searchCondition) {
        return mapper.getCurrentOrgStaffCount(searchCondition);
    }

    /**
     * 获取所有员工count
     */
    @Override
    public Integer getAllOrgStaffCount(MStaffTabDataVo searchCondition) {
        /**
         * 考虑所有员工的方法
         * 1:根据code的定义规则，0001xxxx|xxxx|，每4位为一个层，所以找到第一组的4个
         * 2：并设置回code中去
         *
         * 2020.04.26 updated：该方法不适合，只需要判断，用户表中租户=参数，即可
         */
//        String _code = searchCondition.getCode();
//        _code = StrUtil.sub(_code, 0, 4);
//        searchCondition.setCode(_code);
        return mapper.getAllOrgStaffCount(searchCondition);
    }
}
