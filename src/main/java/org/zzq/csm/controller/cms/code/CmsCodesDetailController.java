package org.zzq.csm.controller.cms.code;

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
import org.zzq.csm.entity.cms.code.CmsCodes;
import org.zzq.csm.entity.cms.code.CmsCodesDetail;
import org.zzq.csm.entity.dto.JsonResult;
import org.zzq.csm.service.cms.code.CmsCodesDetailService;
import org.zzq.csm.util.CurrentUserManager;

import java.util.*;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-08-03
 * Time: 20:25
 */
@Controller
public class CmsCodesDetailController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CmsCodesDetailService cmsCodesDetailService;

    @RequestMapping(value = "cms_codesdetail_by_typename/list")
    public String selectByTypename(Model model) {
        return "cms/code/detail_list";
    }
    @RequestMapping(value = "cms_codesdetail/add")
    public String add(Model model) {
        return "cms/code/detail_add";
    }

    @RequestMapping(value = "cms_codesdetail/{typename}/listjson",method = RequestMethod.GET,produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<Map<String,Object>> selectByTypename(@PathVariable(value = "typename") String typename) throws Exception {
        List<Map<String,Object>> cmsCodesDetails = cmsCodesDetailService.selectByTypenameMap(typename);
        return cmsCodesDetails;
    }
    @RequestMapping(value = "cms_codesdetail/{id}/json", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public CmsCodesDetail selectByid(@PathVariable(value = "id") int id) throws Exception {
        //注意@PathVariable(value = "id")是取出url地址中的{id},当然也可以不用写，不过按照规范，最好写上
        return cmsCodesDetailService.selectByid(id);
    }

    @RequestMapping(value = "cms_codesdetail/save/json", method = RequestMethod.POST, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public JsonResult<CmsCodesDetail> save(String param) {
        JsonResult<CmsCodesDetail> jsonResult = new JsonResult<CmsCodesDetail>();
        JSONObject jsonObject = JSONObject.fromObject(param);
        //生成类
        CmsCodesDetail cmsCodesDetail = (CmsCodesDetail) JSONObject.toBean(jsonObject, CmsCodesDetail.class);
        if(cmsCodesDetail.getId()==0){
            //新增
            cmsCodesDetail.setAddwho(CurrentUserManager.getUserId());
            cmsCodesDetail.setAddtime(new Date());
            try {
                cmsCodesDetailService.insertCmsCodesDetail(cmsCodesDetail);
                jsonResult.success(cmsCodesDetail);
            } catch (Exception e) {
                logger.error("新增："+e.getMessage());
                jsonResult.failure(cmsCodesDetail);
            }
        }
        else{
            //修改
            try {
                cmsCodesDetailService.updateCmsCodesDetail(cmsCodesDetail);
                jsonResult.success(cmsCodesDetail);
            } catch (Exception e) {
                logger.error("修改："+e.getMessage());
                jsonResult.failure(cmsCodesDetail);
            }
        }
        return jsonResult;
    }

    //传输CmsCodes对应的数据在json，传输数据量比较大
    @RequestMapping(value = "cms_codesdetail/delete", method = RequestMethod.POST, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<Map<String,Object>> deleteSelectRows(String paramList) throws Exception {
        JSONArray jsonArray = JSONArray.fromObject(paramList);
        //生成类
        List<CmsCodesDetail> cmsCodesDetails = (List<CmsCodesDetail>) JSONArray.toCollection(jsonArray, CmsCodesDetail.class);
        if(cmsCodesDetails.size()==0){
            return new ArrayList<>();
        }
        String typename = cmsCodesDetails.get(0).getTypename();
        for (CmsCodesDetail cmsCodesDetail : cmsCodesDetails) {
            try {
                cmsCodesDetailService.deleteCmsCodesDetail(cmsCodesDetail.getId());
            } catch (Exception ex) {
                logger.error(ex.getMessage());
            }
        }
        return selectByTypename(typename);
    }
}
