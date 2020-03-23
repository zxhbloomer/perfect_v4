package com.perfect.manager.controller.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.entity.master.org.MCompanyEntity;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.master.org.MCompanyExportVo;
import com.perfect.bean.vo.master.org.MCompanyVo;
import com.perfect.common.annotations.SysLogAnnotion;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.common.utils.bean.BeanUtilsSupport;
import com.perfect.core.service.master.org.IMCompanyService;
import com.perfect.excel.export.ExcelUtil;
import com.perfect.framework.base.controller.v1.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author zhangxh
 */
@RestController
@RequestMapping(value = "/api/v1/org")
@Slf4j
@Api("公司表相关")
public class OrgCompanyController extends BaseController {

    @Autowired
    private IMCompanyService service;

    @Autowired
    private RestTemplate restTemplate;

    @SysLogAnnotion("根据查询条件，获取公司主表信息")
    @ApiOperation("根据参数id，获取公司主表信息")
    @PostMapping("/company/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<MCompanyEntity>>> list(@RequestBody(required = false) MCompanyVo searchCondition){
        IPage<MCompanyEntity> entity = service.selectPage(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLogAnnotion("公司主表数据更新保存")
    @ApiOperation("根据参数id，获取公司主表信息")
    @PostMapping("/company/save")
    @ResponseBody
    public ResponseEntity<JsonResult<MCompanyEntity>> save(@RequestBody(required = false) MCompanyEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLogAnnotion("公司主表数据新增保存")
    @ApiOperation("根据参数id，获取公司主表信息")
    @PostMapping("/company/insert")
    @ResponseBody
    public ResponseEntity<JsonResult<MCompanyEntity>> insert(@RequestBody(required = false) MCompanyEntity bean) {
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    @SysLogAnnotion("公司主表数据导出")
    @ApiOperation("根据选择的数据，公司主表数据导出")
    @PostMapping("/company/export_all")
    public void exportAll(@RequestBody(required = false) MCompanyVo searchCondition, HttpServletResponse response) throws IOException {
        List<MCompanyEntity> searchResult = service.select(searchCondition);
        List<MCompanyExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, MCompanyExportVo.class);
        ExcelUtil<MCompanyExportVo> util = new ExcelUtil<>(MCompanyExportVo.class);
        util.exportExcel("公司主表数据导出", "公司主表数据", rtnList, response);
    }

    @SysLogAnnotion("公司主表数据导出")
    @ApiOperation("根据选择的数据，公司主表数据导出")
    @PostMapping("/company/export_selection")
    public void exportSelection(@RequestBody(required = false) List<MCompanyVo> searchConditionList, HttpServletResponse response) throws IOException {
        List<MCompanyEntity> searchResult = service.selectIdsIn(searchConditionList);
        List<MCompanyExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, MCompanyExportVo.class);
        ExcelUtil<MCompanyExportVo> util = new ExcelUtil<>(MCompanyExportVo.class);
        util.exportExcel("公司主表数据导出", "公司主表数据", rtnList, response);
    }

    @SysLogAnnotion("公司主表数据逻辑删除复原")
    @ApiOperation("根据参数id，逻辑删除复原数据")
    @PostMapping("/company/delete")
    @ResponseBody
    public ResponseEntity<JsonResult<String>> delete(@RequestBody(required = false) List<MCompanyVo> searchConditionList) {
        service.deleteByIdsIn(searchConditionList);
        return ResponseEntity.ok().body(ResultUtil.OK("OK"));
    }
}
