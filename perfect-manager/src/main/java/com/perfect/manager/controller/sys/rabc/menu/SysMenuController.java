package com.perfect.manager.controller.sys.rabc.menu;

import com.perfect.bean.entity.sys.rabc.menu.SMenuEntity;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
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
    public ResponseEntity<JsonResult<List<SMenuVo>>> list(@RequestBody(required = false) SMenuVo searchCondition) throws IllegalAccessException, InstantiationException {
        List<SMenuVo> entity = service.select(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("集团主表数据更新保存")
    @ApiOperation("根据参数id，获取集团主表信息")
    @PostMapping("/save")
    @ResponseBody
    public ResponseEntity<JsonResult<SMenuEntity>> save(@RequestBody(required = false) SMenuEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLog("集团主表数据新增保存")
    @ApiOperation("根据参数id，获取集团主表信息")
    @PostMapping("/insert")
    @ResponseBody
    public ResponseEntity<JsonResult<SMenuEntity>> insert(@RequestBody(required = false) SMenuEntity bean) {
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    @SysLog("集团主表数据逻辑删除复原")
    @ApiOperation("根据参数id，逻辑删除复原数据")
    @PostMapping("/visible")
    @ResponseBody
    public ResponseEntity<JsonResult<String>> delete(@RequestBody(required = false) List<SMenuVo> searchConditionList) {
        service.visibleByIdsIn(searchConditionList);
        return ResponseEntity.ok().body(ResultUtil.OK("OK"));
    }
}
