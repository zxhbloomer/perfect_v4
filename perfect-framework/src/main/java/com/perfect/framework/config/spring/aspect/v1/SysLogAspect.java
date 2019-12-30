package com.perfect.framework.config.spring.aspect.v1;


import com.alibaba.fastjson.JSON;
import com.perfect.bean.bo.session.user.UserSessionBo;
import com.perfect.bean.bo.sys.SysLogBo;
import com.perfect.bean.entity.sys.SLogEntity;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.properies.PerfectConfigProperies;
import com.perfect.common.utils.IPUtil;
import com.perfect.core.service.sys.ISLogService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.NamedThreadLocal;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

/**
 * @author zxh
 */
@Aspect
@Component
@Slf4j
public class SysLogAspect {

    private static final ThreadLocal<Date> beginTimeThreadLocal =
            new NamedThreadLocal<Date>("ThreadLocal beginTime");
    private static final ThreadLocal<SLogEntity> logThreadLocal =
            new NamedThreadLocal<SLogEntity>("ThreadLocal log");

    private static final ThreadLocal<UserSessionBo> currentUser=new NamedThreadLocal<>("ThreadLocal user");

    @Autowired(required=false)
    private HttpServletRequest request;

    @Autowired
    private ThreadPoolTaskExecutor threadPoolTaskExecutor;

    @Autowired
    private PerfectConfigProperies perfectConfigProperies;

    @Autowired
    private ISLogService iSLogService;

    @Pointcut("@annotation(com.perfect.common.annotation.SysLog)")
    public void sysLogAspect(){}

//    @Before("webLog()")
//    public void doBefore(JoinPoint joinPoint) throws Throwable {
//        // 接收到请求，记录请求内容
//        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
//        HttpServletRequest request = attributes.getRequest();
//
//        // 记录下请求内容
//        log.debug("======================日志开始================================");
//        log.debug("URL : " + request.getRequestURL().toString());
//        log.debug("HTTP_METHOD : " + request.getMethod());
//        log.debug("IP : " + request.getRemoteAddr());
//        log.debug("CLASS_METHOD : " + joinPoint.getSignature().getDeclaringTypeName() + "." + joinPoint.getSignature().getName());
//        log.debug("ARGS : " + Arrays.toString(joinPoint.getArgs()));
//        log.debug("======================日志结束================================");
//    }
//
//    @AfterReturning(returning = "result", pointcut = "webLog()")
//    public void doAfterReturning(Object result) throws Throwable {
//        // 处理完请求，返回内容
//        log.debug("执行结果 : " + result);
//    }

    /**
     * 环绕通知 @Around  ， 当然也可以使用 @Before (前置通知)  @After (后置通知)
     * @param point
     * @return
     * @throws Throwable
     */
    @Around("sysLogAspect()")
    public Object around(ProceedingJoinPoint point) throws Throwable {
        long beginTime = System.currentTimeMillis();
        Object result = point.proceed();
        BigDecimal time =  new BigDecimal(System.currentTimeMillis() - beginTime);
        try {
            SysLogBo SysLogBo = printLog(point, time.longValue());
            if (perfectConfigProperies.isLogSaveDb()){
                SLogEntity sLogEntity = new SLogEntity();
                sLogEntity.setOperation(SysLogBo.getRemark());
                sLogEntity.setUrl(SysLogBo.getUrl());
                sLogEntity.setTime(SysLogBo.getExecTime());
                sLogEntity.setHttp_method(SysLogBo.getHttpMethod());
                sLogEntity.setClass_name(SysLogBo.getClassName());
                sLogEntity.setClass_method(SysLogBo.getClassMethod());
                sLogEntity.setIp(SysLogBo.getIp());
                sLogEntity.setParams(SysLogBo.getParams());
                sLogEntity.setC_time(SysLogBo.getCreateDate());
                iSLogService.save(sLogEntity);
            }

        } catch (Exception e) {
            log.error("发生异常");
            log.error(e.getMessage());

        }
        return result;
    }



    /**
     * 保存日志
     * @param joinPoint
     * @param time
     */
    private SysLogBo printLog(ProceedingJoinPoint joinPoint, Long time) {

        // 获取request
        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = attributes.getRequest();

        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        SysLog sysLog = method.getAnnotation(SysLog.class);
        SysLogBo sysLogBo = SysLogBo.builder()
                                    .className(joinPoint.getTarget().getClass().getName())
                                    .httpMethod(request.getMethod())
                                    .classMethod(((MethodSignature) joinPoint.getSignature()).getName())
                                    .params( JSON.toJSONString(joinPoint.getArgs()))
                                    .execTime(time)
                                    .remark(sysLog.value())
                                    .createDate(LocalDateTime.now())
                                    .url(request.getRequestURL().toString())
                                    .ip(IPUtil.getIpAdd())
                                    .build();
        if(perfectConfigProperies.isOpenAopLog()){
            log.debug("======================日志开始================================");
            log.debug("日志名称         : " + sysLogBo.getRemark());
            log.debug("URL             : " + sysLogBo.getUrl());
            log.debug("HTTP方法         : " + sysLogBo.getHttpMethod());
            log.debug("IP               : " + sysLogBo.getIp());
            log.debug("类名             : " + sysLogBo.getClassName());
            log.debug("类方法           : " + sysLogBo.getClassMethod());
            log.debug("执行时间         : " + new BigDecimal(sysLogBo.getExecTime()).divide(BigDecimal.valueOf(1000)).toString() + "秒");
            log.debug("执行日期         : " + sysLogBo.getCreateDate());
            log.debug("参数             : " + sysLogBo.getParams());
            log.debug("======================日志结束================================");
        }
        return sysLogBo;
    }

    /**
     * 获取注解中对方法的描述信息 用于Controller层注解
     *
     * @param joinPoint 切点
     * @return 方法描述
     */
    public static String getControllerMethodDescription2(JoinPoint joinPoint) {
        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
        Method method = signature.getMethod();
        SysLog controllerLog = method
                .getAnnotation(SysLog.class);
        String discription = controllerLog.description();
        return discription;
    }

    /**
     *  异常通知
     * @param joinPoint
     * @param e
     */
    @AfterThrowing(pointcut = "sysLogAspect()", throwing = "e")
    public  void doAfterThrowing(JoinPoint joinPoint, Throwable e) {
        SLogEntity sLogEntity = logThreadLocal.get();
        if(sLogEntity != null){
            sLogEntity.setType("error");
            sLogEntity.setException(e.toString());
            new UpdateLogThread(sLogEntity, iSLogService).start();
        }
    }

    /**
     * 保存日志线程
     */
    private static class SaveLogThread implements Runnable {
        private SLogEntity log;

        private ISLogService logService;

        public SaveLogThread(SLogEntity log, ISLogService logService) {
            this.log = log;
            this.logService = logService;
        }

        @Override
        public void run() {
            logService.saveOrUpdate(log);
        }
    }

    /**
     * 日志更新线程
     */
    private static class UpdateLogThread extends Thread {

        private SLogEntity log;

        private ISLogService logService;

        public UpdateLogThread(SLogEntity log, ISLogService logService) {
            super(UpdateLogThread.class.getSimpleName());
            this.log = log;
            this.logService = logService;
        }

        @Override
        public void run() {
            this.logService.saveOrUpdate(log);
        }
    }
}