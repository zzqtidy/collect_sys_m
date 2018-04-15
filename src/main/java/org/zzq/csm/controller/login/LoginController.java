package org.zzq.csm.controller.login;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: zzq
 * Date: 2017-12-04
 * Time: 10:29
 */

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zzq.csm.entity.dto.JsonResult;
import org.zzq.csm.entity.login.ActiveUser;
import org.zzq.csm.service.login.SysService;

import javax.servlet.http.HttpServletRequest;


/**
 * 登录和退出
 *
 * @author liuxun
 */
@Controller
public class LoginController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private SysService sysService;

    //用户登录提交方法，该controller会mapping如下的浏览器请求  http://host:port/login
    @RequestMapping(value = "/admin/login")//, method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
//    @ResponseBody
    public String login(HttpServletRequest request, Model model) throws Exception {

        //shiro在认证通过后出现错误后将异常类路径通过request返回
        //如果登陆失败从request中获取认证异常信息，shiroLoginFailure就是shiro异常类的全限定
        JsonResult<ActiveUser> jsonResult = new JsonResult<ActiveUser>();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Subject subject = SecurityUtils.getSubject();

        if (!subject.isAuthenticated()) {
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            try {
                subject.login(token);
            } catch (Exception ex) {
                jsonResult.failure("/admin/login");
                return "/admin/login";
                //return jsonResult;
            }
        }
        jsonResult.success("/admin/first");
        //return jsonResult;
        return "/admin/first";
    }

    // ajax json
    @RequestMapping(value = "/admin/ajaxlogin", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public JsonResult<ActiveUser> login(HttpServletRequest request) throws Exception {
        //shiro在认证通过后出现错误后将异常类路径通过request返回
        //如果登陆失败从request中获取认证异常信息，shiroLoginFailure就是shiro异常类的全限定
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Subject subject = SecurityUtils.getSubject();
        JsonResult<ActiveUser> jsonResult = new JsonResult<ActiveUser>();
        if (!subject.isAuthenticated()) {
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            try {
                subject.login(token);
            } catch (Exception ex) {
                logger.error(ex.getMessage());
                jsonResult.failure("错误：" + ex.getMessage());
                return jsonResult;
            }
        }
        ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
        jsonResult.success(activeUser);
        return jsonResult;
    }
}
