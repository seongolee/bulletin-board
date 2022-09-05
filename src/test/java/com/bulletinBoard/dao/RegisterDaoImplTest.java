package com.bulletinBoard.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class RegisterDaoImplTest {
    @Autowired
    RegisterDao registerDao;

    @Test
    public void idCheck() throws Exception {
        assertTrue(registerDao!=null);
        int tmp = registerDao.idCheck("test");
        System.out.println("tmp = " + tmp);
    }
}
