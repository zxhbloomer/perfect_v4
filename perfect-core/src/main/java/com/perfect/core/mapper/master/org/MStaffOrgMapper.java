package com.perfect.core.mapper.master.org;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.master.org.MStaffOrgEntity;
import com.perfect.bean.vo.master.org.MStaffTabVo;
import com.perfect.common.constant.PerfectDictConstant;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 用户组织机构关系表 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Deprecated
@Repository
public interface MStaffOrgMapper extends BaseMapper<MStaffOrgEntity> {

    /**
     * 和 MOrgMapper.java 的COMMON_TREE_SELECT相同
     */
    String MORGMAPPER_CLASS_COMMON_TREE_SELECT = "                                                                                                "
        + "         WITH recursive cte AS (                                                                             "
        + "               SELECT                                                                                        "
        + "                      t0.id,                                                                                 "
        + "                      t0.id as value,                                                                        "
        + "                      t0.tenant_id,                                                                          "
        + "                      t0.parent_id ,                                                                         "
        + "                      1 level,                                                                               "
        + "                      cast(t0.id as char(50)) depth_id                                                       "
        + "                 FROM                                                                                        "
        + "                      m_org t0                                                                               "
        + "                where t0.parent_id is null                                                                   "
        + "         UNION ALL                                                                                           "
        + "               SELECT                                                                                        "
        + "                      t2.id,                                                                                 "
        + "                      t2.id as value,                                                                        "
        + "                      t2.tenant_id,                                                                          "
        + "                      t2.parent_id,                                                                          "
        + "                      t1.level + 1 as level,                                                                 "
        + "                      CONCAT( cast(t1.depth_id as char(50)),',',cast(t2.id as char(50))) depth_id            "
        + "                 FROM                                                                                        "
        + "                      m_org t2,                                                                              "
        + "                      cte t1                                                                                 "
        + "               WHERE                                                                                         "
        + "                      t2.parent_id = t1.id                                                                   "
        + "               )                                                                                             "
        + "              select t1.id ,                                                                                 "
        + "                     t2.code ,                                                                               "
        + "                     t2.type ,                                                                               "
        + "                     t1.tenant_id ,                                                                          "
        + "                     t2.serial_id                                                                            "
         + "               from cte t1                                                                                  "
        + "          inner join m_org t2 on t1.id = t2.id                                                               "
        + "                                                                                                             ";


    /**
     * 页面查询列表
     * @param page
     * @param searchCondition
     * @return
     */
    @Select("    "
        + "      SELECT                                                                                                         "
        + "            	t1.* ,                                                                                                  "
        + "            	t2.label as sex_text,                                                                                   "
        + "            	t3.label as service_text,                                                                               "
        + "            	t4.label as degree_text,                                                                                "
        + "            	t5.label as is_wed_text,                                                                                "
        + "            	t6.name as company_name,                                                                                "
        + "            	t6.simple_name as company_simple_name,                                                                  "
        + "            	t7.name as dept_name,                                                                                   "
        + "            	t7.simple_name as dept_simple_name                                                                      "
        + "        FROM                                                                                                         "
        + "            	m_staff t1                                                                                              "
        + "            	LEFT JOIN v_dict_info AS t2 ON t2.code = '" + PerfectDictConstant.DICT_SYS_SEX_TYPE + "' and t2.dict_value = t1.sex                      "
        + "            	LEFT JOIN v_dict_info AS t3 ON t3.code = '" + PerfectDictConstant.DICT_USR_SERVICE_TYPE + "' and t3.dict_value = t1.service              "
        + "            	LEFT JOIN v_dict_info AS t4 ON t4.code = '" + PerfectDictConstant.DICT_USR_DEGREE_TYPE + "' and t4.dict_value = t1.degree                "
        + "             LEFT JOIN v_dict_info AS t5 ON t5.code = '" + PerfectDictConstant.DICT_USR_WED_TYPE + "' and t5.dict_value = t1.is_wed                   "
        + "             LEFT JOIN m_company AS t6 ON t6.id = t1.company_id                                                      "
        + "             LEFT JOIN m_dept AS t7 ON t7.id = t1.dept_id                                                            "
        + "       where true                                                                                                    "
        + "         and exists (                                                                                                "
        + "                select true                                                                                          "
        + "                  from m_staff_org subtab1                                                                           "
        + "                 where subtab1.staff_id = t1.id                                                                      "
        + "                   and subtab1.serial_type = '"+ PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION_SERIAL_TYPE +"'  "
        + "                   and subtab1.tenant_id = t1.tenant_id                                                              "
        + "                   and subtab1.serial_id in (                                                                        "
        + "                                              select subtab2.serial_id                                               "
        + "                                                from (" + MORGMAPPER_CLASS_COMMON_TREE_SELECT + ") subtab2           "
        + "                                               where subtab2.type = '"+ PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION +"'  "
        + "                                                 and subtab2.tenant_id = t1.tenant_id                                "
        + "                                                 and subtab2.code > #{p1.org_code,jdbcType=VARCHAR}                    "
        + "                                            )                                                                        "
        + "                    )                                                                                                "
        + "    and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null)           "
        + "    and (t1.is_del =#{p1.is_del,jdbcType=VARCHAR} or #{p1.is_del,jdbcType=VARCHAR} is null)                          "
        + "    and (t1.tenant_id =#{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)                   "
        + "      ")
    IPage<MStaffTabVo> selectPage(Page page, @Param("p1") MStaffTabVo searchCondition);


}
