package com.bulletinBoard.dao;

import com.bulletinBoard.domain.BoardDto;
import com.bulletinBoard.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardDaoImpl implements BoardDao {
    @Autowired
    SqlSession session;

    String namespace = "com.bulletinBoard.dao.BoardMapper.";

    @Override
    public List<BoardDto> searchSelectPage(SearchCondition sc) {
        return session.selectList(namespace+"searchSelectPage", sc);
    }

    @Override
    public int searchResultCnt(SearchCondition sc) {
        return session.selectOne(namespace+"searchResultCnt", sc);
    }
}
