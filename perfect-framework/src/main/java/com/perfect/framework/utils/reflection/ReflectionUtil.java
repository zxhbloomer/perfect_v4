package com.perfect.framework.utils.reflection;

import com.alibaba.fastjson.JSONObject;
import com.perfect.bean.pojo.mqsender.MqSenderPojo;
import com.perfect.bean.pojo.reflection.CallInfoReflectionPojo;
import com.perfect.framework.utils.spring.SpringContextsUtil;
import org.joor.Reflect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Method;
import java.lang.reflect.Type;

import static org.joor.Reflect.on;

/**
 * @ClassName: ReflectionUtil
 * @Description: 反射类
 * @Author: zxh
 * @date: 2019/10/15
 * @Version: 1.0
 */
public class ReflectionUtil {

    /**
     * todo:考虑数据放到redis中，然后需要回调则考虑回调，没有就没有
     * https://github.com/notMyPen/spring-cloud-clover/blob/126d26bdc0da8a51de68774897ee859dd67a3c31/clover-business-starter/src/main/java/rrx/cnuo/cncommon/utils/MqSendTool.java
     */

    /**
     * 这个为spring版本
     */
    @Autowired
    @Deprecated
    private SpringContextsUtil springContextsUtil;

    public void reInvoke(String beanName, String methodName, String[] params) {
        Method method = ReflectionUtils
            .findMethod(springContextsUtil.getBean(beanName).getClass(), methodName, String.class, String.class,
                Boolean.class, String.class);
        Object[] param1 = new Object[3];
        param1[0] = params[0];
        param1[1] = params[1];
        param1[2] = true;
        ReflectionUtils.invokeMethod(method, springContextsUtil.getBean(beanName), param1);
    }


    /**
     * 以下为非spring版本
     * @param className              类名                   "audit.service.DegreeFunctionTest"
     * @param functionName           函数名                 "saveDo"
     * @param parameterClass         参数类型名              "audit.entity.entityTest.TestListBean"
     * @param parameter              参数数据                '[{"x1":"setData","x2":88888888,"x3":true,"x4":[{"x1":"setSubList1","x2":55555555,"x3":true,"x4":[{"x1":"TestSubSubListBean1","x2":111111,"x3":true},{"x1":"TestSubSubListBean2","x2":222222,"x3":true}]},{"x1":"setSubList2","x2":333333,"x3":true,"x4":[{"x1":"TestSubSubListBean1","x2":111111,"x3":true},{"x1":"TestSubSubListBean2","x2":222222,"x3":true}]}]},{"x1":"setData","x2":7777777,"x3":true,"x4":[{"x1":"setSubList1","x2":55555555,"x3":true,"x4":[{"x1":"TestSubSubListBean1","x2":111111,"x3":true},{"x1":"TestSubSubListBean2","x2":222222,"x3":true}]},{"x1":"setSubList2","x2":333333,"x3":true,"x4":[{"x1":"TestSubSubListBean1","x2":111111,"x3":true},{"x1":"TestSubSubListBean2","x2":222222,"x3":true}]}]}]'
     * @return
     */
    public static boolean invoke(String className, String functionName, String parameterClass, String parameter) {
        if (className == null || "".equals(className.trim())) {
            return false;
        }
        if (functionName == null || "".equals(functionName.trim())) {
            return false;
        }

        // 返回值
        String rtnString = "";

        // 执行方法
        rtnString = String.valueOf(on(className).create().call(functionName, parameterClass, parameter));
        return true;
    }

    /**
     *
     * @param className
     * @param functionName
     * @param arg
     * @return
     */
    public static boolean invoke(String className, String functionName, Object arg) {
        if (className == null || "".equals(className.trim())) {
            return false;
        }
        if (functionName == null || "".equals(functionName.trim())) {
            return false;
        }

        // 返回值
        // 执行方法
        Object rtn = on(className).create().call(functionName, arg);
        return true;
    }

    /**
     * 传对象
     * @param reflectionPojo
     * @return
     */
    public static boolean invokeByString(CallInfoReflectionPojo reflectionPojo) {
        if(reflectionPojo == null){
            return false;
        }

        return ReflectionUtil.invoke(reflectionPojo.getClassName(),
                                reflectionPojo.getFunctionName(),
                                reflectionPojo.getParameterBeanClass(),
                                reflectionPojo.getParameterJson());
    }

    /**
     * 传对象
     * @param reflectionPojo
     * @return
     */
    public static boolean invokeByObject(CallInfoReflectionPojo reflectionPojo) {
        if(reflectionPojo == null){
            return false;
        }

        Object arg = ReflectionUtil.getClassBean(reflectionPojo.getParameterBeanClass(), reflectionPojo.getParameterJson());

        return ReflectionUtil.invoke(reflectionPojo.getClassName(),
            reflectionPojo.getFunctionName(),
            arg);
    }

    /**
     * 获取类型，包含数据
     * @param type
     * @param jsonData
     * @return
     */
    public static Object getClassBean(String type, String jsonData){
        Object obClass = on(type).create();
        Object obObject = JSONObject.parseObject(jsonData, ((Reflect)obClass).type());
        return obObject;
    }


//
//    /**
//     * 保存的function
//     * @param parameterClass
//     * @param parameter
//     * @return
//     * @throws ClassNotFoundException
//     */
//    public String saveDo(String parameterClass , String parameter) throws ClassNotFoundException {
//        String rtn = "调用成功saveDo";
//        // 参数初始化
//        Class clazz = null;
//        try {
//            clazz = Class.forName(parameterClass);
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//            System.out.println(e);
//            throw e;
//        }
//        List<TestListBean> paramaterList = JSON.parseArray(parameter ,clazz);
//        JSON.parse(parameter);
//        JSONArray.parse(parameter);
//        System.out.println(rtn);
//        return  rtn;
//    }
}
