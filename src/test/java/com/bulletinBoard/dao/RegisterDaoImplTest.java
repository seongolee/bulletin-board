package com.bulletinBoard.dao;

import com.bulletinBoard.domain.UserDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.sql.Date;

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

    @Test
    public void insertUserTest() {
        UserDto userDto = new UserDto();
        userDto.setId("insertTest");
        userDto.setPwd("test");
        userDto.setName("test");
        userDto.setEmail("test@test.com");
        userDto.setPhone_number("010-010-010");
        userDto.setBirth(Date.valueOf("1010-10-10"));

        int tmp = registerDao.insertUser(userDto);
        System.out.println("insertUser 결과 : " + tmp);
    }
}
