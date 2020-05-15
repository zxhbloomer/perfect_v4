package com.perfect.core.mapper.master.org;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.perfect.bean.entity.master.org.MOrgDeptCompanyEntity;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 企业与集团关系表，企业不存在嵌套 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2020-05-15
 */
@Repository
public interface MOrgDeptCompanyMapper extends BaseMapper<MOrgDeptCompanyEntity> {

}
