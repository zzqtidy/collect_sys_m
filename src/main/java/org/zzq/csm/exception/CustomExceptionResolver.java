package org.zzq.csm.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: zzq
 * Date: 2017-12-01
 * Time: 17:38
 */
public class CustomExceptionResolver implements HandlerExceptionResolver {

    //前端控制器DispatcherServlet在进行HandlerMapping、调用HandlerAdapter执行Handler过程中，如果遇到异常就会执行此方法
    @Override
    public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
                                         Exception ex) {
        //输出异常
        ex.printStackTrace();

        //统一处理异常代码
        //针对系统自定义的CustomException异常，就可以直接从异常类中获取异常信息，将异常处理在错误页面进行展示
        //异常信息
        String message = null;
        CustomException customException = null;
        //如果ex是自定义异常信息，直接取出异常信息
        if (ex instanceof CustomException) {
            customException = (CustomException) ex;
        } else {
            //针对非CustomException异常，对这类重新构成一个CustomException，异常信息为"未知错误"
            customException = new CustomException("未知错误");
        }

        //错误信息
        message = customException.getMessage();
        request.setAttribute("message", message);

        try {
            //转向到错误页面
            request.getRequestDispatcher("/WEB-INF/jsp/error.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

        return new ModelAndView();
    }

}
