package org.zzq.csm.controller.cms.article;


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
import org.zzq.csm.entity.cms.article.CmsArticle;
import org.zzq.csm.entity.dto.JsonResult;
import org.zzq.csm.service.cms.article.CmsArticleService;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
        return "cms/article/list";
    }

    @RequestMapping(value = "cms_article/add")
    public String add(Model model){
        return "cms/article/add";
    }
    
    @RequestMapping(value = "cms_article/save/json", method = RequestMethod.POST, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public JsonResult<CmsArticle> save(String param){
        /*
        * 注意，如果要返回的是json类型，返回的不是标准的json字符串的化，前台ajax是不会走到success方法的【我之前写的是返回String】
        * */
        JsonResult<CmsArticle> jsonResult = new JsonResult<CmsArticle>();
        JSONObject jsonObject = JSONObject.fromObject(param);
        //生成类
        CmsArticle cmsArticle = (CmsArticle)JSONObject.toBean(jsonObject,CmsArticle.class);
        if(cmsArticle.getId()==0){
            //新增
            cmsArticle.setCreatetime(new Date());
            try {
                cmsArticleService.insertCmsArticle(cmsArticle);
            } catch (Exception e) {
                logger.error("新增："+e.getMessage());
                jsonResult.failure(cmsArticle);
            }
            jsonResult.success(cmsArticle);
        }
        else{
            //修改
            try {
                cmsArticleService.updateCmsArticle(cmsArticle);
            } catch (Exception e) {
                logger.error("修改："+e.getMessage());
                jsonResult.failure(cmsArticle);
            }
            jsonResult.success(cmsArticle);
        }
        return jsonResult;
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

    @RequestMapping(value = "cms_article_hashmap/listjson", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<Map<String,Object>> selectAllHashMap() throws Exception{
        //注意@PathVariable(value = "id")是取出url地址中的{id},当然也可以不用写，不过按照规范，最好写上
        return cmsArticleService.selectAllHashMap();
    }

    @RequestMapping(value = "cms_article/delete", method = RequestMethod.POST, produces = {"application/json; charset=utf-8"})
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
    //传输CmsCodes对应id的数据到json，传输数据量比较小
    @RequestMapping(value = "cms_article/delete_by_ids", method = RequestMethod.POST, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<CmsArticle> deleteSelectRowsByIds(String paramList) throws Exception {
        JSONArray jsonArray = JSONArray.fromObject(paramList);
        //生成类
        List<Integer> idList = (List<Integer>) JSONArray.toCollection(jsonArray, Integer.class);
        for (Integer id : idList) {
            try {
                cmsArticleService.deleteCmsArticle(id);
            } catch (Exception ex) {
                logger.error(ex.getMessage());
            }
        }
        return selectAll();
    }

}
