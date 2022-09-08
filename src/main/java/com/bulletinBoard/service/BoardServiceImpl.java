package com.bulletinBoard.service;

import com.bulletinBoard.dao.BoardDao;
import com.bulletinBoard.domain.BoardDto;
import com.bulletinBoard.domain.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardServiceImpl implements BoardService {
    @Autowired
    BoardDao boardDao;

    @Override
    public List<BoardDto> getSearchResultPage(SearchCondition sc) {
        // 조건에 맞는 게시글 조회
        return boardDao.searchSelectPage(sc);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) {
        // 조건에 맞는 총 조회수 조회
        return boardDao.searchResultCnt(sc);
    }
}
