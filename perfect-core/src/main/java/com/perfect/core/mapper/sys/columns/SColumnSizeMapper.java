package com.perfect.core.mapper.sys.columns;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.perfect.bean.entity.sys.columns.SColumnSizeEntity;
import com.perfect.bean.vo.sys.columns.SColumnSizeVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 表格列宽 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2020-06-09
 */
@Repository
public interface SColumnSizeMapper extends BaseMapper<SColumnSizeEntity> {

    @Select( "   "
        + "        select                                                                               "
        + "               *                                                                             "
        + "          FROM                                                                               "
        + "               s_column_size t1                                                              "
        + "         where true                                                                          "
        + "           and page_code = #{p1.page_code,jdbcType=VARCHAR}                                  "
        + "           and (type = #{p1.type,jdbcType=VARCHAR} or #{p1.type,jdbcType=VARCHAR} is null)   "
        + "           and staff_id = #{p1.staff_id,jdbcType=BIGINT}                                     "
        + "      ")
    List<SColumnSizeVo> getData(@Param("p1") SColumnSizeVo condition);
}
