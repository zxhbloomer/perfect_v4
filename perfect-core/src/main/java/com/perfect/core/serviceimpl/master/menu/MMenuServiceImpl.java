package com.perfect.core.serviceimpl.master.menu;

import com.perfect.bean.entity.master.menu.MMenuEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.DeleteResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.DeleteResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.utils.common.tree.TreeUtil;
import com.perfect.bean.vo.master.menu.MMenuDataVo;
import com.perfect.bean.vo.master.menu.MMenuPageFunctionVo;
import com.perfect.bean.vo.master.menu.MMenuVo;
import com.perfect.common.constant.PerfectDictConstant;
import com.perfect.common.exception.BusinessException;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.common.utils.bean.BeanUtilsSupport;
import com.perfect.common.utils.string.StringUtil;
import com.perfect.core.mapper.master.menu.MMenuMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.master.menu.IMMenuService;
import com.perfect.core.serviceimpl.common.autocode.SysMenuAutoCodeImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
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
public class MMenuServiceImpl extends BaseServiceImpl<MMenuMapper, MMenuEntity> implements IMMenuService {

    @Autowired
    private MMenuMapper mapper;
    @Autowired
    private SysMenuAutoCodeImpl sysMenuAutoCode;

    /**
     * 获取列表，查询所有数据
     *
     * @param searchCondition
     * @return
     */
    @Override
    public MMenuVo getTreeData(MMenuDataVo searchCondition) {
        MMenuVo MMenuVo = new MMenuVo();
        // 查询 菜单 数据
        List<MMenuDataVo> list = mapper.select(searchCondition);
        setDepthId(list);
        // 设置树bean
        List<MMenuDataVo> rtnList = TreeUtil.getTreeList(list);
        // 获取按钮清单
        List<MMenuPageFunctionVo> pageFunctionVoList = mapper.getAllMenuButton(searchCondition);

        MMenuVo.setMenu_data(rtnList);
        MMenuVo.setMenu_buttons(pageFunctionVoList);

        return MMenuVo;
    }


    /**
     * 级联：获取列表，查询所有数据
     *
     * @param searchCondition
     * @return
     */
    @Override
    public List<MMenuDataVo> getCascaderList(MMenuVo searchCondition) {
        // 查询 数据
        List<MMenuDataVo> list = mapper.getCascaderList(searchCondition);
        setDepthId(list);
        List<MMenuDataVo> rtnList = TreeUtil.getTreeList(list);
        return rtnList;
    }

    /**
     * 格式化depth_id，parent_depth_id成数组
     * @param list
     */
    private void setDepthId(List<MMenuDataVo> list){
        // 循环结果，格式化depth_id，parent_depth_id成数组
        for (MMenuDataVo vo:list) {
            // 格式化depth_id
            if(vo.getDepth_id() != null) {
                String[] split_depth_id = vo.getDepth_id().split(",");
                List<Long> depth_id_array = new ArrayList<>();
                for (int i = 0; i < split_depth_id.length; i++) {
                    depth_id_array.add(Long.valueOf(split_depth_id[i]));
                }
                vo.setDepth_id_array(depth_id_array);
            }
            // 格式化parent_depth_id
            if(vo.getParent_depth_id() != null) {
                String[] split_parent_depth_id = vo.getParent_depth_id().split(",");
                List<Long> parent_depth_id_array = new ArrayList<>();
                for (int i = 0; i < split_parent_depth_id.length; i++) {
                    parent_depth_id_array.add(Long.valueOf(split_parent_depth_id[i]));
                }
                vo.setParent_depth_id_array(parent_depth_id_array);
            }
        }
    }

    /**
     * 级联：获取列表，查询所有数据
     *
     * @param searchCondition
     * @return
     */
    @Override
    public MMenuVo getCascaderGet(MMenuVo searchCondition) {
        // 查询 数据
        MMenuVo vo = mapper.getCascaderGet(searchCondition);
        return vo;
    }

