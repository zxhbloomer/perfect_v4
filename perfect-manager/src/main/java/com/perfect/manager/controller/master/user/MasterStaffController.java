package com.perfect.manager.controller.master.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.perfect.bean.entity.master.user.MStaffEntity;
import com.perfect.bean.vo.master.user.MStaffVo;
import com.perfect.core.service.master.user.IMStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.master.org.MCompanyExportVo;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.common.utils.bean.BeanUtilsSupport;
import com.perfect.excel.export.ExcelUtil;
import com.perfect.framework.base.controller.v1.BaseController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

/**
 * @author zhangxh
 */
@RestController
@RequestMapping(value = "/api/v1/staff")
@Slf4j
@Api("员工主表相关")
public class MasterStaffController extends BaseController {

    @Autowired
    private IMStaffService service;

    @Autowired
    private RestTemplate restTemplate;

    @SysLog("根据查询条件，获取员工主表信息")
    @ApiOperation("根据参数id，获取员工主表信息")
    @PostMapping("/company/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<MStaffVo>>> list(@RequestBody(required = false)
                                                                        MStaffVo searchCondition) throws IllegalAccessException, InstantiationException {
        IPage<MStaffVo> entity = service.selectPage(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("员工主表数据更新保存")
    @ApiOperation("根据参数id，获取员工主表信息")
    @PostMapping("/company/save")
    @ResponseBody
    public ResponseEntity<JsonResult<MStaffEntity>> save(@RequestBody(required = false) MStaffEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLog("员工主表数据新增保存")
    @ApiOperation("根据参数id，获取员工主表信息")
    @PostMapping("/company/insert")
    @ResponseBody
    public ResponseEntity<JsonResult<MStaffEntity>> insert(@RequestBody(required = false) MStaffEntity bean) {
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    @SysLog("员工主表数据导出")
    @ApiOperation("根据选择的数据，员工主表数据导出")
    @PostMapping("/company/export_all")
    public void exportAll(@RequestBody(required = false) MStaffVo searchCondition, HttpServletResponse response)
        throws IllegalAccessException, InstantiationException, IOException {
        List<MStaffVo> searchResult = service.select(searchCondition);
        List<MCompanyExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, MCompanyExportVo.class);
        ExcelUtil<MCompanyExportVo> util = new ExcelUtil<>(MCompanyExportVo.class);
        util.exportExcel("员工主表数据导出", "员工主表数据", rtnList, response);
    }

    @SysLog("员工主表数据导出")
    @ApiOperation("根据选择的数据，员工主表数据导出")
    @PostMapping("/company/export_selection")
    public void exportSelection(@RequestBody(required = false) List<MStaffEntity> searchConditionList,
        HttpServletResponse response)
        throws IllegalAccessException, InstantiationException, IOException {
        List<MStaffEntity> searchResult = service.selectIdsIn(searchConditionList);
        List<MCompanyExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, MCompanyExportVo.class);
        ExcelUtil<MCompanyExportVo> util = new ExcelUtil<>(MCompanyExportVo.class);
        util.exportExcel("员工主表数据导出", "员工主表数据", rtnList, response);
    }

}
