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
        mybatis.update("BoardDao.modify", boardDto);
    }

    public void delete(int id) {
        mybatis.delete("BoardDao.delete", id);
    }

    public List<BoardDto> view_popular() {
        return mybatis.selectList("BoardDao.view_popular");
    }

    public List<BoardDto> view_all() {
        return mybatis.selectList("BoardDao.view_all");
    }

    public BoardDto view_one(int id) {
        return mybatis.selectOne("BoardDao.view_one", id);
    }
}
