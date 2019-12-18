package com.perfect.manager.controller.master.org;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.entity.master.org.MCompanyEntity;
import com.perfect.bean.entity.master.org.MGroupEntity;
import com.perfect.bean.entity.master.org.MOrgEntity;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.vo.common.component.NameAndValueVo;
import com.perfect.bean.vo.master.org.*;
import com.perfect.bean.vo.master.user.MStaffVo;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.core.service.master.org.IMOrgService;
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
@RequestMapping(value = "/api/v1/org/")
@Slf4j
@Api("组织架构主表相关")
public class MasterOrgController extends BaseController {

    @Autowired
    private IMOrgService service;

    @Autowired
    private RestTemplate restTemplate;

    @SysLog("根据查询条件，获取组织机构信息")
    @ApiOperation("获取组织机构树数据")
    @PostMapping("/tree/list")
    @ResponseBody
    public ResponseEntity<JsonResult<List<MOrgTreeVo>>> treeList(@RequestBody(required = false) MOrgTreeVo searchCondition) {
        if(searchCondition == null){
            searchCondition = new MOrgTreeVo();
            searchCondition.setTenant_id(getUserSessionTenantId());
        }
        List<MOrgTreeVo> vo = service.getTreeList(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(vo));
    }

    @SysLog("根据查询条件，获取所有的组织以及子组织数量，仅仅是数量")
    @ApiOperation("根据查询条件，获取所有的组织以及子组织数量，仅仅是数量")
    @PostMapping("/count")
    @ResponseBody
    public ResponseEntity<JsonResult<MOrgCountsVo>> getAllOrgDataCount(@RequestBody(required = false) MOrgVo searchCondition)  {
        MOrgCountsVo vo = service.getAllOrgDataCount(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(vo));
    }

    @SysLog("根据查询条件，获取组织架构主表信息")
    @ApiOperation("根据查询条件，获取组织架构主表信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<List<MOrgTreeVo>>> getOrgs(@RequestBody(required = false) MOrgVo searchCondition)  {
        List<MOrgTreeVo> list = service.getOrgs(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(list));
    }

    @SysLog("根据查询条件，获取集团信息")
    @ApiOperation("根据查询条件，获取集团信息")
    @PostMapping("/groups")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<MGroupEntity>>> getGroups(@RequestBody(required = false) MOrgTreeVo searchCondition)  {
        IPage<MGroupEntity> list = service.getGroups(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(list));
    }

    @SysLog("根据查询条件，获取企业信息")
    @ApiOperation("根据查询条件，获取企业信息")
    @PostMapping("/companies")
    @ResponseBody
    public ResponseEntity<JsonResult<List<MCompanyEntity>>> getCompanies(@RequestBody(required = false) MOrgTreeVo searchCondition)  {
        List<MCompanyEntity> list = service.getCompanies(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(list));
    }

    @SysLog("根据查询条件，获取部门信息")
    @ApiOperation("根据查询条件，获取部门信息")
    @PostMapping("/depts")
    @ResponseBody
    public ResponseEntity<JsonResult<List<MDeptVo>>> getDepts(@RequestBody(required = false) MOrgVo searchCondition)  {
        List<MDeptVo> list = service.getDepts(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(list));
    }

    @SysLog("根据查询条件，获取岗位信息")
    @ApiOperation("根据查询条件，获取岗位信息")
    @PostMapping("/positions")
    @ResponseBody
    public ResponseEntity<JsonResult<List<MPositionVo>>> getPositions(@RequestBody(required = false) MOrgVo searchCondition)  {
        List<MPositionVo> list = service.getPositions(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(list));
    }

    @SysLog("根据查询条件，获取员工信息")
    @ApiOperation("根据查询条件，获取员工信息")
    @PostMapping("/staffs")
    @ResponseBody
    public ResponseEntity<JsonResult<List<MStaffVo>>> getStaffs(@RequestBody(required = false) MOrgVo searchCondition)  {
        List<MStaffVo> list = service.getStaffs(searchCondition);
        return ResponseEntity.ok().body(ResultUtil.OK(list));
    }

    @SysLog("组织架构主表数据更新保存")
    @ApiOperation("根据参数id，获取组织架构主表信息")
    @PostMapping("/save")
    @ResponseBody
    public ResponseEntity<JsonResult<MOrgVo>> save(@RequestBody(required = false) MOrgEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLog("组织架构主表数据新增保存")
    @ApiOperation("根据参数id，获取组织架构主表信息")
    @PostMapping("/insert")
    @ResponseBody
    public ResponseEntity<JsonResult<MOrgVo>> insert(@RequestBody(required = false) MOrgEntity bean) {
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    @SysLog("新增模式下，可新增子节点得类型")
    @ApiOperation("新增模式下，可新增子节点得类型")
    @PostMapping("/get_type")
    @ResponseBody
    public ResponseEntity<JsonResult<List<NameAndValueVo>>> getCorrectTypeByInsertStatus(@RequestBody(required = false) MOrgVo bean) {
        if(bean.getTenant_id() == null) {
            bean.setTenant_id(getUserSessionTenantId());
        }
        List<NameAndValueVo> rtn = service.getCorrectTypeByInsertStatus(bean);
        return ResponseEntity.ok().body(ResultUtil.OK(rtn));
    }

    @SysLog("新增模式下，可新增子节点得类型")
    @ApiOperation("新增模式下，可新增子节点得类型")
    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity<JsonResult<String>> delete(@RequestBody(required = false) MOrgEntity bean) {
        Boolean rtn = service.deleteById(bean);
        return ResponseEntity.ok().body(ResultUtil.OK("删除成功"));
    }
}
