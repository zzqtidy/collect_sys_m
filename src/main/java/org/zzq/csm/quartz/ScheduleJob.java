package org.zzq.csm.quartz;

import java.io.Serializable;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-08-21
 */
public class ScheduleJob implements Serializable {

    private static final long serialVersionUID = -5115028108119830917L;

    public ScheduleJob(String jobName, String jobGroup, String triggerName, String triggerGroup, String className, String methodName, ArrayList paramArray, String cron, String runDate, String desc) {
        this.jobName = jobName;
        this.jobGroup = jobGroup;
        this.triggerName = triggerName;
        this.triggerGroup = triggerGroup;
        this.className = className;
        this.methodName = methodName;
        this.paramArray = paramArray;
        this.cron = cron;
        this.runDate = runDate;
        this.desc = desc;
    }

    /**
     * 任务名称
     */
    private String jobName;
    /**
     * 任务分组
     */
    private String jobGroup;
    /**
     * 触发器名称（默认和任务名称相同）
     */
    private String triggerName;
    /**
     * 触发器分组（默认和任务分组相同）
     */
    private String triggerGroup;
    /**
     * 任务需要调用的是哪个类的类名
     */
    private String className;
    /**
     * 任务需要调用的是哪个类的方法名
     */
    private String methodName;
    /**
     * 方法所需参数数组
     */
    private ArrayList paramArray;
    /**
     * 任务运行时间表达式
     */
    private String cron;
    /**
     * 任务运行时间(特指只运行一次的任务)
     */
    private String runDate;
    /**
     * 任务描述
     */
    private String desc;

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName;
    }

    public String getJobGroup() {
        return jobGroup;
    }

    public void setJobGroup(String jobGroup) {
        this.jobGroup = jobGroup;
    }

    public String getTriggerName() {
        return triggerName;
    }

    public void setTriggerName(String triggerName) {
        this.triggerName = triggerName;
    }

    public String getTriggerGroup() {
        return triggerGroup;
    }

    public void setTriggerGroup(String triggerGroup) {
        this.triggerGroup = triggerGroup;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }

    public ArrayList getParamArray() {
        return paramArray;
    }

    public void setParamArray(ArrayList paramArray) {
        this.paramArray = paramArray;
    }

    public String getCron() {
        return cron;
    }

    public void setCron(String cron) {
        this.cron = cron;
    }

    public String getRunDate() {
        return runDate;
    }

    public void setRunDate(String runDate) {
        this.runDate = runDate;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }
}
