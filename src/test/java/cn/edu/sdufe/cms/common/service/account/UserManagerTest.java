package cn.edu.sdufe.cms.common.service.account;

import cn.edu.sdufe.cms.common.dao.account.UserDao;
import cn.edu.sdufe.cms.common.dao.account.UserJpaDao;
import cn.edu.sdufe.cms.common.entity.account.User;
import cn.edu.sdufe.cms.common.service.ServiceException;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.springside.modules.test.support.ShiroTestHelper;

import java.util.Date;

import static org.junit.Assert.fail;

/**
 * 类功能简介
 * <p/>
 * User: baitao.jibt (dreambt@gmail.com)
 * Date: 12-3-28
 * Time: 下午11:23
 */
public class UserManagerTest {

    private UserManager userManager;

    @Mock
    private UserDao mockUserDao;

    @Mock
    private UserJpaDao mockUserJpaDao;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        ShiroTestHelper.mockSubject("Baitao.jibt");

        userManager = new UserManager();
        userManager.setUserDao(mockUserDao);
        userManager.setUserJpaDao(mockUserJpaDao);
    }

    @After
    public void tearDown() throws Exception {
        ShiroTestHelper.clearSubject();
    }

    @Test
    public void testSaveUser() throws Exception {
        User admin = new User();
        admin.setId(1L);
        admin.setModifyTime(new Date());

        User user = new User();
        user.setId(2L);
        user.setModifyTime(new Date());

        //正常保存用户
        userManager.saveUser(user);

        //保存超级管理用户抛出异常
        try {
            userManager.saveUser(admin);
            fail("expected ServicExcepton not be thrown");
        } catch (ServiceException se) {
            //expected exception
        }
    }

}