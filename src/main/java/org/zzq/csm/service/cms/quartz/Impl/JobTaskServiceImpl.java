package org.zzq.csm.service.cms.quartz.Impl;


import org.quartz.*;
import org.quartz.impl.matchers.GroupMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zzq.csm.dao.cms.quartz.ScheduleJobMapper;
import org.zzq.csm.entity.cms.quartz.ScheduleJob;
import org.zzq.csm.service.cms.quartz.JobTaskService;
import org.zzq.csm.util.quartz.QuartzJobFactory;
import org.zzq.csm.util.quartz.QuartzJobFactoryDisallowConcurrentExecution;
import org.zzq.csm.util.quartz.TaskUtils;

import javax.annotation.PostConstruct;
import java.util.*;
/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-09-05
 * TODO:后期验证Cron表达式，要执行的类和方法等是否存在并满足执行条件
 */

/**
 * 计划任务管理
 */

@Service
public class JobTaskServiceImpl implements JobTaskService {
    public final Logger log = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private Scheduler scheduler;

    @Autowired
    private ScheduleJobMapper scheduleJobMapper;

    /**
     * 从数据库中取 区别于getAllJob
     *
     * @return
     */
    @Override
    public List<ScheduleJob> getAllTask() {
        return scheduleJobMapper.selectAll();
    }

    public List<Map<String, Object>> selectAllHashMap() {
        return scheduleJobMapper.selectAllHashMap();
    }

    /**
     * 添加到数据库中 区别于addJob
     */
    @Override
    public void addTask(ScheduleJob job) {
        scheduleJobMapper.insertScheduleJob(job);
    }

    @Override
    public void updateTask(ScheduleJob job) {
        scheduleJobMapper.updateScheduleJob(job);
    }

    /**
     * 从数据库中查询job
     */
    @Override
    public ScheduleJob getTaskById(int jobId) {
        return scheduleJobMapper.selectById(jobId);
    }

    public void deleteTask(int jobId) {
        scheduleJobMapper.deleteScheduleJobById(jobId);
    }

    @Override
    public void changeJob(ScheduleJob job) throws SchedulerException {
        if (job == null) {
            return;
        }
        if (job.getJobStatus().equals(TaskUtils.STATUS_NOT_RUNNING)) {
            deleteJob(job.getId());
        } else if (job.getJobStatus().equals(TaskUtils.STATUS_RUNNING)) {
            addJob(job);
        }
    }

    /**
     * 更改任务状态
     *
     * @throws SchedulerException
     */
    @Override
    public void changeStatus(int jobId, String cmd) throws SchedulerException {
        ScheduleJob job = getTaskById(jobId);
        if (job == null) {
            return;
        }
        if ("stop".equals(cmd)) {
            deleteJob(job.getId());
            job.setJobStatus(TaskUtils.STATUS_NOT_RUNNING);
        } else if ("start".equals(cmd)) {
            job.setJobStatus(TaskUtils.STATUS_RUNNING);
            addJob(job);
        }
        scheduleJobMapper.updateScheduleJob(job);
    }

    /**
     * 更改任务 cron表达式
     *
     * @throws SchedulerException
     */
    @Override
    public void updateCron(int jobId, String cron) throws SchedulerException {
        ScheduleJob job = getTaskById(jobId);
        if (job == null) {
            return;
        }
        job.setCronExpression(cron);
        if (TaskUtils.STATUS_RUNNING.equals(job.getJobStatus())) {
            updateJobCron(job);
        }
        scheduleJobMapper.updateScheduleJob(job);

    }

    /**
     * 添加任务
     * <p>
     * //@param scheduleJob
     *
     * @throws SchedulerException
     */
    @Override
    public void addJob(ScheduleJob job) throws SchedulerException {
        if (job == null || !TaskUtils.STATUS_RUNNING.equals(job.getJobStatus())) {
            return;
        }
        log.debug(scheduler + ".......................................................................................add");
        TriggerKey triggerKey = TriggerKey.triggerKey(job.getJobName(), job.getJobGroup());

        CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);

        // 不存在，创建一个
        if (null == trigger) {
            Class clazz = TaskUtils.CONCURRENT_IS.equals(job.getIsConcurrent()) ? QuartzJobFactory.class : QuartzJobFactoryDisallowConcurrentExecution.class;

            JobDetail jobDetail = JobBuilder.newJob(clazz).withIdentity(job.getJobName(), job.getJobGroup()).build();

            jobDetail.getJobDataMap().put("scheduleJob", job);

            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());

            trigger = TriggerBuilder.newTrigger().withIdentity(job.getJobName(), job.getJobGroup()).withSchedule(scheduleBuilder).build();

