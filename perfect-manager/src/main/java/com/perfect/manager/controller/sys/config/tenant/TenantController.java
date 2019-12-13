package com.perfect.manager.controller.sys.config.tenant;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.entity.quartz.SJobEntity;
import com.perfect.bean.entity.sys.config.tenant.STenantEntity;
import com.perfect.bean.pojo.mqsender.MqSenderPojo;
import com.perfect.bean.pojo.mqsender.builder.MqSenderPojoBuilder;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.utils.common.tree.TreeUtil;
import com.perfect.bean.vo.sys.config.config.SConfigVo;
import com.perfect.bean.vo.sys.config.tenant.STenantTreeVo;
import com.perfect.bean.vo.sys.config.tenant.STenantVo;
import com.perfect.common.annotation.RepeatSubmit;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.enumconfig.MqSenderEnum;
import com.perfect.common.enumconfig.quartz.QuartzEnum;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.core.service.quartz.ISJobService;
import com.perfect.core.service.sys.config.tenant.ITenantService;
import com.perfect.framework.base.controller.v1.BaseController;
import com.perfect.manager.quartz.builder.sys.config.tenant.TenantTaskBuilder;
import com.perfect.mq.rabbitmq.callback.manager.config.tenant.TenantMqCallbackInterface;
import com.perfect.mq.rabbitmq.mqenum.MQEnum;
import com.perfect.mq.rabbitmq.producer.PerfectMqProducer;
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
@RequestMapping(value = "/api/v1/tenant")
@Slf4j
@Api("租户相关")
public class TenantController extends BaseController implements TenantMqCallbackInterface {

    @Autowired
    private ITenantService service;

    @Autowired
    private ISJobService jobService;

    /**
     * 调用消息队列，消息队列调用定时任务
     */
    @Autowired
    private PerfectMqProducer mqproducer;

    @SysLog("根据查询条件，获取租户信息")
    @ApiOperation("获取租户树数据")
    @PostMapping("/tree/list")
    @ResponseBody
    public ResponseEntity<JsonResult<List<STenantTreeVo>>> treeList(@RequestBody(required = false) SConfigVo searchCondition) {
        List<STenantTreeVo> vo = service.getTreeList(null,null);
        List<STenantTreeVo> rtnVo = TreeUtil.getTreeList(vo);
        return ResponseEntity.ok().body(ResultUtil.OK(rtnVo));
    }

    @SysLog("根据查询条件，获取租户信息")
    @ApiOperation("获取级联数据")
    @PostMapping("/cascader/list")
    @ResponseBody
    public ResponseEntity<JsonResult<List<STenantTreeVo>>> cascaderList(@RequestBody(required = false)SConfigVo searchCondition) {
        List<STenantTreeVo> vo = service.getCascaderList(null,null);
        List<STenantTreeVo> rtnVo = TreeUtil.getTreeList(vo);
        return ResponseEntity.ok().body(ResultUtil.OK(rtnVo,true));
    }

    @SysLog("根据参数id，获取租户信息")
    @ApiOperation("根据参数id，获取租户信息")
    @PostMapping("{ id }")
    @ResponseBody
    public ResponseEntity<JsonResult<STenantEntity>> info(@RequestParam("id") String id) {
        STenantEntity entity = service.getById(id);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("根据查询条件，获取租户信息")
    @ApiOperation("根据参数id，获取租户信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<STenantVo>>> list(@RequestBody(required = false) STenantVo searchCondition) {
        IPage<STenantVo> entity = service.selectPage(searchCondition);
            return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("租户数据更新保存")
    @ApiOperation("租户数据更新保存")
    @PostMapping("/save")
    @ResponseBody
    @RepeatSubmit
    public ResponseEntity<JsonResult<STenantVo>> save(@RequestBody(required = false) STenantEntity bean) {

        if(service.update(bean).isSuccess()){
            // 获取更新后的数据
            STenantVo vo = service.selectByid(bean.getId());
            // 调用mq
            mqSendAfterDataSave(vo);
            return ResponseEntity.ok().body(ResultUtil.OK(vo,"更新成功"));
        } else {
            throw new UpdateErrorException("保存的数据已经被修改，请查询后重新编辑更新。");
        }
    }

    @SysLog("租户数据新增保存")
    @ApiOperation("租户数据新增保存")
    @PostMapping("/insert")
    @ResponseBody
    @RepeatSubmit
    public ResponseEntity<JsonResult<STenantVo>> insert(@RequestBody(required = false) STenantEntity bean) {
        // 默认启用
        bean.setIs_enable(true);
        if(service.insert(bean).isSuccess()){
            // 获取更新后的数据
            STenantVo vo = service.selectByid(bean.getId());
            // 调用mq
            mqSendAfterDataSave(vo);
            return ResponseEntity.ok().body(ResultUtil.OK(vo,"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    @Override
    public void mqCallBackTestFunction(String parameterClass , String parameter) {
        log.debug("testmq");
    }

    @Override
    public void mqCallBackTestFunction(List<String> callbackBean) {
        log.debug("testmq");
    }

    /**
     * 保存完毕后，调用mq，触发定时任务
     *
     * 规则：获取完整的数据进行判断后触发
     *
     */
    private void mqSendAfterDataSave(STenantVo data){
        // 启用的task
        SJobEntity enableJobEntity = jobService.selectJobBySerialId(data.getId(), QuartzEnum.TASK_TENANT_ENABLE.getJob_serial_type());
        SJobEntity enableBean = TenantTaskBuilder.builderEnableBean(data, enableJobEntity);
        // 初始化要发生mq的bean
        MqSenderPojo enableMqSenderPojo = MqSenderPojoBuilder.buildMqSenderPojo(enableBean, MqSenderEnum.NORMAL_MQ, QuartzEnum.TASK_TENANT_ENABLE.getJob_name());
        // 启动一个开始的任务
        mqproducer.send(enableMqSenderPojo, MQEnum.MQ_TASK_Tenant_ENABLE);

        // 禁用的task
        SJobEntity disableJobEntity = jobService.selectJobBySerialId(data.getId(), QuartzEnum.TASK_TENANT_DISABLE.getJob_serial_type());
        SJobEntity disableBean = TenantTaskBuilder.builderDisableBean(data, disableJobEntity);
        // 初始化要发生mq的bean
        MqSenderPojo disableMqSenderPojo = MqSenderPojoBuilder.buildMqSenderPojo(disableBean, MqSenderEnum.NORMAL_MQ, QuartzEnum.TASK_TENANT_DISABLE.getJob_name());
        // 启动一个结束的任务
        mqproducer.send(disableMqSenderPojo, MQEnum.MQ_TASK_Tenant_Disable);
    }

    private void resetAllMq(List<STenantVo> dataList){
        for (STenantVo vo : dataList){
            mqSendAfterDataSave(vo);
        }
    }

}
