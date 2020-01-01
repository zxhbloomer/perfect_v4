package com.perfect.framework.spring.aspect.v1.operlog;

import com.perfect.bean.bo.session.user.UserSessionBo;
import com.perfect.bean.entity.log.operate.SLogOperDetailEntity;
import com.perfect.bean.entity.log.operate.SLogOperEntity;
import com.perfect.bean.vo.sys.config.dict.SDictDataVo;
import com.perfect.common.annotation.OperationLog;
import com.perfect.common.annotation.SysLog;
import com.perfect.common.enums.OperationEnum;
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
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.*;

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
		if (OperationEnum.UPDATE.equals(type)) {
			update(p, operationlog);
		}
		if (OperationEnum.ADD.equals(type)) {
			add(p, operationlog);
		}
		if (OperationEnum.LOGIC_DELETE.equals(type)) {
			logic_delete(p, operationlog);
		}
		if (OperationEnum.LOGIC_DELETE.equals(type)) {
			delete(p, operationlog);
		}
	}

	/**
	 * 物理删除
	 * @param p
	 * @param operationlog
	 */
	public void delete(final ProceedingJoinPoint p,final OperationLog operationlog) {
		txTemplate.execute(new TransactionCallbackWithoutResult() {
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				StringBuilder sql = new StringBuilder();
				OperationEnum type = operationlog.type();
				Object[] args = p.getArgs();
				String logName = operationlog.name();
				String logTable = operationlog.table();
				if (operationlog.idRef()==-1) {
					throw new RuntimeException();
				}
				String id = args[operationlog.idRef()].toString();
				String[] cloum = operationlog.cloum();

				Map<String, Object> columnCommentMap = new HashMap<String, Object>();
				SDictDataVo searchCondition = new SDictDataVo();
				searchCondition.setIs_del(false);
				searchCondition.setTable_name(logTable);
				List<SDictDataVo> columnCommentList = isDictDataService.selectColumnComment(searchCondition);

				for (SDictDataVo col : columnCommentList) {
					columnCommentMap.put(col.getColumn_name(), col.getColumn_comment());
				}
				if (cloum.length == 0) {
					Set<String> keySet = columnCommentMap.keySet();
					List<String> list = new ArrayList<String>();
					for (String o : keySet) {
						list.add(o.toString());
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
				sql.append(" FROM " + logTable + " WHERE id=" + id);
				Map<String, Object> oldMap = sLogOperMapper.selectAnyTalbe(sql.toString());

				try {
					p.proceed();
				} catch (Throwable e) {
					throw new RuntimeException(e);
				}

				if (oldMap!=null) {
					SLogOperEntity op = new SLogOperEntity();
					op.setName(logName);
					op.setTable(logTable);
					op.setType(type.getType());
					UserSessionBo bo = (UserSessionBo)ServletUtil.getUserSession();
					op.setOper_id(bo.getStaff_Id());
					op.setOper_name(bo.getStaff_info().getName());
					op.setOper_time(LocalDateTime.now());
					isLogOperService.save(op);

					List<SLogOperDetailEntity> opds = new ArrayList<SLogOperDetailEntity>();
					for (String clm : cloum) {
						Object oldclm = oldMap.get(clm);
						SLogOperDetailEntity opd = new SLogOperDetailEntity();
						opd.setOld_val(oldclm.toString());
						opd.setNew_val("");
						opd.setClm_name(clm);
						opd.setClm_comment(columnCommentMap.get(clm).toString());
						opd.setOper_id(op.getId());
						opds.add(opd);
					}
					if (!opds.isEmpty()) {
						isLogOperDetailService.saveBatch(opds);
					}
				}
			}
		});
	}

	/**
	 * 新增
	 * @param p
	 * @param operationlog
	 */
	private void add(final ProceedingJoinPoint p,final OperationLog operationlog) {
		txTemplate.execute(new TransactionCallbackWithoutResult() {
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				StringBuilder sql = new StringBuilder();
				OperationEnum type = operationlog.type();
				Object[] args = p.getArgs();
				String logName = operationlog.name();
				String logTable = operationlog.table();
				String[] cloum = operationlog.cloum();

				Map<String, Object> columnCommentMap = new HashMap<String, Object>();
                SDictDataVo searchCondition = new SDictDataVo();
                searchCondition.setIs_del(false);
                searchCondition.setTable_name(logTable);
				List<SDictDataVo> columnCommentList = isDictDataService.selectColumnComment(searchCondition);

				for (SDictDataVo col : columnCommentList) {
					columnCommentMap.put(col.getColumn_name(), col.getColumn_comment());
				}
				if (cloum.length == 0) {
					Set<String> keySet = columnCommentMap.keySet();
					List<String> list = new ArrayList<String>();
					for (String o : keySet) {
						list.add(o.toString());
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
				sql.append(" FROM " + logTable + " ORDER BY id DESC LIMIT 1");
				Map<String, Object> oldMap = sLogOperMapper.selectAnyTalbe(sql.toString());
				try {
					p.proceed();
				} catch (Throwable e) {
					throw new RuntimeException(e);
				}
				Map<String, Object> newMap = sLogOperMapper.selectAnyTalbe(sql.toString());
				if ((oldMap==null)||(!oldMap.get("id").toString().equals(newMap.get("id").toString()))) {
					SLogOperEntity op = new SLogOperEntity();
					op.setName(logName);
					op.setTable(logTable);
					op.setType(type.getType());
					UserSessionBo bo = (UserSessionBo)ServletUtil.getUserSession();
					op.setOper_id(bo.getStaff_Id());
					op.setOper_name(bo.getStaff_info().getName());
					op.setOper_time(LocalDateTime.now());
					isLogOperService.save(op);

					List<SLogOperDetailEntity> opds = new ArrayList<SLogOperDetailEntity>();
					for (String clm : cloum) {
						Object oldclm = "";
						Object newclm = newMap.get(clm);
						SLogOperDetailEntity opd = new SLogOperDetailEntity();
						opd.setOld_val(oldclm.toString());
						opd.setNew_val(newclm.toString());
						opd.setClm_name(clm);
						opd.setClm_comment(columnCommentMap.get(clm).toString());
						opd.setOper_id(op.getId());
						opds.add(opd);
					}
					if (!opds.isEmpty()) {
						isLogOperDetailService.saveBatch(opds);
					}

				}
			}
		});
	}

	/**
	 * 更新
	 * @param p
	 * @param operationlog
	 */
	public void update(final ProceedingJoinPoint p,final OperationLog operationlog) {
		txTemplate.execute(new TransactionCallbackWithoutResult() {
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				StringBuilder sql = new StringBuilder();
				OperationEnum type = operationlog.type();
				Object[] args = p.getArgs();
				String logName = operationlog.name();
				String logTable = operationlog.table();
				if (operationlog.idRef()==-1) {
					throw new RuntimeException();
				}
				String id = args[operationlog.idRef()].toString();
				String[] cloum = operationlog.cloum();

				Map<String, Object> columnCommentMap = new HashMap<String, Object>();
				SDictDataVo searchCondition = new SDictDataVo();
				searchCondition.setIs_del(false);
				searchCondition.setTable_name(logTable);
				List<SDictDataVo> columnCommentList = isDictDataService.selectColumnComment(searchCondition);

				for (SDictDataVo col : columnCommentList) {
					columnCommentMap.put(col.getColumn_name(), col.getColumn_comment());
				}
				if (cloum.length == 0) {
					Set<String> keySet = columnCommentMap.keySet();
					List<String> list = new ArrayList<String>();
					for (String o : keySet) {
						list.add(o.toString());
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
				sql.append(" FROM " + logTable + " WHERE id=" + id);
				Map<String, Object> oldMap = sLogOperMapper.selectAnyTalbe(sql.toString());

				try {
					p.proceed();
				} catch (Throwable e) {
					throw new RuntimeException(e);
				}

				Map<String, Object> newMap = sLogOperMapper.selectAnyTalbe(sql.toString());
				if (oldMap!=null&&newMap!=null) {
					SLogOperEntity op = new SLogOperEntity();
					op.setName(logName);
					op.setTable(logTable);
					op.setType(type.getType());
					UserSessionBo bo = (UserSessionBo)ServletUtil.getUserSession();
					op.setOper_id(bo.getStaff_Id());
					op.setOper_name(bo.getStaff_info().getName());
					op.setOper_time(LocalDateTime.now());
					isLogOperService.save(op);

					List<SLogOperDetailEntity> opds = new ArrayList<SLogOperDetailEntity>();
					for (String clm : cloum) {
						Object oldclm = oldMap.get(clm);
						Object newclm = newMap.get(clm);
						SLogOperDetailEntity opd = new SLogOperDetailEntity();
						opd.setOld_val(oldclm.toString());
						opd.setNew_val(newclm.toString());
						opd.setClm_name(clm);
						opd.setClm_comment(columnCommentMap.get(clm).toString());
						opd.setOper_id(op.getId());
						opds.add(opd);
					}
					if (!opds.isEmpty()) {
						isLogOperDetailService.saveBatch(opds);
					}
				}
			}
		});
	}

	/**
	 * 逻辑删除
	 * @param p
	 * @param operationlog
	 */
	public void logic_delete(final ProceedingJoinPoint p,final OperationLog operationlog) {
		txTemplate.execute(new TransactionCallbackWithoutResult() {
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				StringBuilder sql = new StringBuilder();
				OperationEnum type = operationlog.type();
				Object[] args = p.getArgs();
				String logName = operationlog.name();
				String logTable = operationlog.table();
				if (operationlog.idRef()==-1) {
					throw new RuntimeException();
				}
				String id = args[operationlog.idRef()].toString();
				String[] cloum = operationlog.cloum();

				Map<String, Object> columnCommentMap = new HashMap<String, Object>();
				SDictDataVo searchCondition = new SDictDataVo();
				searchCondition.setIs_del(false);
				searchCondition.setTable_name(logTable);
				List<SDictDataVo> columnCommentList = isDictDataService.selectColumnComment(searchCondition);

				for (SDictDataVo col : columnCommentList) {
					columnCommentMap.put(col.getColumn_name(), col.getColumn_comment());
				}
				if (cloum.length == 0) {
					Set<String> keySet = columnCommentMap.keySet();
					List<String> list = new ArrayList<String>();
					for (String o : keySet) {
						list.add(o.toString());
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
				sql.append(" FROM " + logTable + " WHERE id=" + id);
				Map<String, Object> oldMap = sLogOperMapper.selectAnyTalbe(sql.toString());

				try {
					p.proceed();
				} catch (Throwable e) {
					throw new RuntimeException(e);
				}

				Map<String, Object> newMap = sLogOperMapper.selectAnyTalbe(sql.toString());
				if (oldMap!=null&&newMap!=null) {
					SLogOperEntity op = new SLogOperEntity();
					op.setName(logName);
					op.setTable(logTable);
					op.setType(type.getType());
					UserSessionBo bo = (UserSessionBo)ServletUtil.getUserSession();
					op.setOper_id(bo.getStaff_Id());
					op.setOper_name(bo.getStaff_info().getName());
					op.setOper_time(LocalDateTime.now());
					isLogOperService.save(op);

					List<SLogOperDetailEntity> opds = new ArrayList<SLogOperDetailEntity>();
					for (String clm : cloum) {
						Object oldclm = oldMap.get(clm);
						Object newclm = newMap.get(clm);
						SLogOperDetailEntity opd = new SLogOperDetailEntity();
						opd.setOld_val(oldclm.toString());
						opd.setNew_val(newclm.toString());
						opd.setClm_name(clm);
						opd.setClm_comment(columnCommentMap.get(clm).toString());
						opd.setOper_id(op.getId());
						opds.add(opd);
					}
					if (!opds.isEmpty()) {
						isLogOperDetailService.saveBatch(opds);
					}
				}
			}
		});
	}
}
