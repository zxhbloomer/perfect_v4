package com.perfect.bean.vo.sys.config;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 系统icon
 * </p>
 *
 * @author zxh
 * @since 2020-07-08
 */
@Data
@NoArgsConstructor
@ApiModel(value = "系统icon", description = "系统icon")
@EqualsAndHashCode(callSuper=false)
public class SIconVo implements Serializable {

    private static final long serialVersionUID = 3563545209587030841L;

    private Long id;

    /**
     * icon 名称
     */
    private String name;
}
