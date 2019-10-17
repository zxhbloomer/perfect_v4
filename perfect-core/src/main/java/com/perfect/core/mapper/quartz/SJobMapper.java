package com.perfect.core.mapper.quartz;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.quartz.SJobEntity;
import com.perfect.bean.vo.quartz.SJobVo;
import com.perfect.bean.vo.sys.config.config.SConfigVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author jobob
 * @since 2019-07-04
 */
@Repository
public interface SJobMapper extends BaseMapper<SJobEntity> {

    String common_column = "  "
        + "  	t.id,						"
        + "  	t.job_name,                  "
        + "  	t.job_group,                 "
        + "  	t.job_serial_code,           "
        + "  	t.job_desc,                  "
        + "  	t.job_simple_name,           "
        + "  	t.bean_name,                 "
        + "  	t.method_name,               "
        + "  	t.params,                    "
        + "  	t.cron_expression,           "
        + "  	t.`concurrent`,              "
        + "  	t.misfire_policy,            "
        + "  	t.isdel,                     "
        + "  	t.is_effected,               "
        + "  	t.run_time,                  "
        + "  	t.last_run_time,             "
        + "  	t.begin_date,                "
        + "  	t.end_date,                  "
        + "  	t.run_times,                 "
        + "  	t.c_id,                      "
        + "  	t.c_time,                    "
        + "  	t.u_id,                      "
        + "  	t.u_time                     ";



    @Select("    "
        + "  select             "
        + common_column
        + "    from s_job t"
        + "      ")
    List<SJobEntity> selectJobAll();

    @Select("    "
        + "  select             "
        + common_column
        + "    from s_job  t     "
        + "   where true         "
        + "    and (t.job_name like CONCAT ('%',#{p1.job_name,jdbcType=VARCHAR},'%') or #{p1.job_name,jdbcType=VARCHAR} is null) "
        + "    and (t.job_group like CONCAT ('%',#{p1.job_group,jdbcType=VARCHAR},'%') or #{p1.job_group,jdbcType=VARCHAR} is null) "
        + "    and (t.is_effected  = #{p1.is_effected} or #{p1.is_effected} is null) "
        + "      ")
    IPage<SJobEntity> selectJobList(Page page, @Param("p1") SJobVo searchCondition);

    @Select("                    "
        + "  select              "
        + common_column
        + "    from s_job t      "
        + "   where true         "
        + "    and (t.job_id = #{p1} or #{p1} is null) "
        + "                      ")
    SJobEntity selectJobById(Long id);
}
