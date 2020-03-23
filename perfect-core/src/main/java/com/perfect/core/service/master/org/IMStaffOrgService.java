package com.perfect.core.service.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.perfect.bean.entity.master.org.MStaffOrgEntity;
import com.perfect.bean.vo.master.user.MStaffVo;

import java.util.List;

/**
 * <p>
 * 用户组织机构关系表 服务类 接口
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
public interface IMStaffOrgService extends IService<MStaffOrgEntity> {
    /**
     * 获取列表，页面查询
     */
    IPage<MStaffVo> selectPage(MStaffVo searchCondition) ;

    /**
     * 获取所有数据
     */
    List<MStaffVo> select(MStaffVo searchCondition);
}
