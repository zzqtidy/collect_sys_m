package org.zzq.csm.controller.cms.quartz;

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
import org.zzq.csm.entity.cms.quartz.ScheduleJob;
import org.zzq.csm.entity.dto.JsonResult;
import org.zzq.csm.service.cms.quartz.JobTaskService;
import org.zzq.csm.util.CurrentUserManager;

import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-09-07
 */
@Controller
public class QuartzController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private JobTaskService jobTaskService;

    @RequestMapping(value = "cms_quartz/list")
    public String showList(Model model){
        return "cms/quartz/list";
    }

    @RequestMapping(value = "cms_quartz/add")
    public String showAdd(Model model){
        return "cms/quartz/add";
    }

    @RequestMapping(value = "cms_quartz/listjson", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<Map<String,Object>> selectAllHashMap() throws Exception{
        return jobTaskService.selectAllHashMap();
    }

    @RequestMapping(value = "cms_quartz/save/json", method = RequestMethod.POST, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public JsonResult<ScheduleJob> save(String param){
        /*
         * 注意，如果要返回的是json类型，返回的不是标准的json字符串的化，前台ajax是不会走到success方法的【我之前写的是返回String】
         * */
        JsonResult<ScheduleJob> jsonResult = new JsonResult<ScheduleJob>();
        JSONObject jsonObject = JSONObject.fromObject(param);
        //生成类
        ScheduleJob scheduleJob = (ScheduleJob)JSONObject.toBean(jsonObject,ScheduleJob.class);
        if(scheduleJob.getId()==null||scheduleJob.getId()==0){
            //新增
            scheduleJob.setAddwho(CurrentUserManager.getUserId());
            try {
                jobTaskService.addJob(scheduleJob);
                jobTaskService.addTask(scheduleJob);
            } catch (Exception e) {
                logger.error("新增："+e.getMessage());
                jsonResult.failure(scheduleJob);
            }
            jsonResult.success(scheduleJob);
        }
        else{
            //修改
            try {
                jobTaskService.changeJob(scheduleJob);
                jobTaskService.updateTask(scheduleJob);
            } catch (Exception e) {
                logger.error("修改："+e.getMessage());
                jsonResult.failure(scheduleJob);
            }
            jsonResult.success(scheduleJob);
        }
        return jsonResult;
    }

    @RequestMapping(value = "cms_quartz/{id}/json", method = RequestMethod.GET, produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public ScheduleJob selectByid(@PathVariable(value = "id") int id) throws Exception {
        //注意@PathVariable(value = "id")是取出url地址中的{id},当然也可以不用写，不过按照规范，最好写上
        return jobTaskService.getTaskById(id);
    }

    //传输CmsCodes对应id的数据到json，传输数据量比较小
    @RequestMapping(value = "cms_quartz/delete_by_ids",method = RequestMethod.POST,produces = {"application/json;charset=utf-8"})
    @ResponseBody
    public List<Map<String,Object>> deleteSelectRowsByIds(String paramList) throws Exception {
        JSONArray jsonArray = JSONArray.fromObject(paramList);
        //生成类
        List<Integer> idList = (List<Integer>) JSONArray.toCollection(jsonArray, Integer.class);
        for (Integer id : idList) {
            try {
                jobTaskService.deleteJob(id);
                jobTaskService.deleteTask(id);
            } catch (Exception ex) {
                logger.error(ex.getMessage());
            }
        }
        return selectAllHashMap();
    }
}
