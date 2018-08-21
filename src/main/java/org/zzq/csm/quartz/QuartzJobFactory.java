package org.zzq.csm.quartz;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.PersistJobDataAfterExecution;
import org.slf4j.LoggerFactory;
import org.springframework.util.ReflectionUtils;

import java.lang.reflect.Method;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-08-21
 */
@PersistJobDataAfterExecution
public class QuartzJobFactory implements Job {

    /**
     * The constant logger.
     */
    private org.slf4j.Logger logger = LoggerFactory.getLogger(this.getClass());

    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        ScheduleJob scheduleJob = (ScheduleJob) jobExecutionContext.getMergedJobDataMap().get("scheduleJob");
        //获取service层接口名和接口方法名
        String springBeanName = scheduleJob.getClassName();
        String methodName = scheduleJob.getMethodName();
        //获取参数数组和参数类型数组
        ArrayList paramArray = scheduleJob.getParamArray();
        Class[] paramType = new Class[paramArray.size()];
        for (int i = 0; i < paramArray.size(); i++) {
            paramType[i] = paramArray.get(i).getClass();
        }
        /**
         * 反射运行service层的方法
         */
        Object bean = SpringContextsUtil.getBean(springBeanName);
        Method method = ReflectionUtils.findMethod(bean.getClass(), methodName, paramType);
        ReflectionUtils.invokeMethod(method, bean, paramArray.toArray());

        logger.info("任务名称 = [" + scheduleJob.getJobName() + "]," +
                "任务调用的类=[" + scheduleJob.getClassName() + "]," +
                "任务调用的方法=[" + scheduleJob.getMethodName() + "]---->>成功启动运行");
    }
}
