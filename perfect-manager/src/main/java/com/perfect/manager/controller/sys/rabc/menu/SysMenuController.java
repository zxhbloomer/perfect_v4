package com.perfect.manager.controller.sys.rabc.menu;

import com.perfect.bean.entity.sys.rabc.menu.SMenuEntity;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.utils.common.tree.TreeUtil;
import com.perfect.bean.vo.sys.config.config.SConfigVo;
import com.perfect.bean.vo.sys.config.module.SModuleButtonVo;
import com.perfect.bean.vo.sys.config.tenant.STentantTreeVo;
import com.perfect.bean.vo.sys.rabc.menu.SMenuVo;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.core.service.sys.rabc.menu.ISMenuService;
import com.perfect.framework.base.controller.v1.BaseController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zhangxh
 */
@RestController
@RequestMapping(value = "/api/v1/menu")
@Slf4j
@Api("菜单相关")
public class SysMenuController extends BaseController {

    @Autowired
    private ISMenuService service;

    @Autowired
    private RestTemplate restTemplate;

    @SysLog("根据查询条件，获取菜单主表信息")
    @ApiOperation("根据参数id，获取菜单主表信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<List<SMenuVo>>> list(@RequestBody(required = false) SMenuVo searchCondition) {
        List<SMenuVo> entity = service.getTreeList(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("根据查询条件，获取级联信息")
    @ApiOperation("获取级联数据")
    @PostMapping("/cascader/list")
    @ResponseBody
    public ResponseEntity<JsonResult<List<SMenuVo>>> cascaderList(@RequestBody(required = false) SMenuVo searchCondition) {
        List<SMenuVo> vo = service.getCascaderList(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(vo,true));
    }

    @SysLog("系统菜单数据更新保存")
    @ApiOperation("根据参数id，获取系统菜单信息")
    @PostMapping("/save")
    @ResponseBody
    public ResponseEntity<JsonResult<SMenuVo>> save(@RequestBody(required = false) SMenuEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLog("系统菜单数据新增菜单组")
    @ApiOperation("新增菜单组")
    @PostMapping("/addmenugroup")
    @ResponseBody
    public ResponseEntity<JsonResult<SMenuVo>> addMenuGroup(@RequestBody(required = false) SMenuEntity bean) {
        if(service.addMenuGroup(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    @SysLog("系统菜单数据新增菜单组")
    @ApiOperation("新增菜单组")
    @PostMapping("/addsubmenu")
    @ResponseBody
    public ResponseEntity<JsonResult<SMenuVo>> addSubMenu(@RequestBody(required = false) SMenuEntity bean) {
        if(service.addSubMenu(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    @SysLog("模块按钮表数据逻辑物理删除，部分数据")
    @ApiOperation("根据参数id，逻辑删除数据")
    @PostMapping("/realdelete")
    @ResponseBody
    public ResponseEntity<JsonResult<String>> realDelete(@RequestBody(required = false) SMenuVo searchCondition) {
        if(searchCondition == null) {
            return ResponseEntity.ok().body(ResultUtil.OK("没有数据"));
        } else {
            service.realDeleteByCode(searchCondition);
            return ResponseEntity.ok().body(ResultUtil.OK("OK"));
        }
    }
}
