package org.zzq.csm.controller.cms;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zzq.csm.entity.cms.CmsArticle;
import org.zzq.csm.service.cms.CmsArticleService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-07-04
 */
@Controller
public class CmsArticleController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private CmsArticleService cmsArticleService;

    @RequestMapping(value = "cms_article/list")
    public String selectAll(Model model){
        return "cms_article/list";
    }

    @RequestMapping(value = "cms_article/add")
    public String add(Model model){
        return "cms_article/add";
    }
    
    @RequestMapping(value = "cms_article/save/json", method = RequestMethod.POST, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public String save(String param){
        JSONObject jsonObject = JSONObject.fromObject(param);
        //生成类
        CmsArticle cmsArticle = (CmsArticle)JSONObject.toBean(jsonObject,CmsArticle.class);
        try {
            cmsArticleService.insertCmsArticle(cmsArticle);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return "OK";
    }

    @RequestMapping(value = "cms_article/{id}/json", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public CmsArticle selectByid(@PathVariable(value = "id") int id) throws Exception{
        //注意@PathVariable(value = "id")是取出url地址中的{id},当然也可以不用写，不过按照规范，最好写上
        return cmsArticleService.selectByid(id);
    }

    @RequestMapping(value = "cms_article/listjson", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<CmsArticle> selectAll() throws Exception{
        //注意@PathVariable(value = "id")是取出url地址中的{id},当然也可以不用写，不过按照规范，最好写上
        return cmsArticleService.selectAll();
    }

    @RequestMapping(value = "cms_article/delete", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<CmsArticle> deleteSelectRows(String paramList) throws Exception{
        JSONArray jsonArray=JSONArray.fromObject(paramList);
        //生成类
        List<CmsArticle> cmsArticleList = (List<CmsArticle>)JSONArray.toCollection(jsonArray,CmsArticle.class);
        for (CmsArticle cmsArticle:cmsArticleList) {
            try {
                cmsArticleService.deleteCmsArticle(cmsArticle.getId());
            }
            catch (Exception ex){
                logger.error(ex.getMessage());
            }
        }
        return selectAll();
    }

}
