package com.perfect.framework.spring.aspect.v1.operlog;

import com.perfect.bean.bo.log.operate.OperationDataBo;
import com.perfect.bean.bo.session.user.UserSessionBo;
import com.perfect.bean.entity.log.operate.SLogOperDetailEntity;
import com.perfect.bean.entity.log.operate.SLogOperEntity;
import com.perfect.bean.vo.sys.config.dict.SDictDataVo;
import com.perfect.common.annotations.OperationDetailLogByIdAnnotion;
import com.perfect.common.annotations.OperationDetailLogByIdsAnnotion;
import com.perfect.common.annotations.OperationLogAnnotion;
import com.perfect.common.constant.PerfectConstant;
import com.perfect.common.enums.OperationEnum;
import com.perfect.common.enums.ParameterEnum;
import com.perfect.common.exception.BusinessException;
import com.perfect.common.utils.annotation.AnnotationResolverUtil;
import com.perfect.common.utils.reflect.ReflectUtils;
import com.perfect.common.utils.servlet.ServletUtil;
import com.perfect.core.mapper.log.operate.SLogOperMapper;
import com.perfect.core.service.log.operate.ISLogOperDetailService;
import com.perfect.core.service.log.operate.ISLogOperService;
import com.perfect.core.service.sys.config.dict.ISDictDataService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.time.LocalDateTime;
import java.util.*;

/**
 * 操作日志
 */
@Aspect
@Component
@Slf4j
public class OperationLogAspect {

	@Autowired
	SLogOperMapper sLogOperMapper;

    @Autowired
    ISLogOperService isLogOperService;

    @Autowired
    ISDictDataService isDictDataService;

    @Autowired
    ISLogOperDetailService isLogOperDetailService;

	@Pointcut("@annotation(com.perfect.common.annotations.OperationLogAnnotion)")
	public void pointcut() {
		// do nothing
	}

	@Around("pointcut()")
	public Object logAround(final ProceedingJoinPoint p) throws Throwable {
		MethodSignature signature = (MethodSignature) p.getSignature();
		Method method = signature.getMethod();
		OperationLogAnnotion operationlog = method.getAnnotation(OperationLogAnnotion.class);

		OperationEnum type = operationlog.type();
		if(operationlog.operationDetailsByIds().length > 0){
			// 更新
			if (OperationEnum.UPDATE.equals(type)) {
				return doOperationLogByIdsProcess(p, operationlog);
			}
			// 新增
			if (OperationEnum.ADD.equals(type)) {
				return doOperationLogByIdsProcess(p, operationlog);
			}
			// 逻辑删除
			if (OperationEnum.LOGIC_DELETE.equals(type)) {
				return doOperationLogByIdsProcess(p, operationlog);
			}
			// 物理删除
			if (OperationEnum.DELETE.equals(type)) {
				return doOperationLogByIdsProcess(p, operationlog);
			}
		} else {
			// 更新
			if (OperationEnum.UPDATE.equals(type)) {
				return doOperationLogByIdProcess(p, operationlog);
			}
			// 新增
			if (OperationEnum.ADD.equals(type)) {
				return doOperationLogByIdProcess(p, operationlog);
			}
			// 逻辑删除
			if (OperationEnum.LOGIC_DELETE.equals(type)) {
				return doOperationLogByIdProcess(p, operationlog);
			}
			// 物理删除
			if (OperationEnum.DELETE.equals(type)) {
				return doOperationLogByIdProcess(p, operationlog);
			}
		}
		return null;
	}