            scheduler.scheduleJob(jobDetail, trigger);
        } else {
            // Trigger已存在，那么更新相应的定时设置
            CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(job.getCronExpression());

            // 按新的cronExpression表达式重新构建trigger
            trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();

            // 按新的trigger重新设置job执行
            scheduler.rescheduleJob(triggerKey, trigger);
        }
    }

    @Override
    @PostConstruct
    public void init() throws Exception {
        // 这里获取任务信息数据
        List<ScheduleJob> jobList = scheduleJobMapper.selectAll();

        for (ScheduleJob job : jobList) {
            addJob(job);
        }
    }

    /**
     * 获取所有计划中的任务列表
     *
     * @return
     * @throws SchedulerException
     */
    @Override
    public List<ScheduleJob> getAllJob() throws SchedulerException {
        GroupMatcher<JobKey> matcher = GroupMatcher.anyJobGroup();
        Set<JobKey> jobKeys = scheduler.getJobKeys(matcher);
        List<ScheduleJob> jobList = new ArrayList<ScheduleJob>();
        for (JobKey jobKey : jobKeys) {
            List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
            for (Trigger trigger : triggers) {
                ScheduleJob job = new ScheduleJob();
                job.setJobName(jobKey.getName());
                job.setJobGroup(jobKey.getGroup());
                job.setDescription("触发器:" + trigger.getKey());
                Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
                job.setJobStatus(triggerState.name());
                if (trigger instanceof CronTrigger) {
                    CronTrigger cronTrigger = (CronTrigger) trigger;
                    String cronExpression = cronTrigger.getCronExpression();
                    job.setCronExpression(cronExpression);
                }
                jobList.add(job);
            }
        }
        return jobList;
    }

    /**
     * 所有正在运行的job
     *
     * @return
     * @throws SchedulerException
     */
    @Override
    public List<ScheduleJob> getRunningJob() throws SchedulerException {
        List<JobExecutionContext> executingJobs = scheduler.getCurrentlyExecutingJobs();
        List<ScheduleJob> jobList = new ArrayList<ScheduleJob>(executingJobs.size());
        for (JobExecutionContext executingJob : executingJobs) {
            ScheduleJob job = new ScheduleJob();
            JobDetail jobDetail = executingJob.getJobDetail();
            JobKey jobKey = jobDetail.getKey();
            Trigger trigger = executingJob.getTrigger();
            job.setJobName(jobKey.getName());
            job.setJobGroup(jobKey.getGroup());
            job.setDescription("触发器:" + trigger.getKey());
            Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
            job.setJobStatus(triggerState.name());
            if (trigger instanceof CronTrigger) {
                CronTrigger cronTrigger = (CronTrigger) trigger;
                String cronExpression = cronTrigger.getCronExpression();
                job.setCronExpression(cronExpression);
            }
            jobList.add(job);
        }
        return jobList;
    }

    /**
     * 暂停一个job
     *
     * @param scheduleJob
     * @throws SchedulerException
     */
    @Override
    public void pauseJob(ScheduleJob scheduleJob) throws SchedulerException {
        JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
        scheduler.pauseJob(jobKey);
    }

    /**
     * 恢复一个job
     *
     * @param scheduleJob
     * @throws SchedulerException
     */
    public void resumeJob(ScheduleJob scheduleJob) throws SchedulerException {
        JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
        scheduler.resumeJob(jobKey);
    }

    /**
     * 删除一个job
     *
     * @param jobId
     * @throws SchedulerException
     */
    @Override
    public void deleteJob(int jobId) throws SchedulerException {
        ScheduleJob scheduleJob = getTaskById(jobId);
        JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
        scheduler.deleteJob(jobKey);
    }

    /**
     * 立即执行job
     *
     * @param scheduleJob
     * @throws SchedulerException
     */
    @Override
    public void runAJobNow(ScheduleJob scheduleJob) throws SchedulerException {
//        Scheduler scheduler = schedulerFactoryBean.getScheduler();
        JobKey jobKey = JobKey.jobKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());
        scheduler.triggerJob(jobKey);
    }

    /**
     * 更新job时间表达式
     *
     * @param scheduleJob
     * @throws SchedulerException
     */
    @Override
    public void updateJobCron(ScheduleJob scheduleJob) throws SchedulerException {
//        Scheduler scheduler = schedulerFactoryBean.getScheduler();

        TriggerKey triggerKey = TriggerKey.triggerKey(scheduleJob.getJobName(), scheduleJob.getJobGroup());

        CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);

        CronScheduleBuilder scheduleBuilder = CronScheduleBuilder.cronSchedule(scheduleJob.getCronExpression());

        trigger = trigger.getTriggerBuilder().withIdentity(triggerKey).withSchedule(scheduleBuilder).build();

        scheduler.rescheduleJob(triggerKey, trigger);
    }

}
