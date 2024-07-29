package com.bit.springboard.dao;

import com.bit.springboard.dto.GreentalkDto;
import com.bit.springboard.dto.GreentalkFileDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GreentalkDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public GreentalkDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public void green_post(GreentalkDto greentalkDto, List<GreentalkFileDto> greentalkFileDtoList) {
        mybatis.insert("GreentalkDao.post", greentalkDto);
    }

    public void green_modify(GreentalkDto greentalkDto) {
        mybatis.update("GreendtalkDao.modify", greentalkDto);
    }

    public void delete(int id) {
        mybatis.delete("GreentalkDao.delete", id);
    }


    public void updateCnt(int id) {
        mybatis.update("GreentalkDao.updateCnt", id);
    }
}
