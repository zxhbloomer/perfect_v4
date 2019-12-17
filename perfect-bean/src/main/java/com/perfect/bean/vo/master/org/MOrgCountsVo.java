package com.perfect.bean.vo.master.org;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @ClassName: MOrgCounts
 * @Description: 记录组织架构下的数量
 * @Author: zxh
 * @date: 2019/12/17
 * @Version: 1.0
 */
@Data
@NoArgsConstructor
@ApiModel(value = "记录组织架构下的数量", description = "记录组织架构下的数量")
public class MOrgCountsVo implements Serializable {

    private static final long serialVersionUID = 6103601680477614084L;

    /** 组织机构 数量 */
    private Long CountOrg;
    /** 集团信息 数量 */
    private Long CountGroup;
    /** 企业信息 数量 */
    private Long CountCompany;
    /** 部门信息 数量 */
    private Long CountDept;
    /** 岗位信息 数量 */
    private Long CountPosition;
    /** 员工信息 数量 */
    private Long CountStaff;
}
