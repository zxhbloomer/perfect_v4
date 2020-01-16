package com.perfect.core.serviceimpl.log.operate;

import com.perfect.bean.bo.log.operate.CustomOperateBo;
import com.perfect.bean.entity.log.operate.SLogOperEntity;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.utils.servlet.ServletUtil;
import com.perfect.common.utils.bean.BeanUtilsSupport;
import com.perfect.core.mapper.log.operate.SLogOperDetailMapper;
import com.perfect.core.mapper.log.operate.SLogOperMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.log.operate.ISLogOperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zxh
 * @since 2019-07-04
 */
@Service
public class SLogOperServiceImpl extends BaseServiceImpl<SLogOperMapper, SLogOperEntity> implements ISLogOperService {

    @Autowired
    SLogOperMapper mapper;

    @Autowired
    SLogOperDetailMapper sLogOperDetailMapper;

    /**
     * 插入一条记录
     * @return
     */
    @Override
    public InsertResult<Integer> save(CustomOperateBo cobo) {
        SLogOperEntity sLogOperEntity = (SLogOperEntity)BeanUtilsSupport.copyProperties(cobo, SLogOperEntity.class);
        sLogOperEntity.setOper_name(ServletUtil.getUserSession().getStaff_info().getName());
//        List<MDeptExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, MDeptExportVo.class);
        return null;
    }
}
