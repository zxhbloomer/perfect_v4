package com.perfect.core.mapper.master.org;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.perfect.bean.entity.master.org.MOrgCompanyDeptEntity;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
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
public interface MOrgCompanyDeptMapper extends BaseMapper<MOrgCompanyDeptEntity> {

    @Delete("                                                                        "
        + "     delete from m_org_company_dept t                                     "
        + "      where t.current_id = #{p1}                                          "
    )
    int delOCDRelation(@Param("p1")Long id);
}
