package com.perfect.manager.controller.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.entity.master.org.MDeptEntity;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.master.org.MDeptExportVo;
import com.perfect.bean.vo.master.org.MGroupExportVo;
import com.perfect.bean.vo.master.org.MDeptVo;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.common.utils.bean.BeanUtilsSupport;
import com.perfect.core.service.master.org.IMDeptService;
import com.perfect.core.service.master.org.IMGroupService;
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
@RequestMapping(value = "/api/v1/org/dept")
@Slf4j
@Api("部门主表相关")
public class MasterDeptController extends BaseController {

    @Autowired
    private IMDeptService service;

    @Autowired
    private RestTemplate restTemplate;

    @SysLog("根据查询条件，获取部门主表信息")
    @ApiOperation("根据参数id，获取部门主表信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<MDeptVo>>> list(@RequestBody(required = false)
        MDeptVo searchCondition)  {
        IPage<MDeptVo> entity = service.selectPage(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("部门主表数据更新保存")
    @ApiOperation("根据参数id，获取部门主表信息")
    @PostMapping("/save")
    @ResponseBody
    public ResponseEntity<JsonResult<MDeptVo>> save(@RequestBody(required = false) MDeptEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLog("部门主表数据新增保存")
    @ApiOperation("根据参数id，获取部门主表信息")
    @PostMapping("/insert")
    @ResponseBody
    public ResponseEntity<JsonResult<MDeptVo>> insert(@RequestBody(required = false) MDeptEntity bean) {
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    @SysLog("部门主表数据导出")
    @ApiOperation("根据选择的数据，部门主表数据导出")
    @PostMapping("/export_all")
    public void exportAll(@RequestBody(required = false) MDeptVo searchCondition, HttpServletResponse response) throws IOException {
        List<MDeptVo> searchResult = service.select(searchCondition);
        List<MDeptExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, MDeptExportVo.class);
        ExcelUtil<MDeptExportVo> util = new ExcelUtil<>(MDeptExportVo.class);
        util.exportExcel("部门主表数据导出", "部门主表数据", rtnList, response);
    }

    @SysLog("部门主表数据导出")
    @ApiOperation("根据选择的数据，部门主表数据导出")
    @PostMapping("/export_selection")
    public void exportSelection(@RequestBody(required = false) List<MDeptVo> searchConditionList, HttpServletResponse response) throws IOException {
        List<MDeptEntity> searchResult = service.selectIdsIn(searchConditionList);
        List<MGroupExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, MGroupExportVo.class);
        ExcelUtil<MGroupExportVo> util = new ExcelUtil<>(MGroupExportVo.class);
        util.exportExcel("部门主表数据导出", "部门主表数据", rtnList, response);
    }

    @SysLog("部门主表数据逻辑删除复原")
    @ApiOperation("根据参数id，逻辑删除复原数据")
    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity<JsonResult<String>> delete(@RequestBody(required = false) List<MDeptVo> searchConditionList) {
        service.deleteByIdsIn(searchConditionList);
        return ResponseEntity.ok().body(ResultUtil.OK("OK"));
    }
}