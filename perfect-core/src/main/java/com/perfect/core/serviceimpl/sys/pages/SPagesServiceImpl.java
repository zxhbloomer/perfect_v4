package com.perfect.core.serviceimpl.sys.pages;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.sys.pages.SPagesEntity;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.DeleteResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.DeleteResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.vo.sys.pages.SPagesVo;
import com.perfect.common.exception.BusinessException;
import com.perfect.core.mapper.sys.pages.SPagesMapper;
import com.perfect.core.service.sys.pages.ISPagesService;
import com.perfect.core.utils.mybatis.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 页面表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2020-06-05
 */
@Service
public class SPagesServiceImpl extends ServiceImpl<SPagesMapper, SPagesEntity> implements ISPagesService {

    @Autowired
    private SPagesMapper mapper;

    /**
     * 获取列表，页面查询
     *
     * @param searchCondition
     * @return
     */
    @Override
    public IPage<SPagesVo> selectPage(SPagesVo searchCondition) {
        // 分页条件
        Page<SPagesVo> pageCondition =
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
    public List<SPagesVo> select(SPagesVo searchCondition) {
        // 查询 数据
        List<SPagesVo> list = mapper.select(searchCondition);
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
    public InsertResult<Integer> insert(SPagesEntity entity) {
        // 编码如果为空，自动生成编码
//        if(StringUtil.isEmpty(entity.getName())){
//            entity.setName(autoCode.autoCode().getCode());
//        }
        // 插入前check
        CheckResult cr = checkLogic(entity.getName(), entity.getCode(), CheckResult.INSERT_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 插入逻辑保存
        return InsertResultUtil.OK(mapper.insert(entity));
    }

    /**
     * 更新一条记录（选择字段，策略更新）
     *
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public UpdateResult<Integer> update(SPagesEntity entity) {
        // 更新前check
        CheckResult cr = checkLogic(entity.getName(), entity.getCode(), CheckResult.UPDATE_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 更新逻辑保存
        entity.setC_id(null);
        entity.setC_time(null);
        return UpdateResultUtil.OK(mapper.updateById(entity));
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param name
     * @return
     */
    @Override
    public List<SPagesVo> selectByName(String name) {
        // 查询 数据
        List<SPagesVo> list = mapper.selectByName(name);
        return list;
    }

    /**
     * 获取列表，查询所有数据
     *
     * @param code
     * @return
     */
    @Override
    public List<SPagesVo> selectByCode(String code) {
        // 查询 数据
        List<SPagesVo> list = mapper.selectByCode(code);
        return list;
    }

    /**
     * check逻辑
     *
     * @return
     */
    public CheckResult checkLogic(String name, String code, String moduleType) {
        List<SPagesVo> selectByName = selectByName(name);
        List<SPagesVo> selectByKey = selectByCode(code);

        switch (moduleType) {
            case CheckResult.INSERT_CHECK_TYPE:
                // 新增场合，不能重复
                if (selectByName.size() >= 1) {
                    return CheckResultUtil.NG("新增保存出错：参数名称出现重复", name);
                }
                if (selectByKey.size() >= 1) {
                    return CheckResultUtil.NG("新增保存出错：参数键名出现重复", code);
                }
                break;
            case CheckResult.UPDATE_CHECK_TYPE:
                // 更新场合，不能重复设置
                if (selectByName.size() >= 2) {
                    return CheckResultUtil.NG("新增保存出错：参数名称出现重复", name);
                }
                if (selectByKey.size() >= 2) {
                    return CheckResultUtil.NG("新增保存出错：参数键名出现重复", code);
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
    public SPagesVo selectByid(Long id) {
        // 查询 数据
        return mapper.selectId(id);
    }

    /**
     * 批量删除
     *
     * @param searchCondition
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public DeleteResult<Integer> realDeleteByIdsIn(List<SPagesVo> searchCondition) {
        List<Long> idList = new ArrayList<>();
        searchCondition.forEach(bean -> {
            idList.add(bean.getId());
        });
        int result=mapper.deleteBatchIds(idList);
        return DeleteResultUtil.OK(result);
    }
}
