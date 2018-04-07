package org.zzq.csm.controller.login;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: zzq
 * Date: 2017-12-04
 * Time: 10:29
 */

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zzq.csm.service.login.SysService;

import javax.servlet.http.HttpServletRequest;


/**
 * 登录和退出
 *
 * @author liuxun
 */
@Controller
public class LoginController {
    @Autowired
    private SysService sysService;

    //用户登录提交方法，该controller会mapping如下的浏览器请求  http://host:port/login
    @RequestMapping(value = "admin/login")
    public String login(HttpServletRequest request, Model model) throws Exception {

        //shiro在认证通过后出现错误后将异常类路径通过request返回
        //如果登陆失败从request中获取认证异常信息，shiroLoginFailure就是shiro异常类的全限定
        String username = request.getParameter("username");
        String password = request.getParameter("password");

//        String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
//        if (exceptionClassName != null) {
//            if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
//                throw new CustomException("账号不存在");
//            } else if (IncorrectCredentialsException.class.getName().equals(exceptionClassName)) {
//                throw new CustomException("用户名/密码错误");
//            } else if ("randomCodeError".equals(exceptionClassName)) {
//                throw new CustomException("验证码错误");
//            } else {
//                throw new Exception(); //最终在设置的异常处理器中生成未知错误
//            }
//        }

//        if(username==null)
//            return "/login";
        Subject subject = SecurityUtils.getSubject();

        if(!subject.isAuthenticated()){
            UsernamePasswordToken token = new UsernamePasswordToken(username,password);
            try {
                subject.login(token);
                //身份
                return "redirect:/admin/first";
//              return "/first"; //返回页面 WEB-INF/jsp/first.jsp
            }
            catch (ExcessiveAttemptsException ex){
                return "/admin/login";
            }
            catch (Exception ex){
                return "/admin/login";
            }
        }
        else{
//            ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
//            model.addAttribute("activeUser", activeUser);
//            return "/first";
            return "redirect:/admin/first";
        }

    }
}
