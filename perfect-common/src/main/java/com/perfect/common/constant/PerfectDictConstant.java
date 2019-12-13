package com.perfect.common.constant;

/**
 * @author zxh
 * @date 2019/9/23
 */
public class PerfectDictConstant {
    // 字典类型
    /**
     * 删除类型：0：未删除 1：已删除
     */
    public static final String DICT_SYS_DELETE_MAP = "sys_delete_type";
    public static final String DICT_SYS_DELETE_MAP_YES = "1";
    public static final String DICT_SYS_DELETE_MAP_NO = "0";
    public static final String DICT_SYS_DELETE_MAP_ALL = null;

    /**
     * 模块类型： m目录 c菜单 p页面
     */
    public static final String DICT_SYS_MODULE_TYPE = "module_type";
    public static final String DICT_SYS_MODULE_TYPE_PAGE = "p";
    public static final String DICT_SYS_MODULE_TYPE_MENU = "m";
    public static final String DICT_SYS_MODULE_TYPE_CONTENTS = "c";

    /**
     * 隐藏显示类型： 0：显示 1：隐藏 null:全部
     */
    public static final String DICT_SYS_VISIBLE_TYPE = "sys_visible_type";
    public static final String DICT_SYS_VISIBLE_TYPE_SHOW = "0";
    public static final String DICT_SYS_VISIBLE_TYPE_HIDDEN = "1";
    public static final String DICT_SYS_VISIBLE_TYPE_ALL = null;

    /**
     * 隐藏显示类型： 0：显示 1：隐藏 null:全部
     */
    public static final String DICT_BTN_NAME_TYPE = "btn_name_type";

    /**
     * 关联表类型：
     */
    public static final String DICT_SYS_SERIAL_TYPE = "sys_serial_type";

    /**
     * 地址簿_tag标签：
     */
    public static final String DICT_SYS_ADDRESS_TAG_TYPE  = "sys_address_tag_type";

    /**
     * 企业类型：
     */
    public static final String DICT_SYS_COMPANY_TYPE  = "sys_company_type";

    /**
     * 性别：
     */
    public static final String DICT_SYS_SEX_TYPE  = "sys_sex_type";

    /**
     * 在职情况：
     */
    public static final String DICT_USR_SERVICE_TYPE  = "usr_service_type";

    /**
     * 学历情况：
     */
    public static final String DICT_USR_DEGREE_TYPE  = "usr_degree_type";

    /**
     * 婚否：
     */
    public static final String DICT_USR_WED_TYPE  = "usr_wed_type";

    /**
     * 登录用户类型：
     */
    public static final String DICT_USR_LOGIN_TYPE  = "usr_login_type";

    /**
     * 组织架构类型：
     */
    public static final String DICT_ORG_SETTING_TYPE  = "org_setting_type";
    public static final String DICT_ORG_SETTING_TYPE_TENANT  = "10";
    public static final String DICT_ORG_SETTING_TYPE_TENANT_SERIAL_TYPE  = "s_tenant";
    public static final String DICT_ORG_SETTING_TYPE_GROUP  = "20";
    public static final String DICT_ORG_SETTING_TYPE_GROUP_SERIAL_TYPE  = "m_group";
    public static final String DICT_ORG_SETTING_TYPE_COMPANY  = "30";
    public static final String DICT_ORG_SETTING_TYPE_COMPANY_SERIAL_TYPE  = "m_company";
    public static final String DICT_ORG_SETTING_TYPE_DEPT  = "40";
    public static final String DICT_ORG_SETTING_TYPE_DEPT_SERIAL_TYPE  = "m_dept";
    public static final String DICT_ORG_SETTING_TYPE_POSITION  = "50";
    public static final String DICT_ORG_SETTING_TYPE_POSITION_SERIAL_TYPE  = "m_position";
    public static final String DICT_ORG_SETTING_TYPE_STAFF  = "60";
    public static final String DICT_ORG_SETTING_TYPE_STAFF_SERIAL_TYPE  = "m_staff";

    /**
     * 自动编号设置：
     */
    public static final String DICT_SYS_CODE_RULE_TYPE  = "sys_coderule_type";
    // YYYYMMDD??999
    public static final String DICT_SYS_CODE_RULE_TYPE_ONE  = "10";

    /**
     * 自动编号名称：
     */
    public static final String DICT_SYS_CODE_TYPE  = "sys_code_type";
    /** 租户编号 */
    public static final String DICT_SYS_CODE_TYPE_S_TENANT  = "s_tenant";

}
