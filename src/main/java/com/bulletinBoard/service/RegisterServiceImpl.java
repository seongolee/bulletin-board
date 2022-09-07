package com.bulletinBoard.service;

import com.bulletinBoard.dao.RegisterDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegisterServiceImpl implements RegisterService {
    @Autowired
    RegisterDao registerDao;

    public String idCheck(String id) throws Exception {
        int idCheck = registerDao.idCheck(id);
        return idCheck != 0 ? "false" : "true";
    }
}
