package com.perfect.bean.vo.sys.areas;

import com.perfect.bean.vo.common.component.TreeNode;
import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * <p>
 * 省市区
 * </p>
 *
 * @author zxh
 * @since 2019-10-31
 */
@Data
@NoArgsConstructor
@ApiModel(value = "省市区", description = "省市区")
public class SAreasCascaderTreeVo extends TreeNode implements Serializable {

    private static final long serialVersionUID = 8330843713725719097L;

    /**
     * 级联控件使用，父节点id
     */
    private Long value;

}
