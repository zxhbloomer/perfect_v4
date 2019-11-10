package com.perfect.core.mapper.master.user;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.master.user.MStaffEntity;
import com.perfect.bean.vo.master.MAddressVo;
import com.perfect.bean.vo.master.user.MStaffExportVo;
import com.perfect.bean.vo.master.user.MStaffVo;
import com.perfect.common.constant.PerfectDictConstant;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 员工 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2019-07-13
 */
@Repository
public interface MStaffMapper extends BaseMapper<MStaffEntity> {

    String common_select = "       "
        + "      SELECT                                                                                                         "
        + "            	t1.* ,                                                                                                  "
        + "            	t2.label as sex_text,                                                                                   "
        + "            	t3.label as service_text,                                                                               "
        + "            	t4.label as degree_text,                                                                                "
        + "            	t5.label as is_wed_text                                                                                 "
        + "        FROM                                                                                                         "
        + "            	m_staff t1                                                                                              "
        + "            	LEFT JOIN v_dict_info AS t2 ON t2.code = '" + PerfectDictConstant.DICT_SYS_SEX_TYPE + "' and t2.dict_value = t1.sex                      "
        + "            	LEFT JOIN v_dict_info AS t3 ON t3.code = '" + PerfectDictConstant.DICT_USR_SERVICE_TYPE + "' and t3.dict_value = t1.service              "
        + "            	LEFT JOIN v_dict_info AS t4 ON t4.code = '" + PerfectDictConstant.DICT_USR_DEGREE_TYPE + "' and t4.dict_value = t1.degree                "
        + "             LEFT JOIN v_dict_info AS t5 ON t5.code = '" + PerfectDictConstant.DICT_USR_WED_TYPE + "' and t5.dict_value = t1.is_wed                   "
        + "       where true                                                                                                    "
        + "                    ";

    /**
     * 页面查询列表
     * @param page
     * @param searchCondition
     * @return
     */
    @Select("    "
        + common_select
        + "    and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null)           "
        + "    and (t1.is_del =#{p1.is_del,jdbcType=VARCHAR} or #{p1.is_del,jdbcType=VARCHAR} is null)                          "
        + "      ")
    IPage<MStaffVo> selectPage(Page page, @Param("p1") MStaffVo searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param searchCondition
     * @return
     */
    @Select("    "
        + common_select
        + "    and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null)           "
        + "    and (t1.is_del =#{p1.is_del,jdbcType=VARCHAR} or #{p1.is_del,jdbcType=VARCHAR} is null)                          "
        + "      ")
    List<MStaffVo> select(@Param("p1") MStaffVo searchCondition);

    /**
     * 没有分页，按id筛选条件
     * @param searchCondition
     * @return
     */
    @Select("<script>"
        + common_select
        + "  and t1.id in "
        + "        <foreach collection='p1' item='item' index='index' open='(' separator=',' close=')'>"
        + "         #{item.id}  "
        + "        </foreach>"
        + "  </script>")
    List<MStaffVo> selectIdsIn(@Param("p1") List<MStaffVo> searchCondition);

    /**
     * 没有分页，按id筛选条件
     * @param searchCondition
     * @return
     */
    @Select("<script>"
        + common_select
        + "  and t1.id in "
        + "        <foreach collection='p1' item='item' index='index' open='(' separator=',' close=')'>"
        + "         #{item.id}  "
        + "        </foreach>"
        + "  </script>")
    List<MStaffExportVo> exportSelectIdsIn(@Param("p1") List<MStaffVo> searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param name
     * @return
     */
    @Select("    "
            + " select t.* "
            + "   from m_staff t "
            + "  where true "
            + "    and t.name =  #{p1}   "
            + "    and (t.id  =  #{p2} or #{p2} is null)   "
            + "    and (t.id  <> #{p3} or #{p3} is null)   "
            + "    and t.is_del =  0   "
            + "      ")
    List<MStaffEntity> selectByName(@Param("p1") String name, @Param("p2") Long equal_id,
                                      @Param("p3") Long not_equal_id);

    /**
     * 按条件获取所有数据，没有分页
     * @param name
     * @return
     */
    @Select("    "
            + " select t.* "
            + "   from m_staff t "
            + "  where true "
            + "    and t.simple_name =  #{p1}   "
            + "    and (t.id  =  #{p2} or #{p2} is null)   "
            + "    and (t.id  <> #{p3} or #{p3} is null)   "
            + "    and t.is_del =  0   "
            + "      ")
    List<MStaffEntity> selectBySimpleName(@Param("p1") String name, @Param("p2") Long equal_id,
                                            @Param("p3") Long not_equal_id);

    /**
     * 页面查询列表
     * @return
     */
    @Select("    "
        + "      SELECT                                                                                                         "
        + "            	t1.* ,                                                                                                  "
        + "            	t2.label as sex_text,                                                                                   "
        + "            	t3.label as service_text,                                                                               "
        + "            	t4.label as degree_text,                                                                                "
        + "            	t5.label as is_wed_text                                                                                 "
        + "        FROM                                                                                                         "
        + "            	m_staff t1                                                                                              "
        + "            	LEFT JOIN v_dict_info AS t2 ON t2.code = 'sys_sex_type' and t2.dict_value = t1.sex                      "
        + "            	LEFT JOIN v_dict_info AS t3 ON t3.code = 'usr_service_type' and t3.dict_value = t1.service              "
        + "            	LEFT JOIN v_dict_info AS t4 ON t4.code = 'usr_degree_type' and t4.dict_value = t1.degree                "
        + "             LEFT JOIN v_dict_info AS t5 ON t5.code = 'usr_wed_type' and t5.dict_value = t1.is_wed                   "
        + "       where true                                                                                                    "
        + "     and (t1.id = #{p1})  "
        + "      ")
    MStaffVo selectByid(@Param("p1") Long id);

    /**
     * 放到session中
     * @param p1
     * @return
     */
    @Select( "   " +
            " select t.* " +
            "   from m_staff t " +
            "  where t.user_id = #{p1}")
    MStaffEntity getDataByUser_id(@Param("p1") Long p1);

}