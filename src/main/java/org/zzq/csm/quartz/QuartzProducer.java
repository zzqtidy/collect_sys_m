package org.zzq.csm.quartz;

import org.quartz.SchedulerException;

import java.text.ParseException;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-08-21
 */
public interface QuartzProducer {

    /**
     * 添加简单任务,只运行一次的任务
     *
     * @param jobName
     * @param jobGroup
     * @param className
     * @param methodName
     * @param paramArray
     * @param runDateTime 格式：yyyyMMddHHmmss
     * @throws SchedulerException
     * @throws ParseException
     */
    public void addSimpleJob(String jobName, String jobGroup,String triggerName, String triggerGroup, String className, String methodName, ArrayList paramArray, String runDateTime)  throws SchedulerException, ParseException;


    /**
     * 添加循环任务,特定时间循环运行,例如每个星期3,12点运行等
     *
     * @param jobName
     * @param jobGroup
     * @param className
     * @param methodName
     * @param paramArray
     * @param cron
     * @throws SchedulerException
     */
    public void addCronJob(String jobName, String jobGroup,String triggerName, String triggerGroup, String className, String methodName, ArrayList paramArray, String cron) throws SchedulerException;

    /**
     * 修改简单任务,一般指修改运行时间
     *
     * @param jobName
     * @param jobGroup
     * @param runDateTime 格式：yyyyMMddHHmmss
     */
    public void updateSimpleJob(String jobName, String jobGroup,String triggerName, String triggerGroup, String runDateTime) throws SchedulerException, ParseException;

    /**
     * 修改cron任务,一般指修改循环运行时间
     *
     * @param jobName
     * @param jobGroup
     * @param cron
     */
    public void updateCronJob(String jobName, String jobGroup, String triggerName, String triggerGroup,String cron) throws SchedulerException;

    /**
     * 移除任务
     *
     * @param jobName
     * @param jobGroup
     */
    public void deleteJob(String jobName, String jobGroup) throws SchedulerException;

    /**
     * 移除所有任务
     */
    public void deleteAll() throws SchedulerException;

    /**
     * 暂停任务
     *
     * @param jobName
     * @param jobGroup
     */
    public void pauseJob(String jobName, String jobGroup) throws SchedulerException;

    /**
     * 暂停所有任务
     */
    public void pauseAll() throws SchedulerException;

    /**
     * 恢复某个任务
     *
     * @param jobName
     * @param jobGroup
     */
    public void resumeJob(String jobName, String jobGroup) throws SchedulerException;

    /**
     * 恢复所有
     */
    public void resumeAll() throws SchedulerException;

    /**
     * 关闭任务调度器
     */
    public void shutDown() throws SchedulerException;

    /**
     * 开启任务调度器
     */
    public void startScheduler() throws SchedulerException;
}
