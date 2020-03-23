package com.perfect.manager.controller.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.master.org.MStaffTabVo;
import com.perfect.common.annotations.SysLogAnnotion;
import com.perfect.core.service.master.org.IMStaffOrgService;
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
@RequestMapping(value = "/api/v1/org/staff")
@Slf4j
@Api("员工表相关")
public class OrgStaffController extends BaseController {

    @Autowired
    private IMStaffOrgService service;

    @Autowired
    private RestTemplate restTemplate;

    @SysLogAnnotion("根据查询条件，获取员工主表信息")
    @ApiOperation("根据参数id，获取员工主表信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<MStaffTabVo>>> list(@RequestBody(required = false)
        MStaffTabVo searchCondition) {
        IPage<MStaffTabVo> entity = service.selectPage(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }
}
