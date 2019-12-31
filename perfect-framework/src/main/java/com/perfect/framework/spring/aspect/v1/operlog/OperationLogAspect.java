package com.perfect.framework.spring.aspect.v1.operlog;

import com.perfect.common.annotation.OperationLog;
import com.perfect.common.enums.OperationEnum;
import com.perfect.core.service.log.operate.ISLogOperDetailService;
import com.perfect.core.service.log.operate.ISLogOperService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import java.sql.Timestamp;
import java.util.*;

@Aspect
@Component
public class OperationLogAspect {

    @Autowired
    ISLogOperService isLogOperService;

    @Autowired
    ISLogOperDetailService isLogOperDetailService;

	@Autowired
	private TransactionTemplate txTemplate;

	@Pointcut("@annotation(com.perfect.common.annotation.OperationLog)")
	public void pointcut() {
		// do nothing
	}

	@Around("pointcut()")
	public void logAround(final ProceedingJoinPoint p,final OperationLog operationlog) throws
        Throwable {
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

	public void delete(final ProceedingJoinPoint p,final com.csp.operationlog.aspect.annotation.OperationLog operationlog) {
		txTemplate.execute(new TransactionCallbackWithoutResult() {
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				StringBuilder sql = new StringBuilder();
				OperationType type = operationlog.type();
				Object[] args = p.getArgs();
				String logName = operationlog.name();
				String logTable = operationlog.table();
				if (operationlog.idRef()==-1) {
					throw new RuntimeException();
				}
				String id = args[operationlog.idRef()].toString();
				String[] cloum = operationlog.cloum();
				String operatorId = args[operationlog.operatorIdRef()].toString();
				String operatorName = args[operationlog.operatorNameRef()].toString();

				Map<String, Object> columnCommentMap = new HashMap<String, Object>();
				List<ColumnComment> columnCommentList = operationLogMapper.selectColumnCommentByTable(logTable);

				for (ColumnComment cc : columnCommentList) {
					columnCommentMap.put(cc.getColumn(), cc.getComment());
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
				Map<String, Object> oldMap = operationLogMapper.selectAnyTalbe(sql.toString());

				try {
					p.proceed();
				} catch (Throwable e) {
					throw new RuntimeException(e);
				}

				if (oldMap!=null) {
					OperationLog op = new OperationLog();
					op.setName(logName);
					op.setTableName(logTable);
					op.setTableId(id);
					op.setType(type.getType());
					op.setOperatorId(operatorId);
					op.setOperatorName(operatorName);
					op.setOperationTime(new Timestamp(System.currentTimeMillis()));
					operationLogMapper.insertOperationLog(op);
					List<OperationLogDetail> opds = new ArrayList<OperationLogDetail>();
					for (String clm : cloum) {
						Object oldclm = oldMap.get(clm);
						OperationLogDetail opd = new OperationLogDetail();
						opd.setOldString(oldclm.toString());
						opd.setNewString("");
						opd.setClmName(clm);
						opd.setClmComment(columnCommentMap.get(clm).toString());
						opd.setOperationLogId(op.getId());
						opds.add(opd);
					}
					if (!opds.isEmpty()) {
						operationLogDetailMapper.insertOperationLogDetail(opds);
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
				List<ColumnComment> columnCommentList = operationLogMapper.selectColumnCommentByTable(logTable);

				for (ColumnComment cc : columnCommentList) {
					columnCommentMap.put(cc.getColumn(), cc.getComment());
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
				Map<String, Object> oldMap = operationLogMapper.selectAnyTalbe(sql.toString());
				try {
					p.proceed();
				} catch (Throwable e) {
					throw new RuntimeException(e);
				}
				Map<String, Object> newMap = operationLogMapper.selectAnyTalbe(sql.toString());
				if ((oldMap==null)||(!oldMap.get("id").toString().equals(newMap.get("id").toString()))) {

					OperationLog op = new OperationLog();
					op.setName(logName);
					op.setTableName(logTable);
					op.setTableId("");
					op.setType(type.getType());
					op.setOperatorId(operatorId);
					op.setOperatorName(operatorName);
					op.setOperationTime(new Timestamp(System.currentTimeMillis()));
					operationLogMapper.insertOperationLog(op);
					List<OperationLogDetail> opds = new ArrayList<OperationLogDetail>();
					for (String clm : cloum) {
						Object oldclm = "";
						Object newclm = newMap.get(clm);
						OperationLogDetail opd = new OperationLogDetail();
						opd.setOldString(oldclm.toString());
						opd.setNewString(newclm.toString());
						opd.setClmName(clm);
						opd.setClmComment(columnCommentMap.get(clm).toString());
						opd.setOperationLogId(op.getId());
						opds.add(opd);
					}
					if (!opds.isEmpty()) {
						operationLogDetailMapper.insertOperationLogDetail(opds);
					}

				}
			}
		});
	}

	public void update(final ProceedingJoinPoint p,final com.csp.operationlog.aspect.annotation.OperationLog operationlog) {
		txTemplate.execute(new TransactionCallbackWithoutResult() {
			@Override
			protected void doInTransactionWithoutResult(TransactionStatus status) {
				StringBuilder sql = new StringBuilder();
				OperationType type = operationlog.type();
				Object[] args = p.getArgs();
				String logName = operationlog.name();
				String logTable = operationlog.table();
				if (operationlog.idRef()==-1) {
					throw new RuntimeException();
				}
				String id = args[operationlog.idRef()].toString();
				String[] cloum = operationlog.cloum();
				String operatorId = args[operationlog.operatorIdRef()].toString();
				String operatorName = args[operationlog.operatorNameRef()].toString();

				Map<String, Object> columnCommentMap = new HashMap<String, Object>();
				List<ColumnComment> columnCommentList = operationLogMapper.selectColumnCommentByTable(logTable);

				for (ColumnComment cc : columnCommentList) {
					columnCommentMap.put(cc.getColumn(), cc.getComment());
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
				Map<String, Object> oldMap = operationLogMapper.selectAnyTalbe(sql.toString());

				try {
					p.proceed();
				} catch (Throwable e) {
					throw new RuntimeException(e);
				}

				Map<String, Object> newMap = operationLogMapper.selectAnyTalbe(sql.toString());
				if (oldMap!=null&&newMap!=null) {
					OperationLog op = new OperationLog();
					op.setName(logName);
					op.setTableName(logTable);
					op.setTableId(id);
					op.setType(type.getType());
					op.setOperatorId(operatorId);
					op.setOperatorName(operatorName);
					op.setOperationTime(new Timestamp(System.currentTimeMillis()));
					operationLogMapper.insertOperationLog(op);
					List<OperationLogDetail> opds = new ArrayList<OperationLogDetail>();
					for (String clm : cloum) {
						Object oldclm = oldMap.get(clm);
						Object newclm = newMap.get(clm);
						OperationLogDetail opd = new OperationLogDetail();
						opd.setOldString(oldclm.toString());
						opd.setNewString(newclm.toString());
						opd.setClmName(clm);
						opd.setClmComment(columnCommentMap.get(clm).toString());
						opd.setOperationLogId(op.getId());
						opds.add(opd);
					}
					if (!opds.isEmpty()) {
						operationLogDetailMapper.insertOperationLogDetail(opds);
					}
				}
			}
		});
	}
}
