package com.perfect.manager.controller.common;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.common.component.DictConditionVo;
import com.perfect.bean.vo.common.component.NameAndValueVo;
import com.perfect.bean.vo.common.component.PerfectComponentVo;
import com.perfect.core.service.common.ICommonComponentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import com.perfect.common.annotation.SysLog;
import com.perfect.core.service.sys.config.module.IModuleService;
import com.perfect.framework.base.controller.v1.BaseController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

/**
 * @author zhangxh
 */
@RestController
@RequestMapping(value = "/api/v1/common/component")
@Slf4j
@Api("共通模块数据下载，下拉选项")
public class CommonComponentController extends BaseController {

    @Autowired
    private ICommonComponentService service;

    @Autowired
    private RestTemplate restTemplate;

    @SysLog("共通模块数据下载，下拉选项：删除类型下拉选项")
    @ApiOperation("共通模块数据下载，下拉选项：删除类型下拉选项：/deleteType/list")
    @PostMapping("/select/deleteTypeNormal/list")
    @ResponseBody
    public ResponseEntity<JsonResult<List<NameAndValueVo>>> deleteTypeListNormal(HttpServletResponse response) throws IOException {
        return ResponseEntity.ok().body(ResultUtil.OK(service.selectComponentDeleteMapNormal()));
    }

    @SysLog("共通模块数据下载，下拉选项，按传入参数来获取下拉选项")
    @ApiOperation("共通模块数据下载，下拉选项，按传入参数来获取下拉选项")
    @PostMapping("/select/bypara/list")
    @ResponseBody
    public ResponseEntity<JsonResult<List<NameAndValueVo>>> getListbypara(HttpServletResponse response ,@RequestBody
                DictConditionVo condition) {
        List<NameAndValueVo> listRtn = null;
        if(condition.getFilter_para() != null && condition.getFilter_para().length > 0){
            listRtn = service.selectComponentFilter(condition);
        } else {
            listRtn = service.selectComponent(condition);
        }
        return ResponseEntity.ok().body(ResultUtil.OK(listRtn));
    }

}
