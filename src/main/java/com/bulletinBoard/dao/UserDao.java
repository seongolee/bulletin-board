package com.bulletinBoard.dao;

import com.bulletinBoard.domain.UserDto;

public interface UserDao {
    UserDto selectUser(String id);
}
