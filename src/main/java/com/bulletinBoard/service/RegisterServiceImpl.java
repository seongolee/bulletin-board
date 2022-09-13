package com.bulletinBoard.service;

import com.bulletinBoard.dao.RegisterDao;
import com.bulletinBoard.domain.UserDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegisterServiceImpl implements RegisterService {
    @Autowired
    RegisterDao registerDao;

    @Override
    public String idCheck(String id) throws Exception {
        int idCheck = registerDao.idCheck(id);
        return idCheck != 0 ? "false" : "true";
    }

    @Override
    public int insertUser(UserDto userDto) {
        return registerDao.insertUser(userDto);
    }
}
