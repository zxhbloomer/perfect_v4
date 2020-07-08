package com.perfect.manager.controller.sys.config;

import com.perfect.bean.entity.sys.config.SIconEntity;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.sys.config.SIconVo;
import com.perfect.common.annotations.SysLogAnnotion;
import com.perfect.core.service.sys.config.ISIconService;
import com.perfect.framework.base.controller.v1.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author zhangxh
 */
@RestController
@RequestMapping(value = "/api/v1/icon")
@Slf4j
@Api("系统icon相关")
public class SysIconController extends BaseController {

    @Autowired
    private ISIconService service;

    @SysLogAnnotion("获取系统Icon信息")
    @ApiOperation("获取系统Icon信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<List<SIconEntity>>> list(@RequestBody(required = false) SIconVo searchCondition) {
        List<SIconEntity> entity = service.select(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }
}
