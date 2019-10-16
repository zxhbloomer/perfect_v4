package com.perfect.manager.controller.sys.config.tentant;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.perfect.bean.entity.sys.config.tenant.STentantEntity;
import com.perfect.bean.pojo.mqsender.MqMessagePojo;
import com.perfect.bean.pojo.mqsender.MqSenderPojo;
import com.perfect.bean.pojo.reflection.CallInfoReflectionPojo;
import com.perfect.bean.pojo.result.JsonResult;
import com.perfect.bean.result.utils.v1.ResultUtil;
import com.perfect.bean.utils.common.tree.TreeUtil;
import com.perfect.bean.vo.sys.config.config.SConfigVo;
import com.perfect.bean.vo.sys.config.tenant.STentantTreeVo;
import com.perfect.bean.vo.sys.config.tenant.STentantVo;
import com.perfect.common.annotation.RepeatSubmit;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.enumconfig.MqSenderEnum;
import com.perfect.common.exception.InsertErrorException;
import com.perfect.common.exception.UpdateErrorException;
import com.perfect.common.utils.UuidUtil;
import com.perfect.common.utils.reflect.ReflectionUtils;
import com.perfect.core.service.sys.config.tentant.ITentantService;
import com.perfect.framework.base.controller.v1.BaseController;
import com.perfect.mq.rabbitmq.callback.manager.config.tentant.TentantMqCallbackInterface;
import com.perfect.mq.rabbitmq.mqenum.MQEnum;
import com.perfect.mq.rabbitmq.producer.MQProducer;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

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
    private MQProducer mqproducer;

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

//        ResponseEntity<OAuth2AccessToken
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("根据查询条件，获取租户信息")
    @ApiOperation("根据参数id，获取租户信息")
    @PostMapping("/list")
    @ResponseBody
    public ResponseEntity<JsonResult<IPage<STentantVo>>> list(@RequestBody(required = false)
        STentantVo searchCondition) throws IllegalAccessException, InstantiationException {
        IPage<STentantVo> entity = service.selectPage(searchCondition);

        // rabbitmq
        Map<String, String> testMap_MessageData = new ConcurrentHashMap<>();
        testMap_MessageData.put("11", "test11");
        testMap_MessageData.put("22", "test22");
        List<String> callbackBean = new ArrayList<>();
        callbackBean.add("123");
        callbackBean.add("234");
        mqproducer.send(buildMqSenderPojo(testMap_MessageData, this.getClass().getName(), "mqCallBackTestFunction", callbackBean), MQEnum.MQ_OPER_LOG);

//        mqproducer.send("测试", String.class, MQEnum.MQ_OPER_LOG);
        return ResponseEntity.ok().body(ResultUtil.OK(entity));
    }

    @SysLog("租户数据更新保存")
    @ApiOperation("租户数据更新保存")
    @PostMapping("/save")
    @ResponseBody
    @RepeatSubmit
    public ResponseEntity<JsonResult<STentantEntity>> save(@RequestBody(required = false) STentantEntity bean) {

        if(service.update(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.getById(bean.getId()),"更新成功"));
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
        bean.setIsenable(true);
        if(service.insert(bean).isSuccess()){
            return ResponseEntity.ok().body(ResultUtil.OK(service.selectByid(bean.getId()),"插入成功"));
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

    /**
     * 构筑mq的bean
     * @param messageData
     * @param callBackClasz
     * @param functionName
     * @param callBackPara
     * @return
     */
    private MqSenderPojo buildMqSenderPojo(Object messageData, String callBackClasz, String functionName, Object callBackPara){
        MqSenderPojo mqSenderPojo = MqSenderPojo.builder()
                                .mqMessagePojo(
                                    MqMessagePojo.builder()
                                        .messageBeanClass(messageData.getClass().getName())
                                        .parameterJson(JSON.toJSONString(messageData))
                                        .build()
                                )
                                .key(UuidUtil.randomUUID())
                                .type(MqSenderEnum.CALL_BACK_MQ.getCode().toString())
                                .name(MqSenderEnum.CALL_BACK_MQ.getName())
                                .status(String.valueOf(1))
                                .callBackInfo(
                                    CallInfoReflectionPojo.builder()
                                        .className(callBackClasz)
                                        .functionName(functionName)
                                        .parameterBeanClass(callBackPara.getClass().getName())
                                        .parameterJson(JSON.toJSONString(callBackPara))
                                        .build()
                                )
                                .build();
        return mqSenderPojo;
    }

    /**
     * 实现回调类
     * @param parameterClass
     * @param parameter
     */
    @Override
    public void mqCallBackTestFunction(String parameterClass, String parameter) {
        log.debug("xx");
    }


}
