package org.zzq.csm.service.login.impl;

import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zzq.csm.entity.login.ActiveUser;
import org.zzq.csm.service.login.SysService;

/**
 * SysServiceImpl Tester.
 *
 * @author tylerz
 * @version 1.0
 * @since <pre>十一月 22, 2017</pre>
 */


/**
 * 配置spring和junit的整合，为了junit启动时加载springIOC容器
 * spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring容器的配置文件
@ContextConfiguration({
        "classpath:spring/spring-dao.xml",
        "classpath:spring/spring-service.xml"
})
public class SysServiceImplTest {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private SysService sysService;

    @Test
    public void testAuthenticat() throws Exception {
        try {
            ActiveUser activeUser = sysService.authenticat("zhangsan", "123456");
        } catch (Exception e) {
            logger.error(e.getMessage());
        }

    }

    @Test
    public void testFindSysUserByUserCode() throws Exception {
    }


    @Test
    public void testFindMenuListByUserId() throws Exception {
    }


    @Test
    public void testFindPermissionListByUserId() throws Exception {
    }


} 
