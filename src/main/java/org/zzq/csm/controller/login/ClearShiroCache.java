package org.zzq.csm.controller.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zzq.csm.shiro.CustomRealm;

/**
 * Created with IntelliJ IDEA.
 * Description:测试：手动调用controller清除shiro中的缓存
 * User: zzq
 * Date: 2017-12-04
 * Time: 18:21
 */
@Controller
public class ClearShiroCache {

    //注入realm
    @Autowired
    private CustomRealm customRealm;

    @RequestMapping("/clearShiroCache")
    public String clearShiroCache(){
        //清除缓存，如果按照标准写法是在Service中调用customRealm.clearCached();
        customRealm.clearCached();
        return "success";
    }
}
