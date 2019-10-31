package com.perfect.core.serviceimpl.sys.areas;

import com.perfect.bean.entity.sys.areas.SAreaCitiesEntity;
import com.perfect.bean.entity.sys.areas.SAreaProvincesEntity;
import com.perfect.bean.entity.sys.areas.SAreasEntity;
import com.perfect.bean.vo.sys.areas.SAreaCitiesVo;
import com.perfect.bean.vo.sys.areas.SAreaProvincesVo;
import com.perfect.bean.vo.sys.areas.SAreasVo;
import com.perfect.core.mapper.sys.areas.SAreasMapper;
import com.perfect.core.service.sys.areas.ICommonAreasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.vo.common.component.NameAndValueVo;
import com.perfect.core.mapper.common.CommonComponentMapper;

import java.util.List;

/**
 * <p>
 * 字典数据表 服务实现类
 * </p>
 *
 * @author zxh
 * @since 2019-08-23
 */
@Service
public class CommonAreasServiceImpl extends ServiceImpl<SAreasMapper, NameAndValueVo> implements ICommonAreasService {

    @Autowired
    private SAreasMapper mapper;

    /**
     * 市
     * @param condition
     * @return
     */
    @Override
    public List<SAreaProvincesVo> getProvinces(SAreaProvincesVo condition) {
        return null;
    }

    /**
     * 市
     * @param condition
     * @return
     */
    @Override
    public List<SAreaCitiesVo> getCities(SAreaCitiesVo condition) {
        return null;
    }

    /**
     * 区
     * @param condition
     * @return
     */
    @Override
    public List<SAreasVo> getProvinces(SAreasVo condition) {
        return null;
    }
}
