package com.perfect.manager.controller.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.entity.master.org.MOrgEntity;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.master.org.MDeptExportVo;
import com.perfect.bean.vo.master.org.MPositionExportVo;
import com.perfect.bean.vo.master.org.MOrgVo;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.common.utils.bean.BeanUtilsSupport;
import com.perfect.core.service.master.org.IMOrgService;
import com.perfect.core.service.master.org.IMPositionService;
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
@RequestMapping(value = "/api/v1/org/")
@Slf4j
@Api("组织架构主表相关")
public class MasterOrgController extends BaseController {

    @Autowired
    private IMOrgService service;

    @Autowired
    private RestTemplate restTemplate;

    @SysLog("根据查询条件，获取组织架构主表信息")
    @ApiOperation("根据参数id，获取组织架构主表信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<MOrgVo>>> list(@RequestBody(required = false)
        MOrgVo searchCondition)  {
        IPage<MOrgVo> entity = null;
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("组织架构主表数据更新保存")
    @ApiOperation("根据参数id，获取组织架构主表信息")
    @PostMapping("/save")
    @ResponseBody
    public ResponseEntity<JsonResult<MOrgVo>> save(@RequestBody(required = false) MOrgEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLog("组织架构主表数据新增保存")
    @ApiOperation("根据参数id，获取组织架构主表信息")
    @PostMapping("/insert")
    @ResponseBody
    public ResponseEntity<JsonResult<MOrgVo>> insert(@RequestBody(required = false) MOrgEntity bean) {
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    @SysLog("组织架构主表数据导出")
    @ApiOperation("根据选择的数据，组织架构主表数据导出")
    @PostMapping("/export_all")
    public void exportAll(@RequestBody(required = false) MOrgVo searchCondition, HttpServletResponse response) throws IOException {
        List<MOrgVo> searchResult = service.select(searchCondition);
        List<MDeptExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, MDeptExportVo.class);
        ExcelUtil<MDeptExportVo> util = new ExcelUtil<>(MDeptExportVo.class);
        util.exportExcel("组织架构主表数据导出", "组织架构主表数据", rtnList, response);
    }

    @SysLog("组织架构主表数据导出")
    @ApiOperation("根据选择的数据，组织架构主表数据导出")
    @PostMapping("/export_selection")
    public void exportSelection(@RequestBody(required = false) List<MOrgVo> searchConditionList, HttpServletResponse response) throws IOException {
        List<MOrgEntity> searchResult = service.selectIdsIn(searchConditionList);
        List<MPositionExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, MPositionExportVo.class);
        ExcelUtil<MPositionExportVo> util = new ExcelUtil<>(MPositionExportVo.class);
        util.exportExcel("组织架构主表数据导出", "组织架构主表数据", rtnList, response);
    }

    @SysLog("组织架构主表数据逻辑删除复原")
    @ApiOperation("根据参数id，逻辑删除复原数据")
    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity<JsonResult<String>> delete(@RequestBody(required = false) List<MOrgVo> searchConditionList) {
        service.deleteByIdsIn(searchConditionList);
        return ResponseEntity.ok().body(ResultUtil.OK("OK"));
    }
}
