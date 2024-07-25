package com.bit.springboard.dao;

import com.bit.springboard.dto.GreentalkDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GreentalkDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public GreentalkDao(SqlSessionTemplate sqlSessionTemplate){this.mybatis = sqlSessionTemplate;}

    public void green_post(GreentalkDto greentalkDto){mybatis.insert("GreentalkDao.post", greentalkDto);}


}
