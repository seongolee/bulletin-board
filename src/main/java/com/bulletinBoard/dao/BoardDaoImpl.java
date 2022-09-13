package com.bulletinBoard.dao;

import com.bulletinBoard.domain.BoardDto;
import com.bulletinBoard.domain.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public int insert(BoardDto boardDto){
        return session.insert(namespace+"insert", boardDto);
    }

    @Override
    public BoardDto read(Integer bno) {
        return session.selectOne(namespace+"read", bno);
    }

    @Override
    public int remove(Integer bno, String writer) {
        Map map = new HashMap();
        map.put("bno", bno);
        map.put("writer", writer);
        return session.delete(namespace+"remove", map);
    }

    @Override
    public int update(BoardDto boardDto) {
        return session.update(namespace+"update", boardDto);
    }

    @Override
    public int increaseViewCnt(Integer bno, String writer) {
        Map map = new HashMap();
        map.put("bno", bno);
        map.put("writer", writer);
        return session.update(namespace+"increaseViewCnt", map);
    }
}
