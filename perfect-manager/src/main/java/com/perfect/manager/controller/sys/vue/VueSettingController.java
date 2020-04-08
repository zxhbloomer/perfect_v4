package com.perfect.manager.controller.sys.vue;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.entity.sys.vue.SVuePageSettingEntity;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.sys.config.config.SConfigDataExportVo;
import com.perfect.bean.vo.sys.config.resource.SResourceExportVo;
import com.perfect.bean.vo.sys.vue.SVuePageSettingVo;
import com.perfect.common.annotations.RepeatSubmitAnnotion;
import com.perfect.common.annotations.SysLogAnnotion;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.common.utils.bean.BeanUtilsSupport;
import com.perfect.core.service.sys.vue.ISVuePageSettingService;
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
@RequestMapping(value = "/api/v1/vue")
@Slf4j
@Api("vue页面设置")
public class VueSettingController extends BaseController {

    @Autowired
    private ISVuePageSettingService service;

    @Autowired
    private RestTemplate restTemplate;

    @SysLogAnnotion("根据参数id，获取系统参数信息")
    @ApiOperation("根据参数id，获取系统参数信息")
    @PostMapping("{ id }")
    @ResponseBody
    public ResponseEntity<JsonResult<SVuePageSettingEntity>> info(@RequestParam("id") String id) {

        SVuePageSettingEntity entity = service.getById(id);

//        ResponseEntity<OAuth2AccessToken
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLogAnnotion("根据查询条件，获取系统参数信息")
    @ApiOperation("根据参数id，获取系统参数信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<SVuePageSettingVo>>> list(@RequestBody(required = false) SVuePageSettingVo searchCondition) {
        IPage<SVuePageSettingVo> entity = service.selectPage(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLogAnnotion("系统参数数据更新保存")
    @ApiOperation("根据参数id，获取系统参数信息")
    @PostMapping("/save")
    @ResponseBody
    @RepeatSubmitAnnotion
    public ResponseEntity<JsonResult<SVuePageSettingEntity>> save(@RequestBody(required = false) SVuePageSettingEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLogAnnotion("系统参数数据新增保存")
    @ApiOperation("根据参数id，获取系统参数信息")
    @PostMapping("/insert")
    @ResponseBody
    @RepeatSubmitAnnotion
    public ResponseEntity<JsonResult<SVuePageSettingEntity>> insert(@RequestBody(required = false) SVuePageSettingEntity bean) {
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    @SysLogAnnotion("系统参数数据导出")
    @ApiOperation("根据选择的数据，系统参数数据导出")
    @PostMapping("/export_all")
    public void exportAll(@RequestBody(required = false) SVuePageSettingVo searchCondition, HttpServletResponse response) throws IOException {
        List<SVuePageSettingVo> searchResult = service.select(searchCondition);
        List<SConfigDataExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, SConfigDataExportVo.class);
        ExcelUtil<SConfigDataExportVo> util = new ExcelUtil<>(SConfigDataExportVo.class);
        util.exportExcel("系统参数数据导出", "系统参数数据", rtnList, response);
    }

    @SysLogAnnotion("系统参数数据导出")
    @ApiOperation("根据选择的数据，系统参数数据导出")
    @PostMapping("/export_selection")
    public void exportSelection(@RequestBody(required = false) List<SVuePageSettingVo> searchConditionList, HttpServletResponse response) throws IOException {
        List<SVuePageSettingVo> searchResult = service.selectIdsIn(searchConditionList);
        List<SResourceExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, SConfigDataExportVo.class);
        ExcelUtil<SResourceExportVo> util = new ExcelUtil<>(SResourceExportVo.class);
        util.exportExcel("系统参数数据导出", "系统参数数据", rtnList, response);
    }
}
