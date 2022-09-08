package com.bulletinBoard.service;

import com.bulletinBoard.domain.UserDto;

public interface RegisterService {
    String idCheck(String id) throws Exception;

    int insertUser(UserDto userDto);
}
