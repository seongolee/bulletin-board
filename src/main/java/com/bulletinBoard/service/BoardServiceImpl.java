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

    @Override
    public int write(BoardDto boardDto){
        // 게시글 쓰기
        return boardDao.insert(boardDto);
    }

    @Override
    public BoardDto read(Integer bno) {
        // 게시글 조회
        return boardDao.read(bno);
    }

    @Override
    public int remove(Integer bno, String writer) {
        // 게시글 삭제
        return boardDao.remove(bno, writer);
    }

    @Override
    public int update(BoardDto boardDto) {
        // 게시글 수정
        return boardDao.update(boardDto);
    }
}