	/**
	 * 更新，by id
	 * @param p
	 * @param operationlog
	 */
	public Object doOperationLogByIdProcess(final ProceedingJoinPoint p,final OperationLogAnnotion operationlog) {
		// 主表
		SLogOperEntity operEntity = new SLogOperEntity();
		operEntity.setName(operationlog.name());
		operEntity.setType(operationlog.type().getName());
		operEntity.setPlatform(PerfectConstant.PLATFORM.PC);
		UserSessionBo bo = (UserSessionBo)ServletUtil.getUserSession();
		operEntity.setOper_id(bo.getStaff_Id());
		operEntity.setOper_name(bo.getStaff_info().getName());
		operEntity.setOper_time(LocalDateTime.now());
		Object[] args = p.getArgs();


		/** new 操作日志，执行过程bean */
		List<OperationDataBo> operationDataBoList = new ArrayList<>();
		/**
		 * 先获取旧值
		 */
		for(OperationDetailLogByIdAnnotion operationDetail : operationlog.operationDetailsById()){
			// 参数
			Object paraId = AnnotationResolverUtil.newInstance().resolver(p, operationDetail.id());

			String[] cloum = operationDetail.cloums();
			StringBuilder sql = new StringBuilder();
			String sqlTemplate = "";
			String logTable = operationDetail.table_name();
			Long id = (Long)paraId;
			/**
			 * 获取表字段
			 */
			Map<String, Object> columnCommentMap = new LinkedHashMap<>();
			SDictDataVo searchCondition = new SDictDataVo();
			searchCondition.setIs_del(false);
			searchCondition.setTable_name(logTable);
			List<SDictDataVo> columnCommentList = isDictDataService.selectColumnComment(searchCondition);
			for (SDictDataVo col : columnCommentList) {
				columnCommentMap.put(col.getColumn_name(), col.getColumn_comment());
			}
			// 获取更新前数据
			if (cloum.length == 0) {
				List<String> list = new ArrayList<String>();
				for(Map.Entry<String, Object> entry : columnCommentMap.entrySet()) {
					list.add(entry.getKey());
				}
				cloum = list.toArray(new String[list.size()]);
			}
			sql.append("SELECT ");
			for (int i = 0; i < cloum.length; i++) {
				if (i == 0) {
					sql.append("`" + cloum[i] + "` ");
				} else {
					sql.append(",`" + cloum[i] + "` ");
				}
			}
			sqlTemplate = sql.toString();
			sql.append(" FROM " + logTable + " WHERE id=" + id );
			Map<String, Object> oldMap = sLogOperMapper.selectAnyTalbe(sql.toString());

			OperationDataBo obo = new OperationDataBo();
			obo.setName(operationDetail.name());
			obo.setType(operationDetail.type());
			obo.setOper_info(operationDetail.oper_info());
			obo.setCloums(cloum);
			obo.setTable_name(logTable);
			obo.setSqlTemplate(sqlTemplate);
			obo.setColumnCommentMap(columnCommentMap);
			obo.setArgs(args);
			obo.setOldData(oldMap);
			operationDataBoList.add(obo);
		}

		/**
		 * 执行逻辑
		 */
		Object result = null;
		try {
			result = p.proceed();
		} catch (Throwable e) {
			throw new BusinessException(e);
		}

		/**
		 * 保存主表
		 */
		isLogOperService.save(operEntity);

		// 定义计数器
		int i = 0;
		/**
		 * 再获取新值，进行比较
		 */
		for(OperationDataBo obo : operationDataBoList) {
			String sqlTemplate = obo.getSqlTemplate();
			String[] cloum = obo.getCloums();
			Map<String, Object> oldMap = obo.getOldData();
			Map<String, Object> columnCommentMap = obo.getColumnCommentMap();

			// 查询新值
			// 再取一次参数，考虑新增场合
			Object paraId = AnnotationResolverUtil.newInstance().resolver(p, operationlog.operationDetailsById()[i].id());
			String sql = sqlTemplate + " FROM " + obo.getTable_name() + " WHERE id=" + paraId ;
			Map<String, Object> newMap = sLogOperMapper.selectAnyTalbe(sql);

			List<SLogOperDetailEntity> opds = new ArrayList<>();
			for (String clm : cloum) {
				Object oldclm = (oldMap == null ? null : oldMap.get(clm));
				Object newclm = newMap.get(clm);

				/**
				 * 	更新场合：只记录不相同的数据，否则数据量太大
 				 */
				if (oldclm != null && oldclm.equals(newclm)) {
					continue;
				}

				// 从表设置
				SLogOperDetailEntity opd = new SLogOperDetailEntity();
				opd.setOper_id(operEntity.getId());
				opd.setName(obo.getName());
				opd.setType(obo.getType().getName());
				opd.setOper_info(obo.getOper_info());
				opd.setTable_name(obo.getTable_name());
				opd.setOld_val((oldMap == null ? null : oldclm.toString()));
				opd.setNew_val(newclm.toString());
				opd.setClm_name(clm);
				opd.setClm_comment(columnCommentMap.get(clm).toString());
				opds.add(opd);
			}
			if (!opds.isEmpty()) {
				isLogOperDetailService.saveBatch(opds, opds.size());
			}
			i = i + 1;
		}

		return result;
	}

	/**
	 * 更新，by id
	 * @param p
	 * @param operationlog
	 */
	public Object doOperationLogByIdsProcess(final ProceedingJoinPoint p,final OperationLogAnnotion operationlog)
		throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
		// 主表
		SLogOperEntity operEntity = new SLogOperEntity();
		operEntity.setName(operationlog.name());
		operEntity.setType(operationlog.type().getName());
		operEntity.setPlatform(PerfectConstant.PLATFORM.PC);
		UserSessionBo bo = (UserSessionBo)ServletUtil.getUserSession();
		operEntity.setOper_id(bo.getStaff_Id());
		operEntity.setOper_name(bo.getStaff_info().getName());
		operEntity.setOper_time(LocalDateTime.now());
		Object[] args = p.getArgs();

		/** new 操作日志，执行过程bean */
		List<OperationDataBo> operationDataBoList = new ArrayList<>();
		/**
		 * 先获取旧值
		 */
		for(OperationDetailLogByIdsAnnotion operationDetail : operationlog.operationDetailsByIds()){
			String[] cloum = operationDetail.cloums();
			StringBuilder sql = new StringBuilder();
			String sqlTemplate = "";
			String logTable = operationDetail.table_name();
			/**
			 * 获取表字段
			 */
			Map<String, Object> columnCommentMap = new LinkedHashMap<>();
			SDictDataVo searchCondition = new SDictDataVo();
			searchCondition.setIs_del(false);
			searchCondition.setTable_name(logTable);
			List<SDictDataVo> columnCommentList = isDictDataService.selectColumnComment(searchCondition);
			for (SDictDataVo col : columnCommentList) {
				columnCommentMap.put(col.getColumn_name(), col.getColumn_comment());
			}
			// 获取更新前数据
			if (cloum.length == 0) {
				List<String> list = new ArrayList<String>();
				for(Map.Entry<String, Object> entry : columnCommentMap.entrySet()) {
					list.add(entry.getKey());
				}
				cloum = list.toArray(new String[list.size()]);
			}

			/**
			 * 获取参数 List<Bean>
			 */
			Class argsClass = args[operationDetail.id_position().getCode()].getClass();
			Method sizeMethod = argsClass.getDeclaredMethod("size", null);
			// list的size
			int sizeValue = (int)sizeMethod.invoke(args[operationDetail.id_position().getCode()]);

			/**
			 *  循环一下，ids
			 * */
			for (int j = 0; j < sizeValue; j++) {
				// 获取list中的值
				Method getMethod = argsClass.getDeclaredMethod("get", int.class);
				Object bean = getMethod.invoke(args[operationDetail.id_position().getCode()],j);
				// 获取id
				Method getIdMethod = bean.getClass().getDeclaredMethod("getId");
				Long id = (Long)getIdMethod.invoke(bean);

				sql.append("SELECT ");
				for (int i = 0; i < cloum.length; i++) {
					if (i == 0) {
						sql.append("`" + cloum[i] + "` ");
					} else {
						sql.append(",`" + cloum[i] + "` ");
					}
				}
				sqlTemplate = sql.toString();
				sql.append(" FROM " + logTable + " WHERE id=" + id );
				Map<String, Object> oldMap = sLogOperMapper.selectAnyTalbe(sql.toString());

				OperationDataBo obo = new OperationDataBo();
				obo.setPara_position(operationDetail.id_position().getCode());
				obo.setIds_index(j);
				obo.setName(operationDetail.name());
				obo.setType(operationDetail.type());
				obo.setOper_info(operationDetail.oper_info());
				obo.setCloums(cloum);
				obo.setTable_name(logTable);
				obo.setSqlTemplate(sqlTemplate);
				obo.setColumnCommentMap(columnCommentMap);
				obo.setArgs(args);
				obo.setOldData(oldMap);
				operationDataBoList.add(obo);
			}
		}

		/**
		 * 执行逻辑
		 */
		Object result = null;
		try {
			result = p.proceed();
		} catch (Throwable e) {
			throw new BusinessException(e);
		}

		/**
		 * 保存主表
		 */
		isLogOperService.save(operEntity);

		// 定义计数器
		int i = 0;
		/**
		 * 再获取新值，进行比较
		 */
		for(OperationDataBo obo : operationDataBoList) {
			String sqlTemplate = obo.getSqlTemplate();
			String[] cloum = obo.getCloums();
			Map<String, Object> oldMap = obo.getOldData();
			Map<String, Object> columnCommentMap = obo.getColumnCommentMap();

			/**
			 * 获取参数 List<Bean>
			 */
			Class argsClass = args[obo.getPara_position()].getClass();
			// 获取list中的值
			Method getMethod = argsClass.getDeclaredMethod("get", int.class);
			Object bean = getMethod.invoke(args[obo.getPara_position()],obo.getIds_index());
			// 获取id
			Method getIdMethod = bean.getClass().getDeclaredMethod("getId");
			Long id = (Long)getIdMethod.invoke(bean);

			// 查询新值
			// 再取一次参数，考虑新增场合
			String sql = sqlTemplate + " FROM " + obo.getTable_name() + " WHERE id=" + id ;
			Map<String, Object> newMap = sLogOperMapper.selectAnyTalbe(sql);

			List<SLogOperDetailEntity> opds = new ArrayList<>();
			for (String clm : cloum) {
				Object oldclm = (oldMap == null ? null : oldMap.get(clm));
				Object newclm = newMap.get(clm);

				/**
				 * 	更新场合：只记录不相同的数据，否则数据量太大
				 */
				if (oldclm != null && oldclm.equals(newclm)) {
					continue;
				}

				// 从表设置
				SLogOperDetailEntity opd = new SLogOperDetailEntity();
				opd.setOper_id(operEntity.getId());
				opd.setName(obo.getName());
				opd.setType(obo.getType().getName());
				opd.setOper_info(obo.getOper_info());
				opd.setTable_name(obo.getTable_name());
				opd.setOld_val((oldMap == null ? null : oldclm.toString()));
				opd.setNew_val(newclm.toString());
				opd.setClm_name(clm);
				opd.setClm_comment(columnCommentMap.get(clm).toString());
				opds.add(opd);
			}
			if (!opds.isEmpty()) {
				isLogOperDetailService.saveBatch(opds, opds.size());
			}
			i = i + 1;
		}

		return result;
	}
}
