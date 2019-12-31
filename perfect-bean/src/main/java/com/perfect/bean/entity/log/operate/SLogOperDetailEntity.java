package com.perfect.bean.entity.log.operate;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableField;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 操作日志明细表
 * </p>
 *
 * @author zxh
 * @since 2019-12-31
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("s_log_oper_detail")
public class SLogOperDetailEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 操作日志记录
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 操作业务名
     */
    @TableField("oper_id")
    private Long oper_id;

    /**
     * 业务类型（0其它 1新增 2修改 3逻辑删除 4物理删除）
     */
    @TableField("clm_name")
    private String clm_name;

    /**
     * 操作类别（0其它 1后台用户 2手机端用户）
     */
    @TableField("clm_comment")
    private String clm_comment;

    /**
     * 表名
     */
    @TableField("table")
    private String table;

    /**
     * 旧值
     */
    @TableField("old_val")
    private String old_val;

    /**
     * 新值
     */
    @TableField("new_val")
    private String new_val;


}