    /**
     * 查询by id，返回结果
     *
     * @param id
     * @return
     */
    @Override
    public MMenuDataVo selectByid(Long id) {
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
    public List<MMenuEntity> selectIdsIn(List<MMenuVo> searchCondition) {
        // 查询 数据
        List<MMenuEntity> list = mapper.selectIdsIn(searchCondition);
        return list;
    }

    /**
     * 批量删除复原
     * @param searchCondition
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void visibleByIdsIn(List<MMenuVo> searchCondition) {
        List<MMenuEntity> list = mapper.selectIdsIn(searchCondition);
        list.forEach(
            bean -> {
                bean.setVisible(!bean.getVisible());
            }
        );
        saveOrUpdateBatch(list, 500);
    }

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param vo
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public InsertResult<MMenuDataVo> addMenuGroup(MMenuDataVo vo) {

        MMenuEntity entity = (MMenuEntity)BeanUtilsSupport.copyProperties(vo, MMenuEntity.class);

        // 插入前check
        CheckResult cr = checkLogicGroupEdit(entity, CheckResult.INSERT_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 插入逻辑保存
        entity.setVisible(false);
        entity.setType(PerfectDictConstant.DICT_SYS_MENU_TYPE_ROOT);
        entity.setPath("/");
        entity.setFull_path("/");
        // 获取id
        int insertCount = mapper.insert(entity);
        if(insertCount ==0){
            throw new InsertErrorException("保存失败，请查询后重新再试。");
        }
        // 修改root_id
        entity.setRoot_id(entity.getId());
        // 更新数据库
        entity.setC_id(null);
        entity.setC_time(null);
        if(StringUtil.isEmpty(entity.getCode())){
            entity.setCode(sysMenuAutoCode.autoCode().getCode());
        }
        int updCount = mapper.updateById(entity);
        if(updCount ==0){
            throw new UpdateErrorException("保存失败，请查询后重新再试。");
        }
        // 设置返回值
        return InsertResultUtil.OK(this.selectByid(entity.getId()));
    }

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param vo
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public InsertResult<MMenuDataVo> addSubNode(MMenuDataVo vo) {

        MMenuEntity entity = (MMenuEntity)BeanUtilsSupport.copyProperties(vo, MMenuEntity.class);

        // 插入逻辑保存
        entity.setVisible(false);

        // 获取父亲的entity
        MMenuEntity parentEntity = getById(entity.getParent_id());
        Integer son_count = parentEntity.getSon_count();
        son_count = (son_count == null ? 0 : son_count)  + 1;
        parentEntity.setSon_count(son_count);
        // 保存父亲的儿子的个数
        parentEntity.setC_id(null);
        parentEntity.setC_time(null);
        if(mapper.updateById(parentEntity) == 0){
            throw new UpdateErrorException("保存失败，请查询后重新再试。");
        }
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
        CheckResult cr = checkLogicGroupEdit(entity, CheckResult.INSERT_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }

        // 设置type
        entity.setType(PerfectDictConstant.DICT_SYS_MENU_TYPE_NODE);

        // 设置路径
        entity.setParent_path(vo.getParent_path());
        entity.setPath(vo.getPath());
        entity.setFull_path(vo.getFull_path());

        // 保存
        if(mapper.insert(entity) == 0){
            throw new UpdateErrorException("保存失败，请查询后重新再试。");
        }
        // 设置返回值
        return InsertResultUtil.OK(this.selectByid(entity.getId()));
    }

    /**
     * 插入一条记录（选择字段，策略插入）
     * @param vo
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public InsertResult<MMenuDataVo> addSubMenu(MMenuDataVo vo) {

        MMenuEntity entity = (MMenuEntity)BeanUtilsSupport.copyProperties(vo, MMenuEntity.class);

        // 插入逻辑保存
        entity.setVisible(false);

        // 获取父亲的entity
        MMenuEntity parentEntity = getById(entity.getParent_id());
        Integer son_count = parentEntity.getSon_count();
        son_count = (son_count == null ? 0 : son_count)  + 1;
        parentEntity.setSon_count(son_count);
        // 保存父亲的儿子的个数
        parentEntity.setC_id(null);
        parentEntity.setC_time(null);
        if(mapper.updateById(parentEntity) == 0){
            throw new UpdateErrorException("保存失败，请查询后重新再试。");
        }
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
        CheckResult cr = checkLogicGroupEdit(entity, CheckResult.INSERT_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }

        // 设置type
        entity.setType(PerfectDictConstant.DICT_SYS_MENU_TYPE_NODE);

        // 设置路径
        entity.setPath(vo.getFull_path());

        // 保存
        if(mapper.insert(entity) == 0){
            throw new UpdateErrorException("保存失败，请查询后重新再试。");
        }
        // 设置返回值
        return InsertResultUtil.OK(this.selectByid(entity.getId()));
    }

    /**
     * 更新一条记录（选择字段，策略更新）
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public UpdateResult<MMenuDataVo> update(MMenuEntity entity) {
        // 更新前check
        CheckResult cr = checkLogicGroupEdit(entity, CheckResult.UPDATE_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 更新逻辑保存
        entity.setC_id(null);
        entity.setC_time(null);
        if(mapper.updateById(entity) == 0) {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
        return UpdateResultUtil.OK(this.selectByid(entity.getId()));
    }

    /**
     * 批量删除复原
     *
     * @param searchCondition
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public DeleteResult<String> realDeleteByCode(MMenuVo searchCondition) {
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
    public List<MMenuEntity> selectByCode(String code, Long equal_id, Long not_equal_id) {
        // 查询 数据
        List<MMenuEntity> list = mapper.selectByCode(code, equal_id, not_equal_id);
        return list;
    }
    /**
     * check逻辑
     * @return
     */
    public CheckResult checkLogicGroupEdit(MMenuEntity entity, String moduleType){
        switch (moduleType) {
            case CheckResult.INSERT_CHECK_TYPE:
                // 新增场合，不能重复
                List<MMenuEntity> codeList_insertCheck = selectByCode(entity.getCode(), null, null);
                if (codeList_insertCheck.size() >= 1) {
                    return CheckResultUtil.NG("新增保存出错：菜单组编号【"+ entity.getCode() +"】出现重复", entity.getCode());
                }
                break;
            case CheckResult.UPDATE_CHECK_TYPE:
                // 更新场合，不能重复设置
                List<MMenuEntity> codeList_updCheck = selectByCode(entity.getCode(), null, entity.getId());
                if (codeList_updCheck.size() >= 1) {
                    return CheckResultUtil.NG("更新保存出错：菜单组编号【"+ entity.getCode() +"】出现重复", entity.getCode());
                }
                break;
            default:
        }
        return CheckResultUtil.OK();
    }
}
