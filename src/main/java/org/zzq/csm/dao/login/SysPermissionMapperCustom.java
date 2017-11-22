package org.zzq.csm.dao.login;

import org.zzq.csm.entity.login.SysPermission;

import java.util.List;
/**
 * 权限mapper
 */
public interface SysPermissionMapperCustom {
    //根据用户id查询菜单
    public List<SysPermission> findMenuListByUserId(String userid) throws Exception;
    //根据用户id查询权限URL
    public List<SysPermission> findPermissionListByUserId(String userid) throws Exception;
}
