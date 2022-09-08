package com.bulletinBoard.service;

import com.bulletinBoard.dao.BoardDao;
import com.bulletinBoard.domain.BoardDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardServiceImpl implements BoardService {
    @Autowired
    BoardDao boardDao;

    @Override
    public List<BoardDto> getList() {
        return boardDao.selectAll();
    }




}
