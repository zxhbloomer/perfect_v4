package com.perfect.core.mapper.sys.pages.function;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.perfect.bean.entity.sys.pages.function.SFunctionEntity;
import com.perfect.bean.vo.sys.pages.function.SFunctionVo;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * <p>
 * 按钮表 Mapper 接口
 * </p>
 *
 * @author zxh
 * @since 2020-06-16
 */
@Repository
public interface SFunctionMapper extends BaseMapper<SFunctionEntity> {

    /**
     * 页面查询
     * @param page
     * @param searchCondition
     * @return
     */
    @Select("                                                                                                             "
        + "     SELECT                                                                                                    "
        + "            t1.*,                                                                                              "
        + "            c_staff.name as c_name,                                                                            "
        + "            u_staff.name as u_name                                                                             "
        + "       FROM                                                                                                    "
        + "  	       s_function t1                                                                                      "
        + "  LEFT JOIN m_staff c_staff ON t1.c_id = c_staff.id                                                            "
        + "  LEFT JOIN m_staff u_staff ON t1.u_id = u_staff.id                                                            "
        + "      where true                                                                                               "
        + "        and (t1.code like CONCAT ('%',#{p1.code,jdbcType=VARCHAR},'%') or #{p1.code,jdbcType=VARCHAR} is null) "
        + "        and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null) "
        )
    IPage<SFunctionVo> selectPage(Page page, @Param("p1") SFunctionVo searchCondition);


    /**
     * 页面查询
     * @param searchCondition
     * @return
     */
    @Select("                                                                                                             "
        + "     SELECT                                                                                                    "
        + "            t1.*,                                                                                              "
        + "            c_staff.name as c_name,                                                                            "
        + "            u_staff.name as u_name                                                                             "
        + "       FROM                                                                                                    "
        + "     	   s_function t1                                                                                      "
        + "  LEFT JOIN m_staff c_staff ON t1.c_id = c_staff.id                                                            "
        + "  LEFT JOIN m_staff u_staff ON t1.u_id = u_staff.id                                                            "
        + "      where true                                                                                               "
        + "        and (t1.code like CONCAT ('%',#{p1.code,jdbcType=VARCHAR},'%') or #{p1.code,jdbcType=VARCHAR} is null) "
        + "        and (t1.name like CONCAT ('%',#{p1.name,jdbcType=VARCHAR},'%') or #{p1.name,jdbcType=VARCHAR} is null) "
        + "                                                                                                              ")
    List<SFunctionVo> select(@Param("p1") SFunctionVo searchCondition);

    /**
     * 页面查询
     * @param id
     * @return
     */
    @Select("                                      "
        + "     SELECT                                                       "
        + "            t1.*                                                  "
        + "            c_staff.name as c_name,                               "
        + "            u_staff.name as u_name                                "
        + "       FROM                                                       "
        + "     	    s_function t1                                        "
        + "  LEFT JOIN m_staff c_staff ON t1.c_id = c_staff.id               "
        + "  LEFT JOIN m_staff u_staff ON t1.u_id = u_staff.id               "
        + "  where true                                                      "
        + "    and t1.id =  #{p1}                                            "
        )
    SFunctionVo selectId(@Param("p1") Long id);
}
