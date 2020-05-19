package com.perfect.core.mapper.master.org;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.perfect.bean.entity.master.org.MOrgEntity;
import com.perfect.bean.entity.master.org.MOrgGroupGroupEntity;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

/**
 * <p>
 * 集团与集团关系表，多集团嵌套关系表 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2020-05-15
 */
@Repository
public interface MOrgGroupGroupMapper extends BaseMapper<MOrgGroupGroupEntity> {

    /**
     * 集团关系，集团嵌套count
     * @return
     */
    @Select("    "
        + "      SELECT                                                         "
        + "             *                                                       "
        + "        FROM                                                         "
        + "             m_org_group_group t1                                    "
        + "       WHERE                                                         "
        + "             t1.current_id = #{p1}                                   "
        + "         and t1.tenant_id = #{p2}                                    "
        + "                                                                     ")
    MOrgGroupGroupEntity getOGGEntityByCurrentId(@Param("p1") Long current_id, @Param("p2") Long tenant_id);

    /**
     * 集团关系，集团嵌套count
     * @param searchCondition
     * @return
     */
    @Select("    "
        + "      SELECT                                                         "
        + "             count(*) count                                          "
        + "        FROM                                                         "
        + "             m_org_group_group t1                                    "
        + "       WHERE                                                         "
        + "             t1.current_id = #{p1.serial_id,jdbcType=BIGINT}         "
        + "         and (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT})        "
        + "                                                                     ")
    int getOGGRelationCount(@Param("p1") MOrgEntity searchCondition);

    @Delete("                                                                        "
        + "     delete from m_org_group_group t                                      "
        + "      where t.current_id = #{p1}                                          "
    )
    int delOGGRelation(@Param("p1")Long id);

    /**
     * 保存嵌套时的儿子个数
     * @return
     */
    @Update("                                                                                    "
        + "         update m_org_group_group ut1                                                 "
        + "     inner join (                                                                     "
        + "                  select t1.id,                                                       "
        + "                         count(1) over(partition by t1.root_parent_id) as counts,     "
        + "                         row_number() over(partition by t1.root_parent_id) as sort    "
        + "                    from m_org_group_group t1                                         "
        + "               left join (                                                            "
        + "                           SELECT sub.root_parent_id                                  "
        + "                             FROM m_org_group_group sub                               "
        + "                            where sub.current_id = #{p1}                              "
        + "                          ) t2 on t1.root_parent_id = t2.root_parent_id               "
        + "                ) ut2 on ut1.id = ut2.id                                              "
        + "            set ut1.counts = ut2.counts,                                              "
        + "                ut1.sort = ut2.sort                                                   "
        + "                                                                                      "
    )
    int updateOGGCountAndSort(@Param("p1")Long id);
}
