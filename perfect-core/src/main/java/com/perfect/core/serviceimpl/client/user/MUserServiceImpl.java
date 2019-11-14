package com.perfect.core.serviceimpl.client.user;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.perfect.bean.bo.session.user.UserSessionBo;
import com.perfect.bean.bo.user.login.MUserBo;
import com.perfect.bean.entity.master.user.MStaffEntity;
import com.perfect.bean.entity.master.user.MUserEntity;
import com.perfect.bean.entity.sys.config.tenant.STentantEntity;
import com.perfect.bean.pojo.redis.user.UserInSessionPojo;
import com.perfect.bean.pojo.result.CheckResult;
import com.perfect.bean.pojo.result.InsertResult;
import com.perfect.bean.pojo.result.UpdateResult;
import com.perfect.bean.result.utils.v1.CheckResultUtil;
import com.perfect.bean.result.utils.v1.InsertResultUtil;
import com.perfect.bean.result.utils.v1.UpdateResultUtil;
import com.perfect.bean.vo.master.user.MStaffVo;
import com.perfect.bean.vo.master.user.MUserVo;
import com.perfect.bean.vo.master.user.UserInfoVo;
import com.perfect.bean.vo.sys.config.tenant.STentantVo;
import com.perfect.common.exception.BusinessException;
import com.perfect.core.mapper.master.user.MStaffMapper;
import com.perfect.core.mapper.client.user.MUserMapper;
import com.perfect.core.mapper.sys.config.tentant.STentantMapper;
import com.perfect.core.service.client.user.IMUserService;
import com.perfect.core.service.master.user.IMStaffService;
import com.perfect.core.service.sys.config.tentant.ITentantService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author jobob
 * @since 2019-05-17
 */
@Service
@Slf4j
public class MUserServiceImpl extends ServiceImpl<MUserMapper, MUserEntity> implements IMUserService {

    @Autowired
    private MUserMapper mUserMapper;
    @Autowired
    private IMStaffService imStaffService;
    @Autowired
    private ITentantService iTentantService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        MUserEntity user = mUserMapper.getDataByName(username);

        if (user == null) {
            log.error("您输入的用户名不存在！");
            throw new UsernameNotFoundException("您输入的用户名不存在！");
        }

        //        Clerk clerk = clerkMapper.selectByPrimaryKey(user.getId());
        //        if (clerk == null) {
        //            throw new ClerkNotFoundException("Couldn't found clerk in system");
        //        }
        //
        //        List<Role> roles = userMapper.selectRoles(user.getId());
        //
        List<String> permissions = new ArrayList<>();
        permissions.addAll(CollectionUtils.arrayToList(new String[]{"ROLE_USER"}));
        //        for (Role role : roles) {
        //            permissions.addAll(CollectionUtils.arrayToList(role.getPermissions()));
        //        }

        return new MUserBo(
                user.getId(),
                username,
                user.getPwd(),
                AuthorityUtils.createAuthorityList(permissions.toArray(new String[]{})))   // 加载权限的关键部分
                .setUser(user);
    }

    /**
     * 获取use的基本信息
     * @param userName
     * @return
     */
    @Override
    public UserInfoVo getUserInfo(String userName){

        // TODO 测试bean
        UserInfoVo ui = new UserInfoVo();
        ui.setAvatar("https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif");
        ui.setIntroduction("我是超级管理员");
        ui.setName("超级管理员");
        ui.setRoles(new String[]{"admin"});
        return ui;
    }

    /**
     * 获取userbean
     * @param user_id
     * @return
     */
    @Override
    public UserSessionBo getUserBean(long user_id){
        MUserEntity mUserEntity = mUserMapper.selectById(user_id);
        MStaffVo mStaffVo = imStaffService.selectByid(mUserEntity.getId());
        STentantVo sTentantVo = iTentantService.selectByid(mStaffVo != null ? mStaffVo.getTentant_id() : null);
        UserSessionBo userSessionBo = new UserSessionBo();
        userSessionBo.setUser_info(mUserEntity);
        userSessionBo.setStaff_info(mStaffVo);
        userSessionBo.setTentant_info(sTentantVo);

        // 设置basebean
        userSessionBo.setAccountId(mUserEntity.getId());
        userSessionBo.setTenant_Id(mStaffVo != null ? mStaffVo.getTentant_id() : null);

        return userSessionBo;
    }



    /**
     * 插入一条记录（选择字段，策略插入）
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public InsertResult<Integer> insert(MUserEntity entity) {
        // 插入前check
        CheckResult cr = checkLogic(entity, CheckResult.INSERT_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 插入逻辑保存
        entity.setIs_del(false);
        return InsertResultUtil.OK(mUserMapper.insert(entity));
    }

    /**
     * 更新一条记录（选择字段，策略更新）
     * @param entity 实体对象
     * @return
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public UpdateResult<Integer> update(MUserEntity entity) {
        // 更新前check
        CheckResult cr = checkLogic(entity, CheckResult.UPDATE_CHECK_TYPE);
        if (cr.isSuccess() == false) {
            throw new BusinessException(cr.getMessage());
        }
        // 更新逻辑保存
        return UpdateResultUtil.OK(mUserMapper.updateById(entity));
    }

    /**
     * 获取数据byid
     * @param id
     * @return
     */
    @Override
    public MUserVo selectByid(Long id){
        return mUserMapper.selectByid(id);
    }

    /**
     * check逻辑
     * @return
     */
    public CheckResult checkLogic(MUserEntity entity, String moduleType){
        return CheckResultUtil.OK();
    }
}