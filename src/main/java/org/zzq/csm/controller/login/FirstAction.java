package org.zzq.csm.controller.login;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zzq.csm.entity.login.ActiveUser;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: zzq
 * Date: 2017-12-04
 * Time: 18:18
 */
@Controller
public class FirstAction {
    //系统首页
    @RequestMapping("/admin/first")
    public String first(Model model)throws Exception{

        //主体
        Subject subject = SecurityUtils.getSubject();
        //身份
        ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
        model.addAttribute("activeUser", activeUser);
        return "/admin/first";
    }

    //欢迎页面
    @RequestMapping("/admin/welcome")
    public String welcome(Model model)throws Exception{

        return "/admin/welcome";

    }
}
