package com.perfect.bean.vo.sys.areas;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * <p>
 * 市
 * </p>
 *
 * @author zxh
 * @since 2019-10-31
 */
@Data
@NoArgsConstructor
@ApiModel(value = "市", description = "市")
public class SAreaCitiesVo implements Serializable {

    private static final long serialVersionUID = -1579651769183614222L;

    private Long id;

    /**
     * 市级编号
     */
    private Integer code;

    /**
     * 市名称
     */
    private String name;


}
