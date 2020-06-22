package com.perfect.core.serviceimpl.sys.pages;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.sys.pages.SPagesFunctionEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.DeleteResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.DeleteResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.vo.sys.pages.SPagesFunctionVo;
import com.perfect.common.exception.BusinessException;
import com.perfect.common.utils.bean.BeanUtilsSupport;
import com.perfect.core.mapper.sys.pages.SPagesFunctionMapper;
import com.perfect.core.service.sys.pages.ISPagesFunctionService;
import com.perfect.core.utils.mybatis.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 页面按钮表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2020-06-05
 */
@Service
public class SPagesFunctionServiceImpl extends ServiceImpl<SPagesFunctionMapper, SPagesFunctionEntity> implements
    ISPagesFunctionService {

    @Autowired
    private SPagesFunctionMapper mapper;

    /**
     * 获取列表，页面查询
     *
     * @param searchCondition
     * @return
     */
    @Override
    public IPage<SPagesFunctionVo> selectPage(SPagesFunctionVo searchCondition) {
        // 分页条件
        Page<SPagesFunctionVo> pageCondition =
            new Page(searchCondition.getPageCondition().getCurrent(), searchCondition.getPageCondition().getSize());
        // 通过page进行排序
        PageUtil.setSort(pageCondition, searchCondition.getPageCondition().getSort());
        return mapper.selectPage(pageCondition, searchCondition);
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param searchCondition
     * @return
     */
    @Override
    public List<SPagesFunctionVo> select(SPagesFunctionVo searchCondition) {
        // 查询 数据
        List<SPagesFunctionVo> list = mapper.select(searchCondition);
        return list;
    }

    /**
     * 插入一条记录（选择字段，策略插入）
     *
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public InsertResult<Integer> insert(SPagesFunctionVo entity) {
        // 插入前check
        CheckResult cr = checkLogic(entity, CheckResult.INSERT_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 插入逻辑保存
        SPagesFunctionEntity sf = (SPagesFunctionEntity) BeanUtilsSupport.copyProperties(entity, SPagesFunctionEntity.class);
        return InsertResultUtil.OK(mapper.insert(sf));
    }

    /**
     * 更新一条记录（选择字段，策略更新）
     *
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public UpdateResult<Integer> update(SPagesFunctionVo entity) {
        // 更新前check
        CheckResult cr = checkLogic(entity, CheckResult.UPDATE_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 更新逻辑保存
        entity.setC_id(null);
        entity.setC_time(null);

        SPagesFunctionEntity sf = (SPagesFunctionEntity) BeanUtilsSupport.copyProperties(entity, SPagesFunctionEntity.class);
        return UpdateResultUtil.OK(mapper.updateById(sf));
    }

    /**
     * check逻辑
     *
     * @return
     */
    public CheckResult checkLogic(SPagesFunctionVo vo, String moduleType) {

        switch (moduleType) {
            case CheckResult.INSERT_CHECK_TYPE:
                // 新增场合，不能重复
                SPagesFunctionVo insertCondition = (SPagesFunctionVo) BeanUtilsSupport.copyProperties(vo, SPagesFunctionVo.class);
                insertCondition.setId(null);
                List<SPagesFunctionVo> insertRtnList = selectByPageIdAndFunctionId(insertCondition);
                if (insertRtnList.size() >= 1) {
                    return CheckResultUtil.NG("新增保存出错：页面名称【"+ insertRtnList.get(0).getPage_name() +"】、"
                                                             + "按钮名称【" + insertRtnList.get(0).getFunction_name() + "】"
                                                             +"出现重复!", vo.getId());
                }
                break;
            case CheckResult.UPDATE_CHECK_TYPE:
                // 新增场合，不能重复
                SPagesFunctionVo updCondition = (SPagesFunctionVo) BeanUtilsSupport.copyProperties(vo, SPagesFunctionVo.class);
                updCondition.setNe_id(vo.getId());
                updCondition.setId(null);
                List<SPagesFunctionVo> updRtnList = selectByPageIdAndFunctionId(updCondition);
                if (updRtnList.size() >= 1) {
                    return CheckResultUtil.NG("更新保存出错：页面名称【"+ updRtnList.get(0).getPage_name() +"】、"
                                                              + "按钮名称【" + updRtnList.get(0).getFunction_name() + "】"
                                                              +"出现重复!", vo.getId());
                }
                break;
            default:
        }
        return CheckResultUtil.OK();
    }

    /**
     * 查询by id，返回结果
     *
     * @param id
     * @return
     */
    @Override
    public SPagesFunctionVo selectByid(Long id) {
        SPagesFunctionVo condition = new SPagesFunctionVo();
        // 查询 数据
        condition.setId(id);
        return mapper.selectId(condition);
    }

    /**
     * 批量删除
     *
     * @param searchCondition
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public DeleteResult<Integer> realDeleteByIdsIn(List<SPagesFunctionVo> searchCondition) {
        List<Long> idList = new ArrayList<>();
        searchCondition.forEach(bean -> {
            idList.add(bean.getId());
        });
        int result=mapper.deleteBatchIds(idList);
        return DeleteResultUtil.OK(result);
    }

    /**
     * 获取列表，查询所有数据
     *
     * @return
     */
    public List<SPagesFunctionVo> selectByPageIdAndFunctionId(SPagesFunctionVo vo) {
        return mapper.selectByPageIdAndFunctionId(vo);
    }

}
