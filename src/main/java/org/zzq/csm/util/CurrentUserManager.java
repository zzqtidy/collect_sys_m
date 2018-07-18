package org.zzq.csm.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.zzq.csm.entity.login.ActiveUser;

public class CurrentUserManager {
    public static ActiveUser getUser(){
        Subject currentUser = SecurityUtils.getSubject();
        ActiveUser activeUser = (ActiveUser)currentUser.getPrincipals().getPrimaryPrincipal();
        return activeUser;
    }

    public static String getUserId(){
        return getUser().getUserid();
    }

    public static String getUserName(){
        return getUser().getUsername();
    }
}
