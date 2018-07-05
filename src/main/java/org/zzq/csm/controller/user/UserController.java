package org.zzq.csm.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zzq.csm.entity.login.SysUser;
import org.zzq.csm.service.login.SysService;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description: 管理用户数据
 * User: TYLER
 */
@Controller
public class UserController {
    @Autowired
    private SysService sysService;
    @RequestMapping("user/list")
    public String list(Model model)
    {
        return "user/list";
    }

    /**
     * 获取所有的
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "user/listJson", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<SysUser> listJson() throws Exception {
        return sysService.selectAllSysUser();
    }
}
