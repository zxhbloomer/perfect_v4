package com.perfect.manager.controller.sys.platform;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.entity.sys.platform.SCodeEntity;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.sys.platform.SCodeVo;
import com.perfect.common.annotation.RepeatSubmit;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.core.service.sys.platform.ISCodeService;
import com.perfect.framework.base.controller.v1.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

/**
 * @author zhangxh
 */
@RestController
@RequestMapping(value = "/api/v1/code")
@Slf4j
@Api("自动生成编码")
public class PlatformCodeController extends BaseController {

    @Autowired
    private ISCodeService service;

    @Autowired
    private RestTemplate restTemplate;


    @SysLog("根据查询条件，获取系统参数信息")
    @ApiOperation("根据参数id，获取系统参数信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<SCodeVo>>> list(@RequestBody(required = false) SCodeVo searchCondition) {
        IPage<SCodeVo> entity = service.selectPage(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("系统参数数据更新保存")
    @ApiOperation("根据参数id，获取系统参数信息")
    @PostMapping("/save")
    @ResponseBody
    @RepeatSubmit
    public ResponseEntity<JsonResult<SCodeVo>> save(@RequestBody(required = false) SCodeEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLog("系统参数数据新增保存")
    @ApiOperation("根据参数id，获取系统参数信息")
    @PostMapping("/insert")
    @ResponseBody
    @RepeatSubmit
    public ResponseEntity<JsonResult<SCodeVo>> insert(@RequestBody(required = false) SCodeEntity bean) {
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }
}
