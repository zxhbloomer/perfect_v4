package com.perfect.manager.controller.master;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.entity.master.MAddressEntity;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.master.MAddressVo;
import com.perfect.common.annotations.SysLogAnnotion;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.core.service.master.IMAddressService;
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
@RequestMapping(value = "/api/v1/mst")
@Slf4j
@Api("地址簿主表相关")
public class MasterAddressController extends BaseController {

    @Autowired
    private IMAddressService service;

    @Autowired
    private RestTemplate restTemplate;

    @SysLogAnnotion("根据查询条件，获取地址簿主表信息")
    @ApiOperation("根据参数id，获取地址簿主表信息")
    @PostMapping("/address/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<MAddressVo>>> list(@RequestBody(required = false) MAddressVo searchCondition) {
        IPage<MAddressVo> entity = service.selectPage(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLogAnnotion("地址簿主表数据更新保存")
    @ApiOperation("根据参数id，获取地址簿主表信息")
    @PostMapping("/address/save")
    @ResponseBody
    public ResponseEntity<JsonResult<MAddressEntity>> save(@RequestBody(required = false) MAddressEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLogAnnotion("地址簿主表数据新增保存")
    @ApiOperation("根据参数id，获取地址簿主表信息")
    @PostMapping("/address/insert")
    @ResponseBody
    public ResponseEntity<JsonResult<MAddressVo>> insert(@RequestBody(required = false) MAddressEntity bean) {
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    @SysLogAnnotion("地址簿主表数据逻辑删除复原")
    @ApiOperation("根据参数id，逻辑删除复原数据")
    @PostMapping("/address/delete")
    @ResponseBody
    public ResponseEntity<JsonResult<String>> delete(@RequestBody(required = false) List<MAddressVo> searchConditionList) {
        service.realDeleteByIdsIn(searchConditionList);
        return ResponseEntity.ok().body(ResultUtil.OK("OK"));
    }

    @SysLogAnnotion("地址簿主表数据逻辑删除复原")
    @ApiOperation("根据参数id，逻辑删除复原数据")
    @PostMapping("/address/get")
    @ResponseBody
    public ResponseEntity<JsonResult<MAddressVo>> selectById(@RequestBody(required = false) MAddressVo searchCondition) {
        return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(searchCondition.getId())));
    }

}
