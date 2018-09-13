package org.zzq.csm.service.cms.quartz;


import org.quartz.SchedulerException;
import org.springframework.stereotype.Service;
import org.zzq.csm.entity.cms.quartz.ScheduleJob;

import java.util.List;
import java.util.Map;
/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-09-05
 */

/**
 * 计划任务管理
 */
public interface JobTaskService {
    List<ScheduleJob> getAllTask();
    List<Map<String,Object>> selectAllHashMap();
    ScheduleJob getTaskById(int jobId);
    void addTask(ScheduleJob job);
    void updateTask(ScheduleJob job);
    void deleteTask(int jobId);
    void changeStatus(int jobId, String cmd) throws SchedulerException;
    void changeJob(ScheduleJob job) throws SchedulerException;
    void updateCron(int jobId, String cron) throws SchedulerException;
    void addJob(ScheduleJob job) throws SchedulerException;
    void init() throws Exception;
    List<ScheduleJob> getAllJob() throws SchedulerException;
    List<ScheduleJob> getRunningJob() throws SchedulerException;
    void pauseJob(ScheduleJob scheduleJob) throws SchedulerException;
    void resumeJob(ScheduleJob scheduleJob) throws SchedulerException;
    void deleteJob(int jobId) throws SchedulerException;
    void runAJobNow(ScheduleJob scheduleJob) throws SchedulerException;
    void updateJobCron(ScheduleJob scheduleJob) throws SchedulerException;
}
