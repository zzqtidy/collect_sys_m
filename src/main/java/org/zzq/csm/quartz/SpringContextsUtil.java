package org.zzq.csm.quartz;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: TYLER
 * Date: 2018-08-21
 */
@Component
public class SpringContextsUtil implements ApplicationContextAware {


    private static ApplicationContext applicationContext;

    public static Object getBean(String beanName) throws BeansException {
        return applicationContext.getBean(beanName);
    }

    public static <T> T getBean(String beanName, Class<T> clazs) {
        return applicationContext.getBean(beanName, clazs);
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext)
            throws BeansException {
        SpringContextsUtil.applicationContext = applicationContext;
    }
}
