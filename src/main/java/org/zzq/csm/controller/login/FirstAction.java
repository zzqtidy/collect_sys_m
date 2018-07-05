package org.zzq.csm.controller.login;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zzq.csm.entity.dto.JsonResult;
import org.zzq.csm.entity.login.ActiveUser;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: zzq
 * Date: 2017-12-04
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
        return "admin/first";
    }
    //系统首页index
    @RequestMapping("/admin/index")
    public String index(Model model)throws Exception{

        //主体
        Subject subject = SecurityUtils.getSubject();
        //身份
        ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
        model.addAttribute("activeUser", activeUser);
        return "admin/index";
    }

    @RequestMapping(value = "/admin/ajaxfirst", method = RequestMethod.GET, produces = {"application/json; charset=utf-8" })
    @ResponseBody
    public JsonResult<ActiveUser> first()throws Exception{
        JsonResult<ActiveUser> jsonResult = new JsonResult<ActiveUser>();
        //主体
        Subject subject = SecurityUtils.getSubject();
        //身份
        ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
        jsonResult.success(activeUser);
        return jsonResult;
    }

    //欢迎页面
    @RequestMapping("/admin/welcome")
    public String welcome(Model model)throws Exception{
        return "/admin/welcome";
    }
}
