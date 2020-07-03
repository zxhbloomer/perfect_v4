package com.perfect.core.mapper.master.menu;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.perfect.bean.entity.master.menu.MMenuEntity;
import com.perfect.bean.vo.master.menu.MMenuDataVo;
import com.perfect.bean.vo.master.menu.MMenuPageFunctionVo;
import com.perfect.bean.vo.master.menu.MMenuVo;
import com.perfect.common.constant.PerfectDictConstant;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
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
public interface MMenuMapper extends BaseMapper<MMenuEntity> {

    String commonTreeGrid = "    "
        + "                                                                                            "
        + "      with recursive tab1  as (                                                             "
        + "     select t0.id,                                                                          "
        + "            t0.parent_id,                                                                   "
        + "            1 level,                                                                        "
        + "            t0.name,                                                                        "
        + "            t0.name  as depth_name,                                                         "
        + "            cast(t0.id as char(50)) depth_id                                                "
        + "       from m_menu t0                                                                       "
        + "      where t0.parent_id is null                                                            "
        + "      union all                                                                             "
        + "      select t2.id,                                                                         "
        + "             t2.parent_id,                                                                  "
        + "             t1.level + 1 as level,                                                         "
        + "             t2.name,                                                                       "
        + "             CONCAT( t1.depth_name,'>',t2.name)  depth_name,                                "
        + "             CONCAT( cast(t1.depth_id as char(50)),',',cast(t2.id as char(50)))  depth_id   "
        + "        from m_menu t2,                                                                     "
        + "             tab1 t1                                                                        "
        + "       where t2.parent_id = t1.id                                                           "
        + "       )                                                                                    "
        + "	  select t1.id,                                                                            "
        + "			 t1.id as value,                                                                   "  // 级联value
        + "			 t1.name,                                                                          "
        + "			 t1.name as label,                                                                 " // 级联label
        + "             t1.parent_id,                                                                  "
        + "             t2.root_id,                                                                    "
        + "             t1.level,                                                                      "
        + "             t1.depth_name,                                                                 "
        + "             t1.depth_id,                                                                   "
        + "             t4.depth_id as parent_depth_id,                                                "
        + "             t2.code,                                                                       "
        + "             t2.type,                                                                       "
        + "             t3.label as type_name,                                                         "
        + "             t2.visible,                                                                    "
        + "             t2.perms,                                                                      "
        + "             t2.path,                                                                       "
        + "             t2.route_name,                                                                 "
        + "             t2.meta_title,                                                                 "
        + "             t2.meta_icon,                                                                  "
        + "             t2.component,                                                                  "
        + "             t2.affix,                                                                      "
        + "             t2.descr,                                                                      "
        + "             t2.tenant_id,                                                                  "
        + "             t2.c_id,                                                                       "
        + "             t2.c_time,                                                                     "
        + "             t2.u_id,                                                                       "
        + "             t2.u_time,                                                                     "
        + "             t2.dbversion,                                                                  "
        + "             t5.function_info,                                                              "
        + "             c_staff.name as c_name,                                                        "
        + "             u_staff.name as u_name                                                         "
        + "         from tab1 t1                                                                       "
        + "   inner join m_menu t2                                                                     "
        + "		   on t1.id = t2.id                                                                    "
        + "   left join v_dict_info t3                                                                 "
        + "		   on t3.code = '" + PerfectDictConstant.DICT_SYS_MENU_TYPE + "' and t3.dict_value = t2.type "
        + "	 LEFT join (                                                                               "
        + "				with recursive tab1  as (                                                      "
        + "             select t0.id,                                                                  "
        + "                    t0.parent_id,                                                           "
        + "                    1 level,                                                                "
        + "                    t0.name,                                                                "
        + "                    t0.name  as depth_name,                                                 "
        + "                    cast(t0.id as char(50)) depth_id                                        "
        + "               from m_menu t0                                                               "
        + "              where t0.parent_id is null                                                    "
        + "              union all                                                                     "
        + "              select t2.id,                                                                 "
        + "											 t2.parent_id,                                     "
        + "                     t1.level + 1 as level,                                                 "
        + "                     t2.name,                                                               "
        + "                     CONCAT( t1.name,'>',t2.name)  depth_name,                              "
        + "                     CONCAT( cast(t1.id as char(50)),',',cast(t2.id as char(50)))  depth_id "
        + "                from m_menu t2,                                                             "
        + "                     tab1 t1                                                                "
        + "               where t2.parent_id = t1.id                                                   "
        + "               ) select id,depth_id from tab1                                               "
        + "							) t4 on t4.id = t1.parent_id                                       "
        + "  LEFT JOIN (                                                                               " // 按钮数据，按json方式
        + "          SELECT                                                                            "
        + "          		subtab1.id,                                                                "
        + "          		JSON_ARRAYAGG( JSON_OBJECT( 'id', subtab3.id,                              "
        + "                                             'code', subtab3.CODE,                          "
        + "                                             'name', subtab3.NAME,                          "
        + "                                             'perms', subtab2.perms ) ) AS function_info    "
        + "          	FROM                                                                           "
        + "          		s_pages subtab1                                                            "
        + "          		LEFT JOIN s_pages_function subtab2 ON subtab1.id = subtab2.page_id         "
        + "          		LEFT JOIN s_function subtab3 on subtab3.id = subtab2.function_id           "
        + "          	WHERE                                                                          "
        + "          		subtab2.id IS NOT NULL                                                     "
        + "          	GROUP BY                                                                       "
        + "          		subtab1.id                                                                 "
        + "            ) t5 on t5.id = t2.page_id                                                      "
        + "  LEFT JOIN m_staff c_staff ON t2.c_id = c_staff.id                                                        "
        + "  LEFT JOIN m_staff u_staff ON t2.u_id = u_staff.id                                                        "
        + "                                                                                            ";

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
    @Results({
        @Result(property = "module_info", column = "module_info", javaType = List.class, typeHandler = com.perfect.core.config.mybatis.typehandlers.JsonArrayTypeHandler.class),
    })
    List<MMenuDataVo> select(@Param("p1") MMenuDataVo searchCondition);

