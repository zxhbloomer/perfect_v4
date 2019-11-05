package com.perfect.core.mapper.master;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.master.MAddressEntity;
import com.perfect.bean.vo.master.MAddressVo;
import com.perfect.common.constant.PerfectDictConstant;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 地址簿 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Repository
public interface MAddressMapper extends BaseMapper<MAddressEntity> {
    /**
     * 页面查询列表
     * @param page
     * @param searchCondition
     * @return
     */
    @Select("    "
        + "  SELECT                                                                                    "
        + "        	t1.*,                                                                              "
        + "        	t2.`name` province_name,                                                           "
        + "        	t3.`name` city_name,                                                               "
        + "        	t4.`name` area_name                                                                "
        + "    FROM                                                                                    "
        + "        	m_address t1                                                                       "
        + "        	LEFT JOIN s_area_provinces t2 ON t1.province_code = t2.`code`                      "
        + "        	LEFT JOIN s_area_cities t3 ON t1.city_code = t3.`code`                             "
        + "        	LEFT JOIN s_areas t4 ON t1.area_code = t4.`code`                                   "
        + "  where true                                                                                "
        + "     and t1.serial_type = '" + PerfectDictConstant.DICT_SYS_SERIAL_TYPE + "'                "
        + "     and t1.serial_no = #{p1.serial_no,jdbcType=VARCHAR}                                    "
        + "      ")
    IPage<MAddressVo> selectPage(Page page, @Param("p1") MAddressVo searchCondition);

    /**
     * 按条件获取所有数据，没有分页
     * @param searchCondition
     * @return
     */
    @Select("    "
        + "  SELECT                                                                                    "
        + "        	t1.*,                                                                              "
        + "        	t2.`name` province_name,                                                           "
        + "        	t3.`name` city_name,                                                               "
        + "        	t4.`name` area_name                                                                "
        + "    FROM                                                                                    "
        + "        	m_address t1                                                                       "
        + "        	LEFT JOIN s_area_provinces t2 ON t1.province_code = t2.`code`                      "
        + "        	LEFT JOIN s_area_cities t3 ON t1.city_code = t3.`code`                             "
        + "        	LEFT JOIN s_areas t4 ON t1.area_code = t4.`code`                                   "
        + "  where true                                                                                "
        + "     and t1.serial_type = '" + PerfectDictConstant.DICT_SYS_SERIAL_TYPE + "'                "
        + "     and t1.serial_no = #{p1.serial_no,jdbcType=VARCHAR}                                    "
        + "      ")
    List<MAddressVo> select(@Param("p1") MAddressVo searchCondition);

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
    List<MAddressEntity> selectIdsIn(@Param("p1") List<MAddressEntity> searchCondition);

}
