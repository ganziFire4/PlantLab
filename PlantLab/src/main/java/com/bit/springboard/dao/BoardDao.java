package com.bit.springboard.dao;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.Criteria;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class BoardDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public BoardDao(SqlSessionTemplate sqlSessionTemplate){
        this.mybatis = sqlSessionTemplate;
    }

    public void post(BoardDto boardDto) {
        mybatis.insert("BoardDao.post", boardDto);
    }

    public void modify(BoardDto boardDto) {
        mybatis.update("BoardDao.modify", boardDto);
    }

    public void delete(int id) {
        mybatis.delete("BoardDao.delete", id);
    }

    public List<BoardDto> view_popular(int tab, String popCondition) {
        Map<String, Object> paramMap = new HashMap<>();

        paramMap.put("tab", tab);
        paramMap.put("popCondition", popCondition);
        return mybatis.selectList("BoardDao.view_popular", paramMap);
    }

    public List<BoardDto> view_all(int tab, Map<String, String> searchMap, Map<String, String> table, Criteria cri) {
        Map<String, Object> paramMap = new HashMap<>();

        paramMap.put("tab", tab);
        paramMap.put("searchMap", searchMap);
        paramMap.put("table", table);
        paramMap.put("cri", cri);
        return mybatis.selectList("BoardDao.view_all", paramMap);
    }

    public BoardDto view_one(int id) {
        return mybatis.selectOne("BoardDao.view_one", id);
    }

    public void update_view_cnt(int id) {
        mybatis.update("BoardDao.update_view_cnt", id);
    }

    public List<BoardDto> getBoard(int id) {
        return mybatis.selectList("BoardDao.getBoard", id);
    }

    public int getBoardTotal(int tab, Map<String, String> search) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("tab", tab);
        paramMap.put("searchMap", search);
        return mybatis.selectOne("BoardDao.getBoardTotal", paramMap);
    }
}
