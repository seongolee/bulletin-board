package com.bulletinBoard.dao;

import com.bulletinBoard.domain.UserDto;

public interface RegisterDao {
    int idCheck(String id) throws Exception;
    int insertUser(UserDto userDto);
}
