package org.zzq.csm.quartz;

import org.apache.commons.lang.time.DateUtils;
import org.quartz.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-08-21
 */
//定义该bean的name为"quartzProducer"
@Service("quartzProducer")
public class QuartzProducerImpl implements QuartzProducer {
    //为了方便管理，jobName和triggerName相同，jobGroup和triggerGroup相同。所以文中本应该出现tiggerName和triggerGroup的地方都用jobName,jobGroup替代的

    //虽然在Spring配置中配置的是SchedulerFactoryBean这个类，但是我们自动转配就写这样，一样是可以使用的
    @Autowired
    private Scheduler scheduler;

    @Override
    public void addSimpleJob(String jobName, String jobGroup, String triggerName, String triggerGroup, String className, String methodName, ArrayList paramArray, String runDateTime) throws SchedulerException, ParseException {
        //判断是否已存在相同jobName,jobGroup,若存在则删除
        if (scheduler.getJobDetail(JobKey.jobKey(jobName, jobGroup)) != null) {
            deleteJob(jobName, jobGroup);
        }
        JobDetail jobDetail = JobBuilder.newJob(QuartzJobFactory.class).withIdentity(jobName, jobGroup).build();
        //任务具体执行的内容封装,返回给job统一入口
        ScheduleJob job = new ScheduleJob(jobName, jobGroup, triggerName, triggerGroup, className, methodName, paramArray, null, runDateTime, "简单调度");
        //将我自定义的POJO类存放到DataMap中
        jobDetail.getJobDataMap().put("scheduleJob", job);
        //创建SimpleTrigger,在特定时间仅运行一次
        Date runDate = DateUtils.parseDate(runDateTime, new String[]{"yyyy-MM-dd HH:mm:ss"});
        SimpleTrigger trigger = (SimpleTrigger) TriggerBuilder.newTrigger().withIdentity(triggerName, triggerGroup).startAt(runDate).build();
        scheduler.scheduleJob(jobDetail, trigger);
    }

    @Override
    public void addCronJob(String jobName, String jobGroup, String triggerName, String triggerGroup, String className, String methodName, ArrayList paramArray, String cron) throws SchedulerException {
        //判断是否已存在相同jobName,jobGroup,若存在则删除
        if (scheduler.getJobDetail(JobKey.jobKey(jobName, jobGroup)) != null) {
            deleteJob(jobName, jobGroup);
        }
        JobDetail jobDetail = JobBuilder.newJob(QuartzJobFactory.class).withIdentity(jobName, jobGroup).build();
        ScheduleJob job = new ScheduleJob(jobName, jobGroup, triggerName, triggerGroup, className, methodName, paramArray, null, null, "cron调度");
        jobDetail.getJobDataMap().put("scheduleJob", job);
        CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.cronSchedule(cron);
        CronTrigger cronTrigger = TriggerBuilder.newTrigger().withIdentity(triggerName, triggerGroup).withSchedule(cronScheduleBuilder).build();
        scheduler.scheduleJob(jobDetail, cronTrigger);
    }

    @Override
    public void updateSimpleJob(String jobName, String jobGroup, String triggerName, String triggerGroup, String runDateTime) throws SchedulerException, ParseException {

    }

    @Override
    public void updateCronJob(String jobName, String jobGroup, String triggerName, String triggerGroup, String className, String methodName, ArrayList paramArray, String cron) throws SchedulerException {
        try {
            CronTrigger trigger = (CronTrigger) scheduler.getTrigger(new TriggerKey(triggerName, triggerGroup));
            if (trigger == null) {
                return;
            }
            String oldTime = trigger.getCronExpression();
            if (!oldTime.equalsIgnoreCase(cron)) {
                JobDetail jobDetail = scheduler.getJobDetail(new JobKey(jobName, jobGroup));
                Class objJobClass = jobDetail.getJobClass();
                deleteJob(jobName, jobGroup);
                addCronJob(jobName, jobGroup, triggerName, triggerGroup, className, methodName, paramArray, cron);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteJob(String jobName, String jobGroup) throws SchedulerException {

    }

    @Override
    public void deleteAll() throws SchedulerException {

    }

    @Override
    public void pauseJob(String jobName, String jobGroup) throws SchedulerException {

    }

    @Override
    public void pauseAll() throws SchedulerException {

    }

    @Override
    public void resumeJob(String jobName, String jobGroup) throws SchedulerException {

    }

    @Override
    public void resumeAll() throws SchedulerException {

    }

    @Override
    public void shutDown() throws SchedulerException {

    }

    @Override
    public void startScheduler() throws SchedulerException {

    }
}