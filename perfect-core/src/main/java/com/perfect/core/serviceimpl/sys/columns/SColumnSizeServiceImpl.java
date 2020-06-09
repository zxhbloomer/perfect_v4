package com.perfect.core.serviceimpl.sys.columns;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.entity.sys.columns.SColumnSizeEntity;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.vo.sys.columns.SColumnSizeVo;
import com.perfect.core.mapper.sys.columns.SColumnSizeMapper;
import com.perfect.core.service.sys.columns.ISColumnSizeService;
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

    /**
     * 获取列表，页面查询
     */
    @Override
    public List<SColumnSizeVo> selectPage(SColumnSizeVo searchCondition) {
        return null;
    }

    /**
     * 插入or更新
     * @param searchCondition
     */
    @Override
    public UpdateResult<Boolean> insertOrUpdate(SColumnSizeVo searchCondition) {
        SColumnSizeEntity entity = new SColumnSizeEntity();
        Boolean rtn = this.saveOrUpdate(entity);
        return UpdateResultUtil.OK(rtn);
    }
}
