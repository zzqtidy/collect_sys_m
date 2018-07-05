package org.zzq.csm.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * Created with IntelliJ IDEA.
 * Description:处理404、500等错误
 * User: TYLER
 * Date: 2018-06-26
 */
@Controller
public class ErrorController {
    @RequestMapping("/error/404")
    public String error_404(Model model) throws Exception{
        return "error/404";
    }
    @RequestMapping("/error/500")
    public String error_500(Model model) throws Exception{
        return "error/500";
    }
}
