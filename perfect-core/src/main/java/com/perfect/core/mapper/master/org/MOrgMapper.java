package com.perfect.core.mapper.master.org;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.master.org.MOrgEntity;
import com.perfect.bean.vo.master.org.MOrgVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 岗位主表 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Repository
public interface MOrgMapper extends BaseMapper<MOrgEntity> {

    String COMMON_SELECT = "                                                                                                "
            + "         WITH recursive cte AS (                                                                             "
            + "               SELECT                                                                                        "
            + "                 t0.id,                                                                                      "
            + "                 t0.id as value,                                                                             "
            + "                       t0.parent_id ,                                                                        "
            + "                       1 level,                                                                              "
            + "                       cast(t0.id as varchar(20)) depth_id                                                   "
            + "               FROM                                                                                          "
            + "                       m_org t0                                                                              "
            + "               where t0.parent_id is null                                                                    "
            + "         UNION ALL                                                                                           "
            + "               SELECT                                                                                        "
            + "                 t2.id,                                                                                      "
            + "                 t2.id as value,                                                                             "
            + "                       t2.parent_id,                                                                         "
            + "                       t1.level + 1 as level,                                                                "
            + "                       CONCAT( cast(t1.depth_id as varchar(20)),',',cast(t2.id as varchar(20))) depth_id     "
            + "               FROM                                                                                          "
            + "                       m_org t2,                                                                             "
            + "                       cte t1                                                                                "
            + "               WHERE                                                                                         "
            + "                 t2.parent_id = t1.id                                                                        "
            + "               )                                                                                             "
            + "                  select t1.* ,                                                                              "
            + "                     t3.name,                                                                                "
            + "                     t3.simple_name,                                                                         "
            + "                     t4.label                                                                                "
            + "                        from cte t1                                                                          "
            + "          inner join m_org t2 on t1.id = t2.id                                                               "
            + "           left join                                                                                         "
            + "           (                                                                                                 "
            + "             select subt1.id as serial_id,subt1.name,subt1.simple_name,'10' as type,'s_tenant' as serial_type from s_tenant subt1        "
            + "             union all                                                                                                                   "
            + "             select subt2.id as serial_id,subt2.name,subt2.simple_name,'20' as type,'m_group' as serial_type from m_group subt2          "
            + "             union all                                                                                                                   "
            + "             select subt3.id as serial_id,subt3.name,subt3.simple_name,'30' as type,'m_company' as serial_type from m_company subt3      "
            + "             union all                                                                                                                   "
            + "             select subt4.id as serial_id,subt4.name,subt4.simple_name,'40' as type,'m_dept' as serial_type from m_dept subt4            "
            + "             union all                                                                                                                   "
            + "             select subt5.id as serial_id,subt5.name,subt5.simple_name,'50' as type,'m_position' as serial_type from m_position subt5    "
            + "             union all                                                                                                                   "
            + "             select subt6.id as serial_id,subt6.name,subt6.simple_name,'60' as type,'m_staff' as serial_type from m_staff subt6          "
            + "           ) t3 on t3.serial_type = t2.serial_type and t3.serial_id = t2.serial_id                                                       "
            + "           left join v_dict_info t4 on t4.dict_value = t2.type and t4.code = 'org_setting_type'                                          "
            + "                                                                          ";

    /**
     * 页面查询列表
     * @param page
     * @param searchCondition
     * @return
     */
    @Select("    "
        + COMMON_SELECT
        + "  where true                                                              "
        + "    and (t1.code like CONCAT ('%',#{p1.code,jdbcType=VARCHAR},'%') or #{p1.code,jdbcType=VARCHAR} is null)  "
        + "    and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null)  "
        + "    and (t1.is_del =#{p1.is_del,jdbcType=VARCHAR} or #{p1.is_del,jdbcType=VARCHAR} is null)                 "
        + "      ")
    IPage<MOrgVo> selectPage(Page page, @Param("p1") MOrgVo searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param searchCondition
     * @return
     */
    @Select("    "
        + COMMON_SELECT
        + "  where true "
        + "    and (t1.code like CONCAT ('%',#{p1.code,jdbcType=VARCHAR},'%') or #{p1.code,jdbcType=VARCHAR} is null)  "
        + "    and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null)  "
        + "    and (t1.is_del =#{p1.is_del,jdbcType=VARCHAR} or #{p1.is_del,jdbcType=VARCHAR} is null)                 "
        + "      ")
    List<MOrgVo> select(@Param("p1") MOrgVo searchCondition);

    /**
     * 没有分页，按id筛选条件
     * @param searchCondition
     * @return
     */
    @Select("<script>"
        + " select t.* "
        + "   from m_position t "
        + "  where t.id in "
        + "        <foreach collection='p1' item='item' index='index' open='(' separator=',' close=')'>"
        + "         #{item.id}  "
        + "        </foreach>"
        + "  </script>")
    List<MOrgEntity> selectIdsIn(@Param("p1") List<MOrgVo> searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param code
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from m_position t "
        + "  where true "
        + "    and t.code =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "    and t.is_del =  0   "
        + "      ")
    List<MOrgEntity> selectByCode(@Param("p1") String code, @Param("p2") Long equal_id,
        @Param("p3") Long not_equal_id);

    /**
     * 按条件获取所有数据，没有分页
     * @param name
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from m_position t "
        + "  where true "
        + "    and t.name =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "    and t.is_del =  0   "
        + "      ")
    List<MOrgEntity> selectByName(@Param("p1") String name, @Param("p2") Long equal_id,
        @Param("p3") Long not_equal_id);

    /**
     * 按条件获取所有数据，没有分页
     * @param name
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from m_position t "
        + "  where true "
        + "    and t.simple_name =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "    and t.is_del =  0   "
        + "      ")
    List<MOrgEntity> selectBySimpleName(@Param("p1") String name, @Param("p2") Long equal_id,
        @Param("p3") Long not_equal_id);

    /**
     * 获取单条数据
     * @param id
     * @return
     */
    @Select("                                                                        "
        + COMMON_SELECT
        + "  where true                                                              "
        + "    and (t1.id = #{p1})                                                   "
        + "                                                                          ")
    MOrgVo selectByid(@Param("p1") Long id);
}
