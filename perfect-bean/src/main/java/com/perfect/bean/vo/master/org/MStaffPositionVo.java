package com.perfect.bean.vo.master.org;

import com.perfect.bean.config.base.v1.BaseVo;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 员工岗位
 * </p>
 *
 * @author zxh
 * @since 2019-07-13
 */
@Data
@NoArgsConstructor
@ApiModel(value = "员工岗位", description = "员工岗位")
@EqualsAndHashCode(callSuper=false)
public class MStaffPositionVo extends BaseVo implements Serializable {

    private static final long serialVersionUID = -2807973727279079173L;

    private Long id;

    /**
     * 页面上激活的tabs:  0:全岗位,1:已设置岗位,2:未设置岗位
     */
    private int active_tabs_index;

    /**
     * 岗位名称
     */
    private String position_name;

    /**
     * 岗位数据
     */
    private List<MPositionVo> list;

    /**
     * 全岗位
     */
    private int all;

    /**
     * 已设置岗位
     */
    private int settled;

    /**
     * 未设置岗位
     */
    private int unsettled;

}
