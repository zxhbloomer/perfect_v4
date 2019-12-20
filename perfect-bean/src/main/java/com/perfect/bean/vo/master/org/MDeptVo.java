package com.perfect.bean.vo.master.org;

import com.baomidou.mybatisplus.annotation.*;
import com.perfect.bean.vo.common.condition.PageCondition;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

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
public class MDeptVo implements Serializable {

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
     * 部门主管
     */
    private Long handler_id;
    private String handler_id_name;

    /**
     * 部门副主管
     */
    private Long sub_handler_id;
    private String sub_handler_id_name;

    /**
     * 上级主管领导
     */
    private Long leader_id;
    private String leader_id_name;

    /**
     * 上级分管领导
     */
    private Long response_leader_id;
    private String response_leader_id_name;

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
     * 关联单号
     */
    private Long parent_serial_id;

    /**
     * 关联单号类型
     */
    private String parent_serial_type;
    private String parent_name;
    private String parent_simple_name;
    private String parent_type_text;

    /**
     * 弹出框模式：空：普通模式；10：组织使用，需要排除已经选择的数据；
     */
    private String dataModel;

    /**
     * 换页条件
     */
    private PageCondition pageCondition;
}
