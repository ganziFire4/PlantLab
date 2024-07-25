package com.bit.springboard.dao;

import com.bit.springboard.dto.BoardDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
    }

    public void delete(int id) {
    }

    public List<BoardDto> view_popular() {
        return List.of();
    }

    public List<BoardDto> view_all() {
        return List.of();
    }

    public BoardDto view_one(int id) {
        return null;
    }
}
