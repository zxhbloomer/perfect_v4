package com.perfect.bean.vo.sys.platform;

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
 * 编码控制
 * </p>
 *
 * @author zxh
 * @since 2019-12-12
 */
@Data
@NoArgsConstructor
@ApiModel(value = "编码控制表", description = "编码控制表")
public class SCodeVo implements Serializable {

    private static final long serialVersionUID = 4617915261869763630L;

    private Long id;

    /**
     * 编码类型
     */
    private String type;

    /**
     * 编码规则
     */
    private String rule;

    /**
     * 当前编码
     */
    private String code;

    /**
     * 代码增加序号
     */
    private Long auto_create;

    /**
     * 字典标签
     */
    private String dict_label;


    /**
     * 数据版本，乐观锁使用
     */
    private Integer dbversion;

    /**
     * 换页条件
     */
    private PageCondition pageCondition;

}
