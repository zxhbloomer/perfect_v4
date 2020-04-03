package com.perfect.core.mapper.sys.vue;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.sys.vue.SVuePageSettingEntity;
import com.perfect.bean.vo.sys.vue.SVuePageSettingVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 字典数据表 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2020-04-03
 */
@Repository
public interface SVuePageSettingMapper extends BaseMapper<SVuePageSettingEntity> {

    String common_select = "  "
        + "  SELECT                                                             "
        + "       *                                                            "
        + "  FROM                                                                   "
        + "  	s_config t                                            "
        + "                                                                   "
        ;

    /**
     * 页面查询列表
     * @param page
     * @param searchCondition
     * @return
     */
    @Select("    "
        + common_select
        + "  where true "
        + "    and (t.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null) "
        + "    and (t.config_key  like CONCAT ('%',#{p1.config_key,jdbcType=VARCHAR},'%') or #{p1.config_key,jdbcType=VARCHAR} is null) "
        + "    and (t.value  like CONCAT ('%',#{p1.value,jdbcType=VARCHAR},'%') or #{p1.value,jdbcType=VARCHAR} is null) "
        + "      ") IPage<SVuePageSettingVo> selectPage(Page page, @Param("p1") SVuePageSettingVo searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param searchCondition
     * @return
     */
    @Select("    "
        + common_select
        + "  where true "
        + "    and (t.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null) "
        + "    and (t.config_key  like CONCAT ('%',#{p1.config_key,jdbcType=VARCHAR},'%') or #{p1.config_key,jdbcType=VARCHAR} is null) "
        + "    and (t.value  like CONCAT ('%',#{p1.value,jdbcType=VARCHAR},'%') or #{p1.value,jdbcType=VARCHAR} is null) "
        + "      ")
    List<SVuePageSettingVo> select(@Param("p1") SVuePageSettingVo searchCondition);

    /**
     * 没有分页，按id筛选条件
     * @param searchCondition
     * @return
     */
    @Select("   <script>   "
        + common_select
        + "  where t.id in "
        + "        <foreach collection='p1' item='item' index='index' open='(' separator=',' close=')'>    "
        + "         #{item.id}  "
        + "        </foreach>    "
        + "  </script>    ")
    List<SVuePageSettingVo> selectIdsIn(@Param("p1") List<SVuePageSettingVo> searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param name
     * @return
     */
    @Select("    "
        + common_select
        + "  where true "
        + "    and t.name =  #{p1}"
        + "      ")
    List<SVuePageSettingEntity> selectByName(@Param("p1") String name);

    /**
     * 按条件获取所有数据，没有分页
     * @param config_key
     * @return
     */
    @Select("    "
        + common_select
        + "  where true "
        + "    and t.config_key =  #{p1}"
        + "      ")
    List<SVuePageSettingEntity> selectByKey(@Param("p1") String config_key);

    /**
     * 按条件获取所有数据，没有分页
     * @param value
     * @return
     */
    @Select("    "
        + common_select
        + "  where true "
        + "    and t.value =  #{p1}"
        + "      ") List<SVuePageSettingVo> selectByValue(@Param("p1") String value);

    /**
     * 按条件获取所有数据，没有分页
     * @param id
     * @return
     */
    @Select("    "
        + common_select
        + "  where t1.id =  #{p1}"
        + "      ") SVuePageSettingVo selectId(@Param("p1") Long id);

}
