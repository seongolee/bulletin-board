package com.bulletinBoard.dao;

import com.bulletinBoard.domain.BoardDto;
import com.bulletinBoard.domain.SearchCondition;

import java.util.List;

public interface BoardDao {
    List<BoardDto> searchSelectPage(SearchCondition sc);
    int searchResultCnt(SearchCondition sc);
    int insert(BoardDto boardDto);
    BoardDto read(Integer bno);
    int remove(Integer bno, String writer);
    int update(BoardDto boardDto);

    int increaseViewCnt(Integer bno, String writer);
}
