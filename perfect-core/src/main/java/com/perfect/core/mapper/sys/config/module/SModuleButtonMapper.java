package com.perfect.core.mapper.sys.config.module;

import java.util.List;

import com.perfect.bean.entity.sys.config.module.SModuleButtonEntity;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.sys.config.module.SModuleButtonEntity;
import com.perfect.bean.vo.sys.config.module.SModuleButtonVo;

/**
 * <p>
 * 模块按钮表 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-16
 */
@Repository
public interface SModuleButtonMapper extends BaseMapper<SModuleButtonEntity> {

    /**
     * 页面查询列表
     * @param page
     * @param searchCondition
     * @return
     */
    @Select("                         "
        + "     SELECT                                                        "
        + "         t1.id,                                                  "
        + "         t1.name,                                                "
        + "         t1.sort,                                                "
        + "         t1.perms,                                                "
        + "         t2.name as module_name,                                                "
        + "         t1.parent_id                                  "
        + "     FROM                                                        "
        + "         s_module_button AS t1                                          "
        + "         LEFT JOIN s_module AS t2 ON t1.parent_id = t2.id    "
        + "  where true "
        + "    and (t2.name like CONCAT ('%',#{p1.module_name,jdbcType=VARCHAR},'%') or #{p1.module_name,jdbcType=VARCHAR} is null) "
        + "             ")
    IPage<SModuleButtonVo> selectPage(Page<SModuleButtonVo> page, @Param("p1") SModuleButtonVo searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param searchCondition
     * @return
     */
    @Select("                "
        + "     SELECT                                                        "
        + "         t1.id,                                                  "
        + "         t1.name,                                                "
        + "         t1.sort,                                                "
        + "         t1.perms,                                                "
        + "         t2.name as module_name,                                                "
        + "         t1.parent_id                                  "
        + "     FROM                                                        "
        + "         s_module_button AS t1                                          "
        + "         LEFT JOIN s_module AS t2 ON t1.parent_id = t2.id    "
        + "  where true "
        + "    and (t2.name like CONCAT ('%',#{p1.module_name,jdbcType=VARCHAR},'%') or #{p1.module_name,jdbcType=VARCHAR} is null) "
        + "            ")
    List<SModuleButtonVo> select(@Param("p1") SModuleButtonVo searchCondition);

    /**
     * 没有分页，按id筛选条件
     * @param searchCondition
     * @return
     */
    @Select("<script>"
        + "     SELECT                                                        "
        + "         t1.id,                                                  "
        + "         t1.name,                                                "
        + "         t1.sort,                                                "
        + "         t1.perms,                                                "
        + "         t2.name as module_name,                                                "
        + "         t1.parent_id                                  "
        + "     FROM                                                        "
        + "         s_module_button AS t1                                          "
        + "         LEFT JOIN s_module AS t2 ON t1.parent_id = t2.id    "

        + "  where t1.id in "
        + "        <foreach collection='p1' item='item' index='index' open='(' separator=',' close=')'>"
        + "         #{item.id}  "
        + "        </foreach>"
        + "  </script>")

    List<SModuleButtonVo> selectIdsIn(@Param("p1") List<SModuleButtonVo> searchCondition);


    /**
     * 按id查询
     * @param id
     * @return
     */
    @Select(" "
        + "     SELECT                                                        "
        + "         t1.id,                                                  "
        + "         t1.name,                                                "
        + "         t1.sort,                                                "
        + "         t1.perms,                                                "
        + "         t2.name as module_name,                                                "
        + "         t1.parent_id                                  "
        + "     FROM                                                        "
        + "         s_module_button AS t1                                          "
        + "         LEFT JOIN s_module AS t2 ON t1.parent_id = t2.id    "
        + "  where true "
        + "    and (t2.name like CONCAT ('%',#{p1.module_name,jdbcType=VARCHAR},'%') or #{p1.module_name,jdbcType=VARCHAR} is null) "
        + "  where t1.id =  #{p1}"
        + "        ")
    SModuleButtonVo selectId(@Param("p1") Long id);

    /**
     * 按条件获取所有数据，没有分页
     * @param code
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from s_module_button t "
        + "  where true "
        + "    and t.parent_id =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "    and t.is_del =  0   "
        + "      ")
    List<SModuleButtonEntity> selectByCode(@Param("p1") String code, @Param("p2") Long equal_id, @Param("p3") Long not_equal_id);

    /**
     * 按条件获取所有数据，没有分页
     * @param name
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from s_module t "
        + "  where true "
        + "    and t.name =  #{p1}  "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "    and t.is_del =  0   "
        + "      ")
    List<SModuleButtonEntity> selectByName(@Param("p1") String name, @Param("p2") Long equal_id, @Param("p3") Long not_equal_id);

    @Select("    "
        + " select t.* "
        + "   from s_module t "
        + "  where true "
        + "    and t.path =  #{p1}  "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "      ")
    List<SModuleButtonEntity> selectByPath(@Param("p1") String path, @Param("p2") Long equal_id, @Param("p3") Long not_equal_id);

    @Select("    "
        + " select t.* "
        + "   from s_module t "
        + "  where true "
        + "    and t.route_name =  #{p1}  "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "      ")
    List<SModuleButtonEntity> selectByRoute_name(@Param("p1") String route_name, @Param("p2") Long equal_id, @Param("p3") Long not_equal_id);

    /**
     * 参照资源信息
     * @param code
     * @return
     */
    @Select(" "
        + "     SELECT                                                        "
        + "         t1.id,                                                  "
        + "         t1.code,                                                "
        + "         t1.type,                                                "
        + "         t1.name,                                                "
        + "         t1.template_id,                                         "
        + "         t1.path,                                                "
        + "         t1.route_name,                                          "
        + "         t1.meta_title,                                          "
        + "         t1.meta_icon,                                           "
        + "         t1.component,                                           "
        + "         t1.descr,                                               "
        + "         t1.is_del,                                               "
        + "         t1.c_id,                                                "
        + "         t1.c_time,                                              "
        + "         t1.u_id,                                                "
        + "         t1.u_time,                                              "
        + "         t1.dbversion,                                           "
        + "         t2.type AS template_type,                               "
        + "         t2.NAME AS template_name,                               "
        + "         t2.uri AS template_uri,                                 "
        + "         t2.base AS template_base,                               "
        + "         t2.file_size AS template_size,                               "
        + "         t2.extension AS template_extension,                     "
        + "         t2.descr AS template_descr,                             "
        + "         t2.context AS template_context,                         "
        + "         t2.is_del AS template_isdel                              "
        + "     FROM                                                        "
        + "         s_module AS t1                                          "
        + "         inner join s_resource AS t2 on t1.template_id = t2.id    "
        + "  where t1.code =  #{p1}"
        + "        ")
    SModuleButtonVo selectTemplateName(@Param("p1") String code);
}
