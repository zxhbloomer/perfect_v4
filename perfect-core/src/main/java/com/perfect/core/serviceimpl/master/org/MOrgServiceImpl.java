package com.perfect.core.serviceimpl.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.bo.session.user.UserSessionBo;
import com.perfect.bean.entity.master.org.MCompanyEntity;
import com.perfect.bean.entity.master.org.MGroupEntity;
import com.perfect.bean.entity.master.org.MOrgEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.utils.common.tree.TreeUtil;
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
import com.perfect.common.utils.servlet.ServletUtil;
import com.perfect.core.mapper.master.org.MOrgMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.common.ICommonComponentService;
import com.perfect.core.service.master.org.IMOrgService;
import com.perfect.core.utils.mybatis.PageUtil;
import com.perfect.core.utils.security.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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
    ICommonComponentService iCommonComponentService;

    @Autowired
    private MOrgServiceImpl self;

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
        entity.setTenant_id(((UserSessionBo) ServletUtil.getUserSession()).getTenant_Id());
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
        rtn.setStaff_position(mapper.getUsedStaffTransferList(condition));
        return rtn;
    }

    /**
     * 设置员工关系，删除剔除的员工，增加选择的员工
     * @param staff_ids 员工id list
     * @return
     */
    @Override
    public MStaffPositionTransferVo setStaffTransfer(List<Long> staff_ids) {
        for( Long staff_id : staff_ids ) {

        }
        return null;
    }
}
