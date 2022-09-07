package com.bulletinBoard.dao;

import com.bulletinBoard.domain.BoardDto;

import java.util.List;

public interface BoardDao {
    List<BoardDto> selectAll();
}
