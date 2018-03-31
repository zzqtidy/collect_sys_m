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
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zzq.csm.entity.login.ActiveUser;
import org.zzq.csm.exception.CustomException;
import org.zzq.csm.service.login.SysService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * 登录和退出
 *
 * @author liuxun
 */
@Controller
public class LoginController {
    @Autowired
    private SysService sysService;

    //用户登录提交方法
    /*@RequestMapping("/login")
	public String login(HttpSession session,String randomcode,String usercode,String password) throws Exception{
		// 校验验证码，防止恶性攻击
		// 从Session中获取正确的验证码
		String validateCode = (String) session.getAttribute("validateCode");

		//输入的验证码和Session中的验证码进行对比
		if (!randomcode.equalsIgnoreCase(validateCode)) {
			//抛出异常
			throw new CustomException("验证码输入错误");
		}

		//调用Service校验用户账号和密码的正确性
		ActiveUser activeUser = sysService.authenticat(usercode, password);

		//如果Service校验通过，将用户身份记录到Session
		session.setAttribute("activeUser", activeUser);
		//重定向到商品查询页面
		return "redirect:/first.action";
	} */
    //用户登录提交方法，该controller会mapping如下的浏览器请求  http://host:port/login
    @RequestMapping(value = "/login")
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

        if(username==null)
            return "login";
        Subject subject = SecurityUtils.getSubject();

        if(!subject.isAuthenticated()){
            UsernamePasswordToken token = new UsernamePasswordToken(username,password);
            try {
                subject.login(token);
                //身份
                ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
                model.addAttribute("activeUser", activeUser);
                return "first"; //返回页面 WEB-INF/jsp/first.jsp
            }
            catch (ExcessiveAttemptsException ex){
                return "login";
            }
        }
        else{
            ActiveUser activeUser = (ActiveUser) subject.getPrincipal();
            model.addAttribute("activeUser", activeUser);
            return "first";
        }


    }

    //用户退出
    @RequestMapping("/logout")
    public String logout(HttpSession session) throws Exception {
        //session失效
        session.invalidate();
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        //重定向到商品查询页面
        return "login";
    }
}
