package com.perfect.core.serviceimpl.master.org;

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
import com.perfect.bean.vo.master.org.*;
import com.perfect.common.constant.PerfectDictConstant;
import com.perfect.common.exception.BusinessException;
import com.perfect.common.utils.servlet.ServletUtil;
import com.perfect.core.mapper.master.org.MOrgMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.common.ICommonComponentService;
import com.perfect.core.service.master.org.IMOrgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    public MOrgAllDataVo getAllOrgData(MOrgVo searchCondition) {
        MOrgAllDataVo mOrgAllDataVo = new MOrgAllDataVo();
        // 1:获取 组织数据
        List<MOrgTreeVo> listOrg = select(searchCondition);
        mOrgAllDataVo.setOrgs(listOrg);

        // 1:获取 组织数据
        List<MGroupEntity> listGroup = mapper.getGroupList(searchCondition);
        mOrgAllDataVo.setGroups(listGroup);

        // 2:获取 企业信息
        List<MCompanyEntity> listcompany = mapper.getCompanyList(searchCondition);
        mOrgAllDataVo.setCompanies(listcompany);

        // 3:获取 部门信息
        List<MDeptVo> listDept =  mapper.getDeptList(searchCondition);
        mOrgAllDataVo.setDepts(listDept);

        // 4:获取 岗位信息
        List<MPositionVo> listPosition =  mapper.getPositionList(searchCondition);
        mOrgAllDataVo.setPositions(listPosition);

        // 5:获取 员工信息
        // TODO:需要有管理，尚未处理

        // 6:获取 数量

        return mOrgAllDataVo;
    }

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
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

}
