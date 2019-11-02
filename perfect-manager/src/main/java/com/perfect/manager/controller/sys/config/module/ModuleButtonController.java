package com.perfect.manager.controller.sys.config.module;

import com.perfect.bean.entity.sys.config.module.SModuleButtonEntity;
import com.perfect.bean.vo.sys.config.module.SModuleButtonVo;
import com.perfect.core.service.sys.config.module.IModuleButtonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.framework.base.controller.v1.BaseController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

import java.util.List;


/**
 * @author zhangxh
 */
@RestController
@RequestMapping(value = "/api/v1/modulebutton")
@Slf4j
@Api("模块按钮表相关")
public class ModuleButtonController extends BaseController {

    @Autowired
    private IModuleButtonService service;

    @Autowired
    private RestTemplate restTemplate;

    @SysLog("根据查询条件，获取模块按钮表信息")
    @ApiOperation("根据参数id，获取模块按钮表信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<SModuleButtonVo>>> list(@RequestBody(required = false)
        SModuleButtonVo searchCondition) throws IllegalAccessException, InstantiationException {
        IPage<SModuleButtonVo> entity = service.selectPage(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("模块按钮表数据更新保存")
    @ApiOperation("根据参数id，获取模块按钮表信息")
    @PostMapping("/save")
    @ResponseBody
    public ResponseEntity<JsonResult<SModuleButtonEntity>> save(@RequestBody(required = false) SModuleButtonEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLog("模块按钮表数据新增保存")
    @ApiOperation("根据参数id，获取模块按钮表信息")
    @PostMapping("/group/insert")
    @ResponseBody
    public ResponseEntity<JsonResult<SModuleButtonEntity>> insert(@RequestBody(required = false) SModuleButtonEntity bean) {
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }


    @SysLog("模块按钮表数据逻辑删除复原")
    @ApiOperation("根据参数id，逻辑删除复原数据")
    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity<JsonResult<String>> delete(@RequestBody(required = false) List<SModuleButtonVo> searchConditionList) {
        service.deleteByIdsIn(searchConditionList);
        return ResponseEntity.ok().body(ResultUtil.OK("OK"));
    }
}
