package com.bulletinBoard.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegisterDaoImpl implements RegisterDao {
    @Autowired
    SqlSession session;

    String namespace="com.bulletinBoard.dao.RegisterMapper.";

    @Override
    public int idCheck(String id) throws Exception {
        return session.selectOne(namespace+"idCheck", id);
    }
}
