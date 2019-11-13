package com.perfect.bean.vo.master.org;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 组织主表
 * </p>
 *
 * @author zxh
 * @since 2019-11-12
 */
@Data
@NoArgsConstructor
@ApiModel(value = "组织主表", description = "组织主表")
public class MOrgVo implements Serializable {

    private static final long serialVersionUID = 6709627756368776224L;
    
    private Long id;

    /**
     * 上级组织，null为根节点
     */
    private Long parent_id;

    /**
     * 租户id，根节点
     */
    private Long tentant_id;

    /**
     * 关联单号
     */
    private String serial_no;

    /**
     * 关联单号类型
     */
    private String serial_type;

    /**
     * 编号，00010001..
     */
    private String code;

    /**
     * 类型：10（租户）、20（集团）、30（公司）、40（部门）、50（岗位）、60（人员）
     */
    private String type;

    /**
     * 排序
     */
    private Integer sort;

    private Long c_id;

    private LocalDateTime c_time;

    private Long u_id;

    private LocalDateTime u_time;

    /**
     * 数据版本，乐观锁使用
     */
    private Integer dbversion;

}
