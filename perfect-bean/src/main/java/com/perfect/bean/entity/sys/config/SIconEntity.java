package com.perfect.bean.entity.sys.config;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

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
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("s_icon")
public class SIconEntity implements Serializable {

    private static final long serialVersionUID = 2269794241861777128L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * icon 名称
     */
    @TableField("name")
    private String name;


}
