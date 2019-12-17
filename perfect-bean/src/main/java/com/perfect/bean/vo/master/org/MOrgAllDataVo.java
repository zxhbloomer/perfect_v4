package com.perfect.bean.vo.master.org;

import com.perfect.bean.entity.master.org.MCompanyEntity;
import com.perfect.bean.entity.master.org.MGroupEntity;
import com.perfect.bean.vo.master.user.MStaffVo;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName: MOrgAllData
 * @Description: 获取所有数据，组织架构
 * @Author: zxh
 * @date: 2019/12/17
 * @Version: 1.0
 */
@Data
@NoArgsConstructor
@ApiModel(value = "组织架构下的所有数据", description = "组织架构下的所有数据")
public class MOrgAllDataVo implements Serializable {

    private static final long serialVersionUID = -8339834808925135716L;

    List<MOrgTreeVo> orgs;
    List<MGroupEntity> groups;
    List<MCompanyEntity> companies;
    List<MDeptVo> depts;
    List<MPositionVo> positions;
    List<MStaffVo> staffs;
    MOrgCountsVo counts;


}
