package com.bulletinBoard.service;

import com.bulletinBoard.domain.BoardDto;

import java.util.List;

public interface BoardService {
    List<BoardDto> getList();
}
