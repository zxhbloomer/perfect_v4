package com.perfect.core.serviceimpl.log.operate;

import com.perfect.bean.bo.log.operate.CustomOperateBo;
import com.perfect.bean.bo.log.operate.CustomOperateDetailBo;
import com.perfect.bean.entity.log.operate.SLogOperDetailEntity;
import com.perfect.bean.entity.log.operate.SLogOperEntity;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.utils.servlet.ServletUtil;
import com.perfect.common.constant.PerfectConstant;
import com.perfect.common.constant.PerfectDictConstant;
import com.perfect.common.utils.bean.BeanUtilsSupport;
import com.perfect.core.mapper.log.operate.SLogOperDetailMapper;
import com.perfect.core.mapper.log.operate.SLogOperMapper;
import com.perfect.core.service.base.v1.BaseServiceImpl;
import com.perfect.core.service.log.operate.ISLogOperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
    SLogOperDetailServiceImpl sLogOperDetailService;

    /**
     * 插入记录，包含主表和从表
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public InsertResult<Integer> save(CustomOperateBo cobo) {
        SLogOperEntity sLogOperEntity = (SLogOperEntity)BeanUtilsSupport.copyProperties(cobo, SLogOperEntity.class);
        sLogOperEntity.setOper_name(ServletUtil.getUserSession().getStaff_info().getName());
        sLogOperEntity.setOper_time(LocalDateTime.now());
        sLogOperEntity.setOper_id(ServletUtil.getUserSession().getAccountId());

        mapper.insert(sLogOperEntity);

        // 定义子表的bean
        List<SLogOperDetailEntity> sLogOperDetailEntities = new ArrayList<>();
        List<CustomOperateDetailBo> detail = cobo.getDetail();
        for(CustomOperateDetailBo bo : detail){

            Iterator<Map.Entry<String, String>> entries = bo.getColumns().entrySet().iterator();
            while (entries.hasNext()) {
                Map.Entry<String, String> entry = entries.next();
                System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());

                SLogOperDetailEntity sLogOperDetailEntity = new SLogOperDetailEntity();
                sLogOperDetailEntity.setOper_id(sLogOperEntity.getId());
                sLogOperDetailEntity.setName(bo.getName());
                sLogOperDetailEntity.setType(bo.getType().getName());
                sLogOperDetailEntity.setOper_info(bo.getOper_info());
                sLogOperDetailEntity.setTable_name(bo.getTable_name());
                sLogOperDetailEntity.setClm_name(entry.getKey());
                sLogOperDetailEntity.setClm_comment(entry.getValue());
            }

            xxxxx

            SLogOperDetailEntity sLogOperDetailEntity = (SLogOperDetailEntity)BeanUtilsSupport.copyProperties(cobo, SLogOperDetailEntity.class);;
            sLogOperDetailEntity.setOper_id(sLogOperEntity.getId());
            sLogOperDetailEntity.setTable_name(PerfectConstant.OPERATION.M_STAFF_ORG.TABLE_NAME);
            sLogOperDetailEntities.add(sLogOperDetailEntity);
        }
        sLogOperDetailService.saveBatch(sLogOperDetailEntities);

        return InsertResultUtil.OK(mapper.insert(sLogOperEntity));
    }
}
