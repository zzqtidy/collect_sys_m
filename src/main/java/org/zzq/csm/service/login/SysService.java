package org.zzq.csm.service.login;

import org.zzq.csm.entity.login.ActiveUser;
import org.zzq.csm.entity.login.SysPermission;
import org.zzq.csm.entity.login.SysUser;

import java.util.List;

/**
 * 认证授权服务接口
 */
public interface SysService {
    //根据用户的身份和密码进行认证，如果认证通过，返回用户身份信息
    public ActiveUser authenticat(String usercode, String password) throws Exception;

    //根据用户账号查询用户信息
    public SysUser findSysUserByUserCode(String userCode) throws Exception;

    //根据用户id查询权限范围内的菜单
    public List<SysPermission> findMenuListByUserId(String userid) throws Exception;

    //根据用户id查询权限范围内的url
    public List<SysPermission> findPermissionListByUserId(String userid) throws Exception;
}