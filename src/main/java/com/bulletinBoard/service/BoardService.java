package com.bulletinBoard.service;

import com.bulletinBoard.domain.BoardDto;
import com.bulletinBoard.domain.SearchCondition;

import java.util.List;

public interface BoardService {

    List<BoardDto> getSearchResultPage(SearchCondition sc);
    int getSearchResultCnt(SearchCondition sc);
}
