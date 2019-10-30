package com.perfect.core.mapper.master.org;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.master.org.MCompanyEntity;
import com.perfect.bean.vo.master.org.MCompanyVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 公司主表 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Repository
public interface MCompanyMapper extends BaseMapper<MCompanyEntity> {
    /**
     * 页面查询列表
     * @param page
     * @param searchCondition
     * @return
     */
    @Select("    "
        + "     SELECT                                                          "
        + "         t1.id,                                                      "
        + "         t1.`code`,                                                  "
        + "         t1.`name`,                                                  "
        + "         t1.simple_name,                                             "
        + "         t1.address_id,                                              "
        + "         t1.juridical_name,                                          "
        + "         t1.register_capital,                                        "
        + "         t1.type,                                                    "
        + "         t1.setup_date,                                              "
        + "         t1.end_date,                                                "
        + "         t1.descr,                                                   "
        + "         t1.is_del,                                                  "
        + "         t1.tentant_id,                                              "
        + "         t1.c_id,                                                    "
        + "         t1.c_time,                                                  "
        + "         t1.u_id,                                                    "
        + "         t1.u_time,                                                  "
        + "         t1.dbversion,                                               "
        + "         t2.postal_code,                                             "
        + "         t2.province_code,                                           "
        + "         t2.city_code,                                               "
        + "         t2.area_code,                                               "
        + "         t2.detail_address                                           "
        + "     FROM                                                            "
        + "         m_company AS t1                                             "
        + "         LEFT JOIN m_address AS t2 ON t1.address_id = t2.id          "
        + "  where true "
        + "    and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null) "
        + "    and (t1.is_del =#{p1.is_del,jdbcType=VARCHAR} or #{p1.is_del,jdbcType=VARCHAR} is null) "
        + "      ")
    IPage<MCompanyEntity> selectPage(Page page, @Param("p1") MCompanyVo searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param searchCondition
     * @return
     */
    @Select("    "
        + "     SELECT                                                          "
        + "         t1.id,                                                      "
        + "         t1.`code`,                                                  "
        + "         t1.`name`,                                                  "
        + "         t1.simple_name,                                             "
        + "         t1.address_id,                                              "
        + "         t1.juridical_name,                                          "
        + "         t1.register_capital,                                        "
        + "         t1.type,                                                    "
        + "         t1.setup_date,                                              "
        + "         t1.end_date,                                                "
        + "         t1.descr,                                                   "
        + "         t1.is_del,                                                  "
        + "         t1.tentant_id,                                              "
        + "         t1.c_id,                                                    "
        + "         t1.c_time,                                                  "
        + "         t1.u_id,                                                    "
        + "         t1.u_time,                                                  "
        + "         t1.dbversion,                                               "
        + "         t2.postal_code,                                             "
        + "         t2.province_code,                                           "
        + "         t2.city_code,                                               "
        + "         t2.area_code,                                               "
        + "         t2.detail_address                                           "
        + "     FROM                                                            "
        + "         m_company AS t1                                             "
        + "         LEFT JOIN m_address AS t2 ON t1.address_id = t2.id          "
        + "  where true "
        + "    and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null) "
        + "    and (t1.is_del =#{p1.is_del,jdbcType=VARCHAR} or #{p1.is_del,jdbcType=VARCHAR} is null) "
        + "      ")
    List<MCompanyEntity> select(@Param("p1") MCompanyVo searchCondition);

    /**
     * 没有分页，按id筛选条件
     * @param searchCondition
     * @return
     */
    @Select("<script>"
        + " select t.* "
        + "   from m_group t "
        + "  where t.id in "
        + "        <foreach collection='p1' item='item' index='index' open='(' separator=',' close=')'>"
        + "         #{item.id}  "
        + "        </foreach>"
        + "  </script>")
    List<MCompanyEntity> selectIdsIn(@Param("p1") List<MCompanyVo> searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param code
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from m_group t "
        + "  where true "
        + "    and t.code =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "    and t.is_del =  0   "
        + "      ")
    List<MCompanyEntity> selectByCode(@Param("p1") String code, @Param("p2") Long equal_id,
        @Param("p3") Long not_equal_id);

    /**
     * 按条件获取所有数据，没有分页
     * @param name
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from m_group t "
        + "  where true "
        + "    and t.name =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "    and t.is_del =  0   "
        + "      ")
    List<MCompanyEntity> selectByName(@Param("p1") String name, @Param("p2") Long equal_id,
        @Param("p3") Long not_equal_id);

    /**
     * 按条件获取所有数据，没有分页
     * @param name
     * @return
     */
    @Select("    "
        + " select t.* "
        + "   from m_group t "
        + "  where true "
        + "    and t.simple_name =  #{p1}   "
        + "    and (t.id  =  #{p2} or #{p2} is null)   "
        + "    and (t.id  <> #{p3} or #{p3} is null)   "
        + "    and t.is_del =  0   "
        + "      ")
    List<MCompanyEntity> selectBySimpleName(@Param("p1") String name, @Param("p2") Long equal_id,
        @Param("p3") Long not_equal_id);
}
