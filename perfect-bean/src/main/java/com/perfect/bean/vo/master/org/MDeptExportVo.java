package com.perfect.bean.vo.master.org;

import com.perfect.bean.vo.common.condition.PageCondition;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 * 部门主表
 * </p>
 *
 * @author zxh
 * @since 2019-11-12
 */
@Data
@NoArgsConstructor
@ApiModel(value = "部门主表", description = "部门主表")
public class MDeptExportVo implements Serializable {

    private static final long serialVersionUID = 160255159388247094L;

    private Long id;

    /**
     * 编码
     */
    private String code;

    /**
     * 全称
     */
    private String name;

    /**
     * 简称
     */
    private String simple_name;

    /**
     * 负责人
     */
    private Long handler_id;

    /**
     * 部门副负责人
     */
    private Long sub_handler_id;

    /**
     * 部门主管领导
     */
    private Long leader_id;

    /**
     * 描述
     */
    private String descr;

    /**
     * 是否删除
     */
    private Boolean is_del;

    /**
     * 租户id
     */
    private Long tenant_id;

    private Long c_id;

    private LocalDateTime c_time;

    private Long u_id;

    private LocalDateTime u_time;

    /**
     * 数据版本，乐观锁使用
     */
    private Integer dbversion;

    /**
     * 换页条件
     */
    private PageCondition pageCondition;
}
