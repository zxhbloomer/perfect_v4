package com.perfect.core.mapper.master.org;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.perfect.bean.entity.master.org.MOrgDeptDeptEntity;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 部门与部门关系表，多部门嵌套关系表 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2020-05-15
 */
@Repository
public interface MOrgDeptDeptMapper extends BaseMapper<MOrgDeptDeptEntity> {

}
