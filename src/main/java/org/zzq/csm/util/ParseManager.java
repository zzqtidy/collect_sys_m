package org.zzq.csm.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * Description:常用的一些转换的方法
 * User: TYLER
 * Date: 2018-08-08
 * Time: 20:42
 */
public class ParseManager {
    private static Logger logger = LoggerFactory.getLogger(ParseManager.class);
   /**
   * @Description:java实体类转换成map
   * @Author:tylerz
   * @CreateDate:2018/8/8
   * @Version:1.0
   */
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static Map beanToMap(Object javaBean) {
        Map map = new HashMap();
        try {
            // 获取javaBean属性
            BeanInfo beanInfo = Introspector.getBeanInfo(javaBean.getClass());
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            if (propertyDescriptors != null && propertyDescriptors.length > 0) {
                String propertyName = null; // javaBean属性名
                Object propertyValue = null; // javaBean属性值
                for (PropertyDescriptor pd : propertyDescriptors) {
                    propertyName = pd.getName();
                    if (!propertyName.equals("class")) {
                        Method readMethod = pd.getReadMethod();
                        propertyValue = readMethod.invoke(javaBean, new Object[0]);
                        map.put(propertyName, propertyValue);
                    }
                }
            }

        } catch (Exception e) {
            logger.error("java实体类转换成map错误："+e.getMessage());
        }
        return map;
    }
    @SuppressWarnings({"rawtypes", "unchecked"})
    public static List<Map<String,Object>> beanToMapList(List<Object> javaBeanList){
        List<Map<String,Object>> maps = new ArrayList<Map<String,Object>>();
        for (Object javaBean:javaBeanList) {
            maps.add(beanToMap(javaBean));
        }
        return maps;
    }
    /**
    * @Description:map转化成java实体类
    * @Author:tylerz
    * @CreateDate:2018/8/8
    * @Version:1.0
    */
    @SuppressWarnings("rawtypes")
    private static <T> T mapToBean(Class<T> clazz, Map map) {
        T obj = null;
        try {
            BeanInfo beanInfo = Introspector.getBeanInfo(clazz);
            obj = clazz.newInstance(); // 创建 JavaBean 对象
            // 给 JavaBean 对象的属性赋值
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            for (int i = 0; i < propertyDescriptors.length; i++) {
                PropertyDescriptor descriptor = propertyDescriptors[i];
                String propertyName = descriptor.getName();
                if (map.containsKey(propertyName)) {
                    // 下面一句可以 try 起来，这样当一个属性赋值失败的时候就不会影响其他属性赋值。
                    Object value = map.get(propertyName);
                    if ("".equals(value)) {
                        value = null;
                    }
                    Object[] args = new Object[1];
                    args[0] = value;
                    try {
                        descriptor.getWriteMethod().invoke(obj, args);
                    } catch (Exception e) {
                        logger.error("java实体类转换成map错误，字段映射失败："+e.getMessage());
                    }
                }
            }
        } catch (Exception e) {
            logger.error("java实体类转换成map错误，实例化 JavaBean 失败："+e.getMessage());
        }
        return (T) obj;
    }
}