    /**
     * 获取所有的菜单按钮
     * @param searchCondition
     * @return
     */
    @Select("    "
        + "    SELECT DISTINCT t1.code,                                                                               "
        + "           t1.name,                                                                                        "
        + "           t2.extra1 as button_group,                                                                      "
        + "           t2.extra2 as button_group_name,                                                                 "
        + "           t2.sort                                                                                         "
        + "      FROM s_module_button t1 ,                                                                            "
        + "           v_dict_info t2                                                                                  "
        + "     where t2.`code` = '" + PerfectDictConstant.DICT_BTN_NAME_TYPE + "'                                    "
        + "       and t2.dict_value = t1.code                                                                           "
        + "  order by t2.sort                                                                                         "
        + "      ")
    List<MMenuPageFunctionVo> getAllMenuButton(@Param("p1") MMenuDataVo searchCondition);

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
    MMenuDataVo selectId(@Param("p1") Long id);

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
    List<MMenuDataVo> getCascaderList(@Param("p1") MMenuVo searchCondition);

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
    MMenuVo getCascaderGet(@Param("p1") MMenuVo searchCondition);

    /**
     * 没有分页，按id筛选条件
     * @param searchCondition
     * @return
     */
    @Select("<script>"
        + " select t.* "
        + "   from m_menu t "
        + "  where t.id in "
        + "        <foreach collection='p1' item='item' index='index' open='(' separator=',' close=')'>"
        + "         #{item.id}  "
        + "        </foreach>"
        + "  </script>")
    List<MMenuEntity> selectIdsIn(@Param("p1") List<MMenuVo> searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param searchCondition
     * @return
     */
    @Select("    "
        + " delete "
        + "   from m_menu  "
        + "  where true "
        + "    and code like CONCAT (#{p1.code,jdbcType=VARCHAR},'%') "
        + "      ")
    void realDeleteByCode(@Param("p1") MMenuVo searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param code
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from m_menu t "
        + "  where true "
        + "    and t.code =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "      ")
    List<MMenuEntity> selectByCode(@Param("p1") String code, @Param("p2") Long equal_id, @Param("p3") Long not_equal_id);
}