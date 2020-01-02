package com.perfect.framework.spring.aspect.v1.operlog;

import com.perfect.bean.bo.log.operate.OperationDataBo;
import com.perfect.bean.bo.session.user.UserSessionBo;
import com.perfect.bean.entity.log.operate.SLogOperDetailEntity;
import com.perfect.bean.entity.log.operate.SLogOperEntity;
import com.perfect.bean.vo.sys.config.dict.SDictDataVo;
import com.perfect.common.annotation.OperationDetailLog;
import com.perfect.common.annotation.OperationLog;
import com.perfect.common.constant.PerfectConstant;
import com.perfect.common.enums.OperationEnum;
import com.perfect.common.utils.annotation.AnnotationResolverUtil;
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

	@Autowired
	private TransactionTemplate txTemplate;

	@Pointcut("@annotation(com.perfect.common.annotation.OperationLog)")
	public void pointcut() {
		// do nothing
	}

	@Around("pointcut()")
	public void logAround(final ProceedingJoinPoint p) throws Throwable {
		MethodSignature signature = (MethodSignature) p.getSignature();
		Method method = signature.getMethod();
		OperationLog operationlog = method.getAnnotation(OperationLog.class);

		OperationEnum type = operationlog.type();
		// 更新
		if (OperationEnum.UPDATE.equals(type)) {
			update(p, operationlog);
		}
		// 新增
		if (OperationEnum.ADD.equals(type)) {
			update(p, operationlog);
		}
		// 逻辑删除
		if (OperationEnum.LOGIC_DELETE.equals(type)) {
			update(p, operationlog);
		}
		// 物理删除
		if (OperationEnum.DELETE.equals(type)) {
			update(p, operationlog);
		}
	}

	/**
	 * 更新
	 * @param p
	 * @param operationlog
	 */
	public void update(final ProceedingJoinPoint p,final OperationLog operationlog) {
		// 主表
		SLogOperEntity operEntity = new SLogOperEntity();
		operEntity.setName(operationlog.name());
		operEntity.setType(operationlog.type().getName());
		operEntity.setPlatform(PerfectConstant.PLATFORM.PC);
		UserSessionBo bo = (UserSessionBo)ServletUtil.getUserSession();
		operEntity.setOper_id(bo.getStaff_Id());
		operEntity.setOper_name(bo.getStaff_info().getName());
		operEntity.setOper_time(LocalDateTime.now());

		/** new 操作日志，执行过程bean */
		List<OperationDataBo> operationDataBoList = new ArrayList<>();
		/**
		 * 先获取旧值
		 */
		for(OperationDetailLog operationDetail : operationlog.operationDetails()){
			// 参数
			Object paraId = AnnotationResolverUtil.newInstance().resolver(p, operationDetail.id());
			Object[] args = p.getArgs();

			String[] cloum = operationDetail.cloums();
			StringBuilder sql = new StringBuilder();
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
//							System.out.println("key:" + entry.getKey() + "   value:" + entry.getValue());
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
			sql.append(" FROM " + logTable + " WHERE id=" + id );
			Map<String, Object> oldMap = sLogOperMapper.selectAnyTalbe(sql.toString());

			OperationDataBo obo = new OperationDataBo();
			obo.setName(operationDetail.name());
			obo.setType(operationDetail.type());
			obo.setOper_info(operationDetail.oper_info());
			obo.setCloums(cloum);
			obo.setTable_name(logTable);
			obo.setSql(sql.toString());
			obo.setColumnCommentMap(columnCommentMap);
			obo.setArgs(args);
			obo.setOldData(oldMap);
			operationDataBoList.add(obo);
		}

		/**
		 * 执行逻辑
		 */
		try {
			p.proceed();
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}

		/**
		 * 保存主表
		 */
		isLogOperService.save(operEntity);

		/**
		 * 再获取新值，进行比较
		 */
		for(OperationDataBo obo : operationDataBoList) {
			String sql = obo.getSql();
			String[] cloum = obo.getCloums();
			Map<String, Object> oldMap = obo.getOldData();
			Map<String, Object> columnCommentMap = obo.getColumnCommentMap();

			// 查询新值
			Map<String, Object> newMap = sLogOperMapper.selectAnyTalbe(sql.toString());

			List<SLogOperDetailEntity> opds = new ArrayList<>();
			for (String clm : cloum) {
				Object oldclm = oldMap.get(clm);
				Object newclm = newMap.get(clm);

				// 从表设置
				SLogOperDetailEntity opd = new SLogOperDetailEntity();
				opd.setOper_id(operEntity.getId());
				opd.setName(obo.getName());
				opd.setType(obo.getType().getName());
				opd.setOper_info(obo.getOper_info());
				opd.setTable_name(obo.getTable_name());
				opd.setOld_val(oldclm.toString());
				opd.setNew_val(newclm.toString());
				opd.setClm_name(clm);
				opd.setClm_comment(columnCommentMap.get(clm).toString());
				opds.add(opd);
			}
			if (!opds.isEmpty()) {
				isLogOperDetailService.saveBatch(opds, opds.size());
			}

		}
	}
}
