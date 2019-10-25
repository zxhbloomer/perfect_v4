package com.perfect.manager.controller.sys.config.tentant;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.entity.quartz.SJobEntity;
import com.perfect.bean.entity.sys.config.tenant.STentantEntity;
import com.perfect.bean.pojo.mqsender.MqSenderPojo;
import com.perfect.bean.pojo.mqsender.builder.MqSenderPojoBuilder;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.utils.common.tree.TreeUtil;
import com.perfect.bean.vo.sys.config.config.SConfigVo;
import com.perfect.bean.vo.sys.config.tenant.STentantTreeVo;
import com.perfect.bean.vo.sys.config.tenant.STentantVo;
import com.perfect.common.annotation.RepeatSubmit;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.enumconfig.MqSenderEnum;
import com.perfect.common.enumconfig.quartz.QuartzEnum;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.core.service.quartz.ISJobService;
import com.perfect.core.service.sys.config.tentant.ITentantService;
import com.perfect.framework.base.controller.v1.BaseController;
import com.perfect.manager.quartz.builder.sys.config.tentant.TentantTaskBuilder;
import com.perfect.mq.rabbitmq.callback.manager.config.tentant.TentantMqCallbackInterface;
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
@RequestMapping(value = "/api/v1/tentant")
@Slf4j
@Api("租户相关")
public class TentantController extends BaseController implements TentantMqCallbackInterface {

    @Autowired
    private ITentantService service;

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
    public ResponseEntity<JsonResult<List<STentantTreeVo>>> treeList(@RequestBody(required = false)
        SConfigVo searchCondition) throws IllegalAccessException, InstantiationException {
        List<STentantTreeVo> vo = service.getTreeList(null,null);
        List<STentantTreeVo> rtnVo = TreeUtil.getTreeList(vo);
        return ResponseEntity.ok().body(ResultUtil.OK(rtnVo));
    }

    @SysLog("根据查询条件，获取租户信息")
    @ApiOperation("获取级联数据")
    @PostMapping("/cascader/list")
    @ResponseBody
    public ResponseEntity<JsonResult<List<STentantTreeVo>>> cascaderList(@RequestBody(required = false)
        SConfigVo searchCondition) throws IllegalAccessException, InstantiationException {
        List<STentantTreeVo> vo = service.getCascaderList(null,null);
        List<STentantTreeVo> rtnVo = TreeUtil.getTreeList(vo);
        return ResponseEntity.ok().body(ResultUtil.OK(rtnVo,true));
    }

//    @SysLog("根据查询条件，获取租户信息")
//    @ApiOperation("获取租户树数据")
//    @PostMapping("/grid/list")
//    @ResponseBody
//    public ResponseEntity<JsonResult<List<STentantTreeVo>>> gridList(@RequestBody(required = false)
//        SConfigVo searchCondition) throws IllegalAccessException, InstantiationException {
//        List<STentantTreeVo> vo = service.getTreeList(Long.valueOf(1),"根");
//        List<STentantTreeVo> rtnVo = TreeUtil.getTreeList(vo);
//        return ResponseEntity.ok().body(ResultUtil.OK(rtnVo));
//    }

