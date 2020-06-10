package com.perfect.core.serviceimpl.sys.columns;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.sys.columns.SColumnSizeEntity;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.vo.sys.columns.SColumnSizeVo;
import com.perfect.core.mapper.sys.columns.SColumnSizeMapper;
import com.perfect.core.service.sys.columns.ISColumnSizeService;
import com.perfect.core.utils.security.SecurityUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 表格列宽 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2020-06-09
 */
@Service
public class SColumnSizeServiceImpl extends ServiceImpl<SColumnSizeMapper, SColumnSizeEntity> implements
    ISColumnSizeService {

    @Autowired
    private SColumnSizeMapper mapper;

    /**
     * 获取列表，页面查询
     */
    @Override
    public List<SColumnSizeVo> getData(SColumnSizeVo searchCondition) {
        /** 获取员工id */
        searchCondition.setStaff_id(SecurityUtil.getStaff_id());

        List<SColumnSizeVo> rtnBean =  mapper.getData(searchCondition);
        return rtnBean;
    }

    /**
     * 插入or更新
     * @param searchCondition
     */
    @Override
    public UpdateResult<Boolean> saveColumnsSize(SColumnSizeVo searchCondition) {
        SColumnSizeEntity entity = new SColumnSizeEntity();
        entity.setPage_code(searchCondition.getPage_code());
        entity.setType(searchCondition.getType());
        entity.setStaff_id(SecurityUtil.getStaff_id());
        entity.setColumn_property(searchCondition.getColumn_property());
        entity.setSize(searchCondition.getSize());
        Boolean rtn = this.saveOrUpdate(entity);
        return UpdateResultUtil.OK(rtn);
    }
}
