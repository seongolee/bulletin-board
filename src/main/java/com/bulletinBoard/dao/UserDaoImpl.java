package com.bulletinBoard.dao;

import com.bulletinBoard.domain.UserDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    SqlSession session;

    String namespace = "com.bulletinBoard.dao.UserMapper.";

    @Override
    public UserDto selectUser(String id) {
        return session.selectOne(namespace+"selectUser", id);
    }

    @Override
    public Integer findPwd(UserDto userDto) {
        return session.selectOne(namespace+"findPwd", userDto);
    }

    @Override
    public int updatePwd(UserDto userDto) {
        return session.update(namespace+"updatePwd", userDto);
    }
}
