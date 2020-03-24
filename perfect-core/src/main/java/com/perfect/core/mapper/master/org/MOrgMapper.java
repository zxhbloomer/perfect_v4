package com.perfect.core.mapper.master.org;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.master.org.MOrgEntity;
import com.perfect.bean.vo.common.component.NameAndValueVo;
import com.perfect.bean.vo.master.org.*;
import com.perfect.common.constant.PerfectDictConstant;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
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

    String COMMON_TREE_SELECT = "                                                                                                "
            + "         WITH recursive cte AS (                                                                             "
            + "               SELECT                                                                                        "
            + "                 t0.id,                                                                                      "
            + "                 t0.id as value,                                                                             "
            + "                 t0.tenant_id,                                                                              "
            + "                 t0.parent_id ,                                                                              "
            + "                 1 level,                                                                                    "
            + "                 cast(t0.id as char(50)) depth_id                                                                "
            + "               FROM                                                                                          "
            + "                       m_org t0                                                                              "
            + "               where t0.parent_id is null                                                                    "
            + "         UNION ALL                                                                                           "
            + "               SELECT                                                                                        "
            + "                 t2.id,                                                                                      "
            + "                 t2.id as value,                                                                             "
            + "                 t2.tenant_id,                                                                              "
            + "                 t2.parent_id,                                                                               "
            + "                 t1.level + 1 as level,                                                                      "
            + "                 CONCAT( cast(t1.depth_id as char(50)),',',cast(t2.id as char(50))) depth_id                         "
            + "               FROM                                                                                          "
            + "                       m_org t2,                                                                             "
            + "                       cte t1                                                                                "
            + "               WHERE                                                                                         "
            + "                 t2.parent_id = t1.id                                                                        "
            + "               )                                                                                             "
            + "                  select t1.* ,                                                                              "
            + "                         t2.code,                                                                            "
            + "                         t3.name as label,                                                                   "
            + "                         t3.name,                                                                            "
            + "                         t3.simple_name,                                                                     "
            + "                         t2.type,                                                                            "
            + "                         t4.label as type_text,                                                              "
            + "                         t2.son_count,                                                                       "
            + "                         t2.u_time,                                                                          "
            + "                         t2.dbversion ,                                                                      "
            + "                         t2.serial_id ,                                                                      "
            + "                         t2.serial_type                                                                      "
            + "                    from cte t1                                                                              "
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
     * 左侧树查询
     */
    @Select("    "
        + COMMON_TREE_SELECT
        + "  where true                                                                                              "
        + "    and (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)       "
        + "  order by t2.code                                                                                        "
        + "      ")
    List<MOrgTreeVo> getTreeList(@Param("p1") MOrgTreeVo searchCondition);

    /**
     * 左侧树查询
     */
    @Select("    "
            + COMMON_TREE_SELECT
            + "  where true                                                                                            "
            + "    and (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)  "
            + "      ")
    List<MOrgTreeVo> getList(@Param("p1") MOrgTreeVo searchCondition);

    /**
     * 页面查询列表
     * @param page
     * @param searchCondition
     * @return
     */
    @Select("    "
        + COMMON_TREE_SELECT
        + "  where true                                                                                                "
        + "    and (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)      "
        + "    and (t1.code like CONCAT (#{p1.code,jdbcType=VARCHAR},'%') or #{p1.code,jdbcType=VARCHAR} is null)      "
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
        + COMMON_TREE_SELECT
        + "  where true                                                                                              "
        + "    and (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)    "
        + "    and (t2.code like CONCAT (#{p1.code,jdbcType=VARCHAR},'%') or #{p1.code,jdbcType=VARCHAR} is null)    "
        + "      ")
    List<MOrgTreeVo> select(@Param("p1") MOrgVo searchCondition);

    /**
     * 查询添加的子节点是否合法
     * @return
     */
    @Select("                                                                                                        "
        + "           SELECT                                                                                         "
        + "           	count(1)                                                                                     "
        + "           FROM                                                                                           "
        + "           	m_org t1                                                                                     "
        + "           WHERE true                                                                                     "
        + "           	and (t1.tenant_id = #{p3} or #{p3} is null )                                                "
        + "           	and t1.CODE LIKE CONCAT (#{p1},'%')                                                          "
        + "           	and t1.type > #{p2}                                                                          "
        + "                                                                                                          ")
    Integer selectNodeInsertStatus(@Param("p1")String code, @Param("p2")String type, @Param("p3") Long tenant_id);

    /**
     * 获取单条数据
     * @param id
     * @return
     */
    @Select("                                                                        "
        + COMMON_TREE_SELECT
        + "  where true                                                              "
        + "    and (t1.id = #{p1})                                                   "
        + "    and (t1.tenant_id = #{p2} or #{p2} is null)                          "
        + "                                                                          ")
    MOrgVo selectByid(@Param("p1") Long id, @Param("p2") Long tenant_id);

    /**
     * 新增模式下，可新增子节点得类型
     * @return
     */
    @Select("  <script>                                                                                              "
        + "           SELECT                                                                                         "
        + "               t2.label as `name`,                                                                        "
        + "               t2.dict_value as `value`,                                                                  "
        + "               t1.`name` as dict_type_code,                                                               "
        + "               t2.id as dict_data_id                                                                      "
        + "            FROM                                                                                          "
        + "               s_dict_type t1                                                                             "
        + "               INNER JOIN s_dict_data t2 ON t1.id = t2.dict_type_id                                       "
        + "               AND t1.is_del = 0  AND t2.is_del = 0                                                       "
        + "           where                                                                                          "
        + "               t1.code =  '" + PerfectDictConstant.DICT_ORG_SETTING_TYPE + "'                             "
//        + "           and t2.dict_value >=  #{p1.type,jdbcType=VARCHAR}                                              "
        + "		      and exists (                                                                                   "
        + "		   					select t.type                                                                    "
        + "		   					  from m_org t                                                                   "
        + "		   					 where true                                                                      "
        + "		   					   and (t.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)   "
        + "		   					   and t.code like CONCAT (#{p1.code,jdbcType=VARCHAR},'%')                      "
//        + "		   					   and t2.dict_value >= t.type                                                   "
        + "		   	            )                                                                                    "
        + "   <if test='p1.filter_para != null and p1.filter_para.length!=0' >                                       "
        + "         and t2.dict_value not in                                                                         "
        + "        <foreach collection='p1.filter_para' item='item' index='index' open='(' separator=',' close=')'>  "
        + "         #{item}                                                                                          "
        + "        </foreach>                                                                                        "
        + "   </if>                                                                                                  "
        + "   </script>                                                                                              ")
    List<NameAndValueVo> getCorrectTypeByInsertStatus(@Param("p1") MOrgVo vo);

    /**
     * check逻辑，查看是否存在重复的子组织
     * @param vo
     * @return
     */
    @Select("                                                                                                        "
        + "           SELECT                                                                                         "
        + "           	count(1)                                                                                     "
        + "           FROM                                                                                           "
        + "           	m_org t1                                                                                     "
        + "           WHERE true                                                                                     "
        + "           	AND (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)    "
        + "           	AND t1.serial_type = #{p1.serial_type,jdbcType=VARCHAR}                                      "
        + "           	AND t1.serial_id = #{p1.serial_id,jdbcType=BIGINT}                                           "
        + "           	AND (t1.id  =  #{p2} or #{p2} is null)                                                       "
        + "           	AND (t1.id  <> #{p3} or #{p3} is null)                                                       "
        + "                                                                                                          ")
    Integer getCountBySerial(@Param("p1") MOrgEntity vo, @Param("p2") Long equal_id, @Param("p3") Long not_equal_id);

    /**
     * 根据code，进行 like 'code%'，匹配当前节点以及子节点
     * @param vo
     * @return
     */
    @Select("                                                                                                        "
        + "        select *                                                                                          "
        + "          from m_org t1                                                                                   "
        + "         where true                                                                                       "
        + "           and t1.code like CONCAT (#{p1.code,jdbcType=VARCHAR},'%')                                      "
        + "           and t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT}                                             "
        + "                                                                                                          ")
    List<MOrgEntity> getDataByCode(@Param("p1") MOrgEntity vo);

    String groupListSql = "                                                                                              "
        + "         select                                                                                               "
        + "                t1.*,                                                                                         "
        + "                t2.parent_serial_id,                                                                          "
        + "                t2.parent_serial_type,                                                                        "
        + "                t2.parent_name,                                                                               "
        + "                t2.parent_simple_name,                                                                        "
        + "                t2.parent_type_text                                                                           "
        + "          FROM                                                                                                "
        + "               m_group t1                                                                                     "
        + "    inner JOIN v_org_relation t2 ON t2.type = '20'                                                            "
        + "           and (t2.code like CONCAT (#{p1.code,jdbcType=VARCHAR},'%') or #{p1.code,jdbcType=VARCHAR} is null) "
        + "           and t1.id = t2.serial_id                                                                           "
        + "         where true                                                                                           "
        + "           and (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)    "
        +"                                                                                                               ";
    /**
     * 集团查询列表
     * @param searchCondition
     * @return
     */
    @Select("                                                                                                           "
        + groupListSql
        + "                                                                                                             ")
    IPage<MGroupVo> getGroupList(Page page, @Param("p1") MOrgTreeVo searchCondition);

    String companyListSql = "                                                                                           "
        + "        select                                                                                               "
        + "               t1.*,                                                                                         "
        + "               t2.parent_serial_id,                                                                          "
        + "               t2.parent_serial_type,                                                                        "
        + "               t2.parent_name,                                                                               "
        + "               t2.parent_simple_name,                                                                        "
        + "               t2.parent_type_text                                                                           "
        + "          FROM m_company t1                                                                                  "
        + "    inner JOIN v_org_relation t2 ON t2.type = '30'                                                            "
        + "           and (t2.code like CONCAT (#{p1.code,jdbcType=VARCHAR},'%') or #{p1.code,jdbcType=VARCHAR} is null) "
        + "           and t1.id = t2.serial_id                                                                           "
        + "  where true                                                                                                 "
        + "    and (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)          "
        + "                                                                                                             ";
    /**
     * 企业查询列表
     * @param searchCondition
     * @return
     */
    @Select("                                                                                                           "
        + companyListSql
        + "                                                                                                             ")
    IPage<MCompanyVo> getCompanyList(Page page, @Param("p1") MOrgTreeVo searchCondition);

    String deptListSql = "                                                                                              "
        + "           SELECT                                                                                            "
        + "           	t1.* ,                                                                                          "
        + "           	t2.`name` as handler_id_name,                                                                   "
        + "           	t3.`name` as sub_handler_id_name,                                                               "
        + "           	t4.`name` as leader_id_name,                                                                    "
        + "           	t5.`name` as response_leader_id_name,                                                           "
        + "             t6.parent_serial_id,                                                                            "
        + "             t6.parent_serial_type,                                                                          "
        + "             t6.parent_name,                                                                                 "
        + "             t6.parent_simple_name,                                                                          "
        + "             t6.parent_type_text                                                                             "
        + "           FROM                                                                                              "
        + "           	m_dept t1                                                                                       "
        + "           	LEFT JOIN m_staff t2 on t1.handler_id = t2.id                                                   "
        + "           	LEFT JOIN m_staff t3 on t1.sub_handler_id = t3.id                                               "
        + "           	LEFT JOIN m_staff t4 on t1.leader_id = t4.id                                                    "
        + "           	LEFT JOIN m_staff t5 on t1.leader_id = t5.id                                                    "
        + "    inner JOIN v_org_relation t6 ON t6.type = '40'                                                            "
        + "           and (t6.code like CONCAT (#{p1.code,jdbcType=VARCHAR},'%') or #{p1.code,jdbcType=VARCHAR} is null) "
        + "           and t1.id = t6.serial_id                                                                           "
        + "  where true                                                                                                 "
        + "    and (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)          "
        + "                                                                                                             ";
    /**
     * 部门查询列表
     * @param searchCondition
     * @return
     */
    @Select("                                                                                                           "
        + deptListSql
        + "                                                                                                             ")
    IPage<MDeptVo> getDeptList(Page page, @Param("p1") MOrgTreeVo searchCondition);

    String positionListSql = "                                                                                          "
        + "           SELECT                                                                                            "
        + "           	  t1.*,                                                                                         "
        + "               t2.parent_serial_id,                                                                          "
        + "               t2.parent_serial_type,                                                                        "
        + "               t2.parent_name,                                                                               "
        + "               t2.parent_simple_name,                                                                        "
        + "               t2.parent_type_text,                                                                          "
        + "               t3.staff_count                                                                                "
        + "           FROM                                                                                              "
        + "           	m_position t1                                                                                   "
        + "    inner join v_org_relation t2 ON t2.type = '" + PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION + "'    "
        + "           and (t2.code like CONCAT (#{p1.code,jdbcType=VARCHAR},'%') or #{p1.code,jdbcType=VARCHAR} is null) "
        + "           and t1.id = t2.serial_id                                                                          "
        + "     left join (                                                                                             "
        + "                  select count(1) staff_count,                                                                          "
        + "                         subt.serial_id,                                                                     "
        + "                         subt.serial_type                                                                    "
        + "                    from m_staff_org subt                                                                    "
        + "                   where (subt.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)   "
        + "                group by subt.serial_id, subt.serial_type                                                    "
        + "                )  t3 on t3.serial_id = t1.id                                                                "
        + "           and t3.serial_type = '" + PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION_SERIAL_TYPE + "'     "
        + "  where true                                                                                                 "
        + "    and (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)          "
        + "                                                                                                             ";


    /**
     * 岗位查询列表
     * @param searchCondition
     * @return
     */
    @Select("                                                                                                           "
        + positionListSql
        + "                                                                                                             ")
    IPage<MPositionVo> getPositionList(Page page, @Param("p1") MOrgTreeVo searchCondition);


    /**
     * 获取所有的组织以及子组织数量，仅仅是数量
     * @param searchCondition
     * @return
     */
    @Select("                                                                                                           "
        + "   select                                                                                                    "
        + "           IFNULL((                                                                                          "
        + "               null                                                                                          " //todo：待定
        + "            ),0) as orgs_count ,                                                                             "
        + "           IFNULL((                                                                                          "
        + "            select count(1) from ( " + groupListSql +")     tab2                                             "
        + "            ),0) as group_count ,                                                                            "
        + "           IFNULL((                                                                                          "
        + "            select count(1) from ( " + companyListSql +")   tab3                                             "
        + "           ),0)  as company_count,                                                                           "
        + "           IFNULL((                                                                                          "
        + "            select count(1) from ( " + deptListSql +")      tab4                                             "
        + "           ),0)  as dept_count,                                                                              "
        + "           IFNULL((                                                                                          "
        + "            select count(1) from ( " + positionListSql +")  tab5                                             "
        + "           ),0)  as position_count,                                                                          "
        + "           IFNULL((                                                                                          "
        + "            select count(1) from ( " + staffListSql + ")  tab6                                               "
        + "           ),0)  as staff_count                                                                              "
        + "                                                                                                             ")
    MOrgCountsVo getAllOrgDataCount(@Param("p1") MOrgVo searchCondition);

    /**
     * 拖拽的保存
     * @param entity
     * @return
     */
    @Update("                                                                        "
        + "    update m_org t                                                        "
        + "       set t.parent_id = #{p1.parent_id,jdbcType=BIGINT} ,                "
        + "           t.code = #{p1.code,jdbcType=VARCHAR} ,                         "
        + "           t.son_count = #{p1.son_count,jdbcType=INTEGER},                "
        + "           t.u_id = #{p1.u_id,jdbcType=BIGINT},                           "
        + "           t.u_time = #{p1.u_time,jdbcType=TIMESTAMP}                     "
        + "     where t.id = #{p1.id,jdbcType=BIGINT}                                "
        + "                                                                          "
    )
    int updateDragSave(@Param("p1")MOrgEntity entity);

    /**
     * 获取全部员工
     * @param condition
     * @return
     */
    @Select("                                                                        "
        + "     SELECT                                                               "
        + "             t1.id AS `key`,                                              "
        + "             t1.NAME AS label,                                            "
        + "             t1.tenant_id                                                 "
        + "       FROM  m_staff t1                                                   "
        + "      WHERE                                                               "
        + "             t1.is_del = 0                                                "
        + "        AND  t1.tenant_id = (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null) "
        + "   order by  t1.name                                                      "
        + "                                                                          ")
    List<MStaffTransferVo> getAllStaffTransferList(@Param("p1")MStaffTransferVo condition);

    /**
     * 获取该岗位下，全部员工
     * @param condition
     * @return
     */
    @Select("                                                                                                         "
        + "     SELECT                                                                                                "
        + "             t1.staff_id AS `key`                                                                          "
        + "       FROM  m_staff_org t1                                                                                "
        + "  LEFT JOIN  m_staff t2 ON t1.staff_id = t2.id                                                             "
        + "      where  t1.serial_id = #{p1.position_id,jdbcType=BIGINT}                                              "
        + "        AND  t1.serial_type = '" + PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION_SERIAL_TYPE + "'     "
        + "        AND  t1.tenant_id = (t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null) "
        + "   order by  t2.`name`                                                                                     "
        + "                                                                                                           ")
    List<Long> getUsedStaffTransferList(@Param("p1")MStaffTransferVo condition);

    /**
     * 获取要删除，员工岗位数据
     * @param bean
     * @return
     */
    @Select("  <script>        "
        + "       select t1.id ,                                                                                     "
        + "              t2.name as staff_name ,                                                                     "
        + "              t3.name as position_name ,                                                                  "
        + "              t1.c_id,                                                                                    "
        + "              t1.c_time,                                                                                  "
        + "              t1.u_id,                                                                                    "
        + "              t1.u_time                                                                                   "
        + "         from                                                                                             "
        + "               m_staff_org t1                                                                             "
        + "    left join  m_staff t2 on t1.staff_id = t2.id                                                          "
        + "    left join  m_position t3 on t3.id = t1.serial_id                                                      "
        + "        where                                                                                             "
        + "               t1.serial_id =  #{p1.position_id,jdbcType=BIGINT}                                          "
        + "          and  t1.serial_type =  '" + PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION_SERIAL_TYPE + "' "
        + "          and  t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT}                                             "
        + "   <if test='p1.staff_positions != null and p1.staff_positions.length!=0' >                               "
        + "         and t1.staff_id not in                                                                           "
        + "        <foreach collection='p1.staff_positions' item='item' index='index' open='(' separator=',' close=')'>  "
        + "         #{item}                                                                                          "
        + "        </foreach>                                                                                        "
        + "   </if>                                                                                                  "
        + "   </script>                                                                                              ")
    List<MStaffPositionOperationVo> selete_delete_member(@Param("p1") MStaffTransferVo bean);

    /**
     * 获取要新增的员工岗位数据
     * @param bean
     * @return
     */
    @Select("  <script>                                                                                              "
        + "       select  t1.id                                                                                      "
        + "         from  m_staff t1                                                                                 "
        + "        where  not exists (                                                                               "
        + "                 select true                                                                              "
        + "                   from m_staff_org t2                                                                    "
        + "                  where t2.serial_id = #{p1.position_id,jdbcType=BIGINT}                                  "
        + "                    and t2.serial_type = '" + PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION_SERIAL_TYPE + "' "
        + "                    and t1.id = t2.staff_id                                                               "
        + "                    and t1.tenant_id = t2.tenant_id                                                       "
        + "              )                                                      "
        + "           and  t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT}                                             "
        + "     <choose>                                                                                             "
        + "       <when test='p1.staff_positions != null and p1.staff_positions.length!=0'>                          "
        + "           and t1.id in                                                                             "
        + "          <foreach collection='p1.staff_positions' item='item' index='index' open='(' separator=',' close=')'>  "
        + "           #{item}                                                                                        "
        + "          </foreach>                                                                                      "
        + "       </when>                                                                                            "
        + "       <otherwise>                                                                                        "
        + "           and false                                                                                      "
        + "       </otherwise>                                                                                       "
        + "     </choose>                                                                                            "
        + "   </script>                                                                                              ")
    List<MStaffPositionOperationVo> selete_insert_member(@Param("p1") MStaffTransferVo bean);

    /**
     * 查询员工岗位数据
     * @param bean
     * @return
     */
    @Select("  <script>                                                                                              "
        + "       select t1.id ,                                                                                     "
        + "              t2.name as staff_name ,                                                                     "
        + "              t3.name as position_name,                                                                   "
        + "              t1.c_id,                                                                                    "
        + "              t1.c_time,                                                                                  "
        + "              t1.u_id,                                                                                    "
        + "              t1.u_time                                                                                   "
        + "         from                                                                                             "
        + "               m_staff_org t1                                                                             "
        + "    left join  m_staff t2 on t1.staff_id = t2.id                                                                            "
        + "    left join  m_position t3 on t3.id = t1.serial_id                                                                            "
        + "        where                                                                                             "
        + "               t1.serial_id =  #{p1.position_id,jdbcType=BIGINT}                                          "
        + "          and  t1.serial_type =  '" + PerfectDictConstant.DICT_ORG_SETTING_TYPE_POSITION_SERIAL_TYPE + "' "
        + "          and  t1.tenant_id = #{p1.tenant_id,jdbcType=BIGINT}                                             "
        + "   <if test='p1.staff_positions != null and p1.staff_positions.length!=0' >                               "
        + "         and t1.staff_id in                                                                           "
        + "        <foreach collection='p1.staff_positions' item='item' index='index' open='(' separator=',' close=')'>  "
        + "         #{item}                                                                                          "
        + "        </foreach>                                                                                        "
        + "   </if>                                                                                                  "
        + "   </script>                                                                                              ")
    List<MStaffPositionOperationVo> selete_member(@Param("p1") MStaffTransferVo bean);

    /**
     * 和 MOrgMapper.java 的COMMON_TREE_SELECT相同
     */
    String MORGMAPPER_CLASS_COMMON_TREE_SELECT = "                                                                      "
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

    String staffListSql = "                                                                      "
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
        + "                                                 and subtab2.code > #{p1.code,jdbcType=VARCHAR}                    "
        + "                                            )                                                                        "
        + "                    )                                                                                                "
//        + "    and (t1.is_del =#{p1.is_del,jdbcType=VARCHAR} or #{p1.is_del,jdbcType=VARCHAR} is null)                          "
        + "    and (t1.tenant_id =#{p1.tenant_id,jdbcType=BIGINT} or #{p1.tenant_id,jdbcType=BIGINT} is null)                   "
        + "                                                                                                                     ";

    /**
     * 页面查询列表
     * @param searchCondition
     * @return
     */
    @Select("    "
        + staffListSql
        + "    and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null)           "
        + "      ")
    List<MStaffTabVo> selectStaff(@Param("p1") MStaffTabVo searchCondition);

}
