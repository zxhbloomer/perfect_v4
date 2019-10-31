package com.perfect.core.mapper.sys.areas;

import java.util.List;

import com.perfect.bean.vo.sys.areas.SAreaCitiesVo;
import com.perfect.bean.vo.sys.areas.SAreaProvincesVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.perfect.bean.vo.common.component.NameAndValueVo;

/**
 * <p>
 * 获取下拉选项的 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2019-07-13
 */
@Repository
public interface SAreasMapper extends BaseMapper<NameAndValueVo> {

    @Select( "   "
        + "  select                                                              "
        + "          *                                                           "
        + "    FROM                                                              "
        + "       s_area_provinces t1                                            "
        + "   where (t1.code = #{p1.code,jdbcType=VARCHAR} or #{p1.code,jdbcType=VARCHAR} is null     )                                          "
        + "     order by t1.code    "
        + "      ")
    List<SAreaProvincesVo> getProvinces(@Param("p1") SAreaProvincesVo condition);

    @Select( "   "
            + "  select                                                              "
            + "          *                                                           "
            + "    FROM                                                              "
            + "       s_area_provinces t1                                            "
            + "   where (t1.code = #{p1.code,jdbcType=VARCHAR} or #{p1.code,jdbcType=VARCHAR} is null     )                                          "
            + "     order by t1.code    "
            + "      ")
    List<SAreaCitiesVo> getCities(@Param("p1") SAreaCitiesVo condition);
}
