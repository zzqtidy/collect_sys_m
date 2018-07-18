package org.zzq.csm.controller.cms.code;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zzq.csm.entity.cms.code.CmsCodes;
import org.zzq.csm.entity.login.ActiveUser;
import org.zzq.csm.service.cms.code.CmsCodesService;
import org.zzq.csm.util.CurrentUserManager;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-07-04
 */
@Controller
public class CmsCodesController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CmsCodesService cmsCodesService;

    @RequestMapping(value = "cms_codes/list")
    public String selectAll(Model model) {
        return "cms/code/list";
    }

    @RequestMapping(value = "cms_codes/add")
    public String add(Model model) {
        return "cms/code/add";
    }

    @RequestMapping(value = "cms_codes/save/json", method = RequestMethod.POST, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public String save(String param) {
        JSONObject jsonObject = JSONObject.fromObject(param);
        //生成类
        CmsCodes cmsCodes = (CmsCodes) JSONObject.toBean(jsonObject, CmsCodes.class);
        if(cmsCodes.getId()==0){
            //新增
            cmsCodes.setAddwho(CurrentUserManager.getUserId());
            cmsCodes.setAddtime(new Date());
            try {
                cmsCodesService.insertCmsCodes(cmsCodes);
            } catch (Exception e) {
                logger.error("新增："+e.getMessage());
            }
        }
        else{
            //修改
            try {
                cmsCodesService.updateCmsCodes(cmsCodes);
            } catch (Exception e) {
                logger.error("修改："+e.getMessage());
            }
        }


        return "OK";
    }

    @RequestMapping(value = "cms_codes/{id}/json", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public CmsCodes selectByid(@PathVariable(value = "id") int id) throws Exception {
        //注意@PathVariable(value = "id")是取出url地址中的{id},当然也可以不用写，不过按照规范，最好写上
        return cmsCodesService.selectByid(id);
    }

    @RequestMapping(value = "cms_codes/listjson", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<CmsCodes> selectAll() throws Exception {
        //注意@PathVariable(value = "id")是取出url地址中的{id},当然也可以不用写，不过按照规范，最好写上
        return cmsCodesService.selectAll();
    }

    @RequestMapping(value = "cms_codes/delete", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<CmsCodes> deleteSelectRows(String paramList) throws Exception {
        JSONArray jsonArray = JSONArray.fromObject(paramList);
        //生成类
        List<CmsCodes> cmsArticleList = (List<CmsCodes>) JSONArray.toCollection(jsonArray, CmsCodes.class);
        for (CmsCodes cmsCodes : cmsArticleList) {
            try {
                cmsCodesService.deleteCmsCodes(cmsCodes.getId());
            } catch (Exception ex) {
                logger.error(ex.getMessage());
            }
        }
        return selectAll();
    }

}
