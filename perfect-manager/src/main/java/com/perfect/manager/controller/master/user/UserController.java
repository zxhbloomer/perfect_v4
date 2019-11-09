package com.perfect.manager.controller.master.user;

import com.perfect.bean.entity.master.user.MUserEntity;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.vo.master.user.MUserVo;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.master.user.UserInfoVo;
import com.perfect.common.annotation.SysLog;
import com.perfect.core.service.client.user.IMUserService;
import com.perfect.framework.base.controller.v1.BaseController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

/**
 * @author zxh
 */
@RestController
@RequestMapping(value = "/api/v1/user")
@Slf4j
@Api("用户相关")
public class UserController extends BaseController {

    @Autowired
    private IMUserService service;

    @SysLog("获取用户信息")
    @ApiOperation("获取用户信息")
    @GetMapping("/info")
    @ResponseBody
    public ResponseEntity<JsonResult<UserInfoVo>> userInfo(@RequestParam("token") String token) {

        UserInfoVo userInfoVo = service.getUserInfo(token);

//        ResponseEntity<OAuth2AccessToken
        return ResponseEntity.ok().body(ResultUtil.OK(userInfoVo));
    }

    @SysLog("登出")
    @ApiOperation("登出")
    @PostMapping("/logout")
    @ResponseBody
    public ResponseEntity<JsonResult<String>> logout() {
        return ResponseEntity.ok().body(ResultUtil.OK("登出成功"));
    }


    @SysLog("员工主表数据更新保存")
    @ApiOperation("根据参数id，获取员工主表信息")
    @PostMapping("/save")
    @ResponseBody
    public ResponseEntity<JsonResult<MUserVo>> save(@RequestBody(required = false) MUserEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLog("员工主表数据新增保存")
    @ApiOperation("根据参数id，获取员工主表信息")
    @PostMapping("/insert")
    @ResponseBody
    public ResponseEntity<JsonResult<MUserVo>> insert(@RequestBody(required = false) MUserEntity bean) {
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }


}
