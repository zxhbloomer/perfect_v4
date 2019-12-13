package com.perfect.core.mapper.sys.rabc.menu;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.perfect.bean.entity.sys.rabc.menu.SMenuEntity;
import com.perfect.bean.vo.sys.config.module.SModuleVo;
import com.perfect.bean.vo.sys.rabc.menu.SMenuVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 集团主表 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Repository
public interface SMenuMapper extends BaseMapper<SMenuEntity> {

    String commonTreeGrid = "    "
            + "                                                                 "
            + "      with recursive tab1  as (                                  "
            + "     select t0.id,                                               "
            + "            t0.parent_id,                                        "
            + "            1 level,                                             "
            + "            t0.name,                                             "
            + "            t0.name  as depth_name,                              "
            + "            cast(t0.id as char) depth_id                      "
            + "       from s_menu t0                                            "
            + "      where t0.parent_id is null                                 "
            + "      union all                                                  "
            + "      select t2.id,                                              "
            + "             t2.parent_id,                                       "
            + "             t1.level + 1 as level,                              "
            + "             t2.name,                                            "
            + "             CONCAT( t1.depth_name,'>',t2.name)  depth_name,           "
            + "             CONCAT( cast(t1.depth_id as char),',',cast(t2.id as char))  depth_id   "
            + "        from s_menu t2,                                          "
            + "             tab1 t1                                             "
            + "       where t2.parent_id = t1.id                                "
            + "       )                                                         "
            + "	  select t1.id,                                                 "
            + "			 t1.id as value,                                          "  // 级联value
            + "			 t1.name,                                                 "
            + "			 t1.name as label,                                         " // 级联label
            + "             t1.parent_id,                                          "
            + "             t2.root_id,                                            "
            + "             t1.level,                                              "
            + "             t1.depth_name,                                         "
            + "             t1.depth_id,                                           "
            + "             t4.depth_id as parent_depth_id,                        "
            + "             t2.code,                                               "
            + "             t2.type,                                               "
            + "             t3.label as type_name,                                 "
            + "             t2.visible,                                            "
            + "             t2.perms,                                              "
            + "             t2.path,                                               "
            + "             t2.route_name,                                         "
            + "             t2.meta_title,                                         "
            + "             t2.meta_icon,                                          "
            + "             t2.component,                                          "
            + "             t2.affix,                                              "
            + "             t2.descr,                                              "
            + "             t2.tenant_id,                                         "
            + "             t2.c_id,                                               "
            + "             t2.c_time,                                             "
            + "             t2.u_id,                                               "
            + "             t2.u_time,                                             "
            + "             t2.dbversion                                           "
            + "         from tab1 t1                                               "
            + "   inner join s_menu t2                                             "
            + "		   on t1.id = t2.id                                            "
            + "   left join v_dict_info t3                                         "
            + "		   on t3.code = 'module_type' and t3.dict_value = t2.type      "
            + "	 LEFT join (                                                           "
            + "						   with recursive tab1  as (                                           "
            + "             select t0.id,                                                                  "
            + "                    t0.parent_id,                                                           "
            + "                    1 level,                                                                "
            + "                    t0.name,                                                                "
            + "                    t0.name  as depth_name,                                                 "
            + "                    cast(t0.id as char) depth_id                                            "
            + "               from s_menu t0                                                               "
            + "              where t0.parent_id is null                                                    "
            + "              union all                                                                     "
            + "              select t2.id,                                                                 "
            + "											 t2.parent_id,                                     "
            + "                     t1.level + 1 as level,                                                 "
            + "                     t2.name,                                                               "
            + "                     CONCAT( t1.name,'>',t2.name)  depth_name,                              "
            + "                     CONCAT( cast(t1.id as char),',',cast(t2.id as char))  depth_id         "
            + "                from s_menu t2,                                                             "
            + "                     tab1 t1                                                                "
            + "               where t2.parent_id = t1.id                                                   "
            + "               ) select id,depth_id from tab1                                               "
            + "							) t4 on t4.id = t1.parent_id                                       "
            + "                                                                                            "
            + "                                                                    ";

    /**
     * 按条件获取所有数据，没有分页
     * @param searchCondition
     * @return
     */
    @Select("    "
        + commonTreeGrid
        + "  where true "
        + "    and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null) "
        + "    and (t2.visible =#{p1.visible,jdbcType=VARCHAR} or #{p1.visible,jdbcType=VARCHAR} is null) "
        + "      ")
    List<SMenuVo> select(@Param("p1") SMenuVo searchCondition);

    /**
     *
     * 根据id获取数据
     *
     * @param id
     * @return
     */
    @Select("    "
            + commonTreeGrid
            + "  where true "
            + "    and t2.id =#{p1} "
            + "      ")
    SMenuVo selectId(@Param("p1") Long id);

    /**
     * 级联,按条件获取所有数据，没有分页
     * @param searchCondition
     * @return
     */
    @Select("    "
            + commonTreeGrid
            + "  where true "
            + "    and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null) "
            + "    and (t2.visible =#{p1.visible,jdbcType=VARCHAR} or #{p1.visible,jdbcType=VARCHAR} is null) "
            + "      ")
    List<SMenuVo> getCascaderList(@Param("p1") SMenuVo searchCondition);

    /**
     * 级联,按条件获取所有数据，没有分页
     * @param searchCondition
     * @return
     */
    @Select("    "
        + commonTreeGrid
        + "  where true "
        + "    and (t1.id #{p1.id)"
        + "      ")
    SMenuVo getCascaderGet(@Param("p1") SMenuVo searchCondition);

    /**
     * 没有分页，按id筛选条件
     * @param searchCondition
     * @return
     */
    @Select("<script>"
        + " select t.* "
        + "   from s_menu t "
        + "  where t.id in "
        + "        <foreach collection='p1' item='item' index='index' open='(' separator=',' close=')'>"
        + "         #{item.id}  "
        + "        </foreach>"
        + "  </script>")
    List<SMenuEntity> selectIdsIn(@Param("p1") List<SMenuVo> searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param searchCondition
     * @return
     */
    @Select("    "
        + " delete "
        + "   from s_menu  "
        + "  where true "
        + "    and code like CONCAT (#{p1.code,jdbcType=VARCHAR},'%') "
        + "      ")
    void realDeleteByCode(@Param("p1") SMenuVo searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param code
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from s_menu t "
        + "  where true "
        + "    and t.code =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "      ")
    List<SMenuEntity> selectByCode(@Param("p1") String code, @Param("p2") Long equal_id, @Param("p3") Long not_equal_id);
}
