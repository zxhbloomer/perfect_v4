package com.perfect.core.mapper.master.org;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.master.org.MPositionEntity;
import com.perfect.bean.entity.master.org.MUserOrgEntity;
import com.perfect.bean.vo.master.org.MPositionVo;
import com.perfect.common.constant.PerfectDictConstant;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 用户组织机构关系表 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Repository
public interface MUserOrgMapper extends BaseMapper<MUserOrgEntity> {

}
