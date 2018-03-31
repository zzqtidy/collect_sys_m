package org.zzq.csm.controller.example;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpServletRequest;

/**
 * Class name: Example
 * Description: mvc处理前台传来的三种请求url和参数的方式示例
 * Author :zzq
 * Date: 18/1/23
 * Time: 下午5:41
 **/
@Controller
@RequestMapping(value = "/example")
public class Example {
    @RequestMapping(value = "/view01",method = RequestMethod.GET)
    //处理请求http://host:port/example/view01?param01=xxxx的请求
    public String view01(@RequestParam("param01") String param01, Model model){
        System.out.println("param01="+param01);
        //添加entity实例（调用serveice）到model中
        //model.addAttribute(o);

        //返回 WEB-INF/jsp/example/view01.jsp
        return "example/01";
    }

    @RequestMapping(value = "/view02/{param02}",method = RequestMethod.GET)
    //处理Restful风格请求http://host:port/example/view02/xxxx的请求
    public String view02(@PathVariable("param02") String param02, Model model){
        System.out.println("param02="+param02);
        //添加entity实例（调用serveice）到model中
        //model.addAttribute(o);

        //返回 WEB-INF/jsp/example/view02.jsp
        return "example/02";
    }
    @RequestMapping(value = "/view03",method = RequestMethod.GET)
    //传统处理HttpServletRequest，处理请求http://host:port/example/view03?param03=xxxx的请求
    public String view03(HttpServletRequest request, Model model){
        String param03 = request.getParameter("param03");
        System.out.println("param03="+param03);
        //添加entity实例（调用serveice）到model中
        //model.addAttribute(o);

        //返回 WEB-INF/jsp/example/view03.jsp
        return "example/03";
    }

}