    @SysLog("根据参数id，获取租户信息")
    @ApiOperation("根据参数id，获取租户信息")
    @PostMapping("{ id }")
    @ResponseBody
    public ResponseEntity<JsonResult<STentantEntity>> info(@RequestParam("id") String id) {
        STentantEntity entity = service.getById(id);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("根据查询条件，获取租户信息")
    @ApiOperation("根据参数id，获取租户信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<STentantVo>>> list(@RequestBody(required = false)
        STentantVo searchCondition) throws IllegalAccessException, InstantiationException {
        IPage<STentantVo> entity = service.selectPage(searchCondition);
            return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("租户数据更新保存")
    @ApiOperation("租户数据更新保存")
    @PostMapping("/save")
    @ResponseBody
    @RepeatSubmit
    public ResponseEntity<JsonResult<STentantVo>> save(@RequestBody(required = false) STentantEntity bean) {

        if(service.update(bean).isSuccess()){
            // 获取更新后的数据
            STentantVo vo = service.selectByid(bean.getId());
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
    public ResponseEntity<JsonResult<STentantVo>> insert(@RequestBody(required = false) STentantEntity bean) {
        // 默认启用
        bean.setIs_enable(true);
        if(service.insert(bean).isSuccess()){
            // 获取更新后的数据
            STentantVo vo = service.selectByid(bean.getId());
            // 调用mq
            mqSendAfterDataSave(vo);
            return ResponseEntity.ok().body(ResultUtil.OK(vo,"插入成功"));
        } else {
            throw new InsertErrorException("新增保存失败。");
        }
    }

    //    @SysLog("租户数据导出")
//    @ApiOperation("根据选择的数据，租户数据导出")
//    @PostMapping("/export_all")
//    public void exportAll(@RequestBody(required = false) STentantTreeVo searchCondition, HttpServletResponse response)
//        throws IllegalAccessException, InstantiationException, IOException {
//        List<STentantTreeVo> searchResult = service.select(searchCondition);
//        List<SConfigDataExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, SConfigDataExportVo.class);
//        ExcelUtil<SConfigDataExportVo> util = new ExcelUtil<>(SConfigDataExportVo.class);
//        util.exportExcel("租户数据导出", "租户数据", rtnList, response);
//    }
//
//    @SysLog("租户数据导出")
//    @ApiOperation("根据选择的数据，租户数据导出")
//    @PostMapping("/export_selection")
//    public void exportSelection(@RequestBody(required = false) List<STentantTreeVo> searchConditionList,
//        HttpServletResponse response)
//        throws IllegalAccessException, InstantiationException, IOException {
//        List<STentantTreeVo> searchResult = service.selectIdsIn(searchConditionList);
//        List<SResourceExportVo> rtnList = BeanUtilsSupport.copyProperties(searchResult, SConfigDataExportVo.class);
//        ExcelUtil<SResourceExportVo> util = new ExcelUtil<>(SResourceExportVo.class);
//        util.exportExcel("租户数据导出", "租户数据", rtnList, response);
//    }

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
    private void mqSendAfterDataSave(STentantVo data){
        // 启用的task
        SJobEntity enableJobEntity = jobService.selectJobBySerialId(data.getId(), QuartzEnum.TASK_TENTANT_ENABLE.getJob_serial_type());
        SJobEntity enableBean = TentantTaskBuilder.builderEnableBean(data, enableJobEntity);
        // 初始化要发生mq的bean
        MqSenderPojo enableMqSenderPojo = MqSenderPojoBuilder.buildMqSenderPojo(enableBean, MqSenderEnum.NORMAL_MQ, QuartzEnum.TASK_TENTANT_ENABLE.getJob_name());
        // 启动一个开始的任务
        mqproducer.send(enableMqSenderPojo, MQEnum.MQ_TASK_Tentant_ENABLE);

        // 禁用的task
        SJobEntity disableJobEntity = jobService.selectJobBySerialId(data.getId(), QuartzEnum.TASK_TENTANT_DISABLE.getJob_serial_type());
        SJobEntity disableBean = TentantTaskBuilder.builderDisableBean(data, disableJobEntity);
        // 初始化要发生mq的bean
        MqSenderPojo disableMqSenderPojo = MqSenderPojoBuilder.buildMqSenderPojo(disableBean, MqSenderEnum.NORMAL_MQ, QuartzEnum.TASK_TENTANT_DISABLE.getJob_name());
        // 启动一个结束的任务
        mqproducer.send(disableMqSenderPojo, MQEnum.MQ_TASK_Tentant_Disable);
    }

    private void resetAllMq(List<STentantVo> dataList){
        for (STentantVo vo : dataList){
            mqSendAfterDataSave(vo);
        }
    }

}
