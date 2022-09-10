package com.bulletinBoard.dao;

import com.bulletinBoard.domain.BoardDto;
import com.bulletinBoard.domain.SearchCondition;

import java.util.List;

public interface BoardDao {
    List<BoardDto> searchSelectPage(SearchCondition sc);
    int searchResultCnt(SearchCondition sc);
    int insert(BoardDto boardDto);
    BoardDto read(Integer bno);
}
