package com.perfect.core.mapper.master.org;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.master.org.MDeptEntity;
import com.perfect.bean.vo.master.org.MDeptVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 部门主表 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Repository
public interface MDeptMapper extends BaseMapper<MDeptEntity> {

    String COMMON_SELECT = "                                                         "
        + "                                                                          "
        + "           SELECT                                                         "
        + "           	t1.* ,                                                       "
        + "           	t2.`name` as handler_id_name,                                "
        + "           	t3.`name` as sub_handler_id_name,                            "
        + "           	t4.`name` as leader_id_name,                                 "
        + "           	t5.`name` as response_leader_id_name                         "
        + "           FROM                                                           "
        + "           	m_dept t1                                                    "
        + "           	LEFT JOIN m_staff t2 on t1.handler_id = t2.id                "
        + "           	LEFT JOIN m_staff t3 on t1.sub_handler_id = t3.id            "
        + "           	LEFT JOIN m_staff t4 on t1.leader_id = t4.id                 "
        + "           	LEFT JOIN m_staff t5 on t1.leader_id = t5.id                 "
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
        + "    and (t1.tenant_id =#{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)      "
        + "      ")
    IPage<MDeptVo> selectPage(Page page, @Param("p1") MDeptVo searchCondition);

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
        + "    and (t1.tenant_id =#{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)      "
        + "      ")
    List<MDeptVo> select(@Param("p1") MDeptVo searchCondition);

    /**
     * 没有分页，按id筛选条件
     * @param searchCondition
     * @return
     */
    @Select("<script>"
        + " select t.* "
        + "   from m_dept t "
        + "  where true "
        + "    and (t.tenant_id = #{p2} or #{p2} is null  )                                               "
        + "    and t.id in "
        + "        <foreach collection='p1' item='item' index='index' open='(' separator=',' close=')'>"
        + "         #{item.id}  "
        + "        </foreach>"
        + "  </script>")
    List<MDeptEntity> selectIdsIn(@Param("p1") List<MDeptVo> searchCondition, @Param("p2")Long tenant_id);

    /**
     * 按条件获取所有数据，没有分页
     * @param code
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from m_dept t "
        + "  where true "
        + "    and t.code =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "    and (t.tenant_id  = #{p4} or #{p4} is null)   "
        + "    and t.is_del =  0   "
        + "      ")
    List<MDeptEntity> selectByCode(@Param("p1") String code, @Param("p2") Long equal_id,
        @Param("p3") Long not_equal_id, @Param("p4")Long tenant_id);

    /**
     * 按条件获取所有数据，没有分页
     * @param name
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from m_dept t "
        + "  where true "
        + "    and t.name =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "    and (t.tenant_id  = #{p4} or #{p4} is null)   "
        + "    and t.is_del =  0   "
        + "      ")
    List<MDeptEntity> selectByName(@Param("p1") String name, @Param("p2") Long equal_id,
        @Param("p3") Long not_equal_id, @Param("p4")Long tenant_id);

    /**
     * 按条件获取所有数据，没有分页
     * @param name
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from m_dept t "
        + "  where true "
        + "    and t.simple_name =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "    and (t.tenant_id  = #{p4} or #{p4} is null)   "
        + "    and t.is_del =  0   "
        + "      ")
    List<MDeptEntity> selectBySimpleName(@Param("p1") String name, @Param("p2") Long equal_id,
        @Param("p3") Long not_equal_id, @Param("p4")Long tenant_id);

    /**
     * 获取单条数据
     * @param id
     * @return
     */
    @Select("                                                                        "
        + COMMON_SELECT
        + "  where true                                                              "
        + "    and (t1.id = #{p1})                                                   "
        + "    and (t1.tenant_id = #{p2} or #{p2} is null  )                                                             "
        + "                                                                          ")
    MDeptVo selectByid(@Param("p1") Long id, @Param("p2")Long tenant_id);
}
