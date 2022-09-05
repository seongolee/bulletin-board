package com.bulletinBoard.service;

import com.bulletinBoard.dao.RegisterDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegisterServiceImpl implements RegisterService {
    @Autowired
    RegisterDao registerDao;

    public int idCheck(String id) throws Exception {
        return registerDao.idCheck(id);
    }
}
