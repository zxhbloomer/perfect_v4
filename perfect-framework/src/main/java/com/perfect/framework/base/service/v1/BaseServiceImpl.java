package com.perfect.framework.base.service.v1;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * 扩展Mybatis-Plus接口
 *
 * @author
 */
public abstract class BaseServiceImpl<M extends BaseMapper<T>, T> implements IService<T> {


}
