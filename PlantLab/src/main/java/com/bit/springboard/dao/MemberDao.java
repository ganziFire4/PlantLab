package com.bit.springboard.dao;

import com.bit.springboard.dto.MemberDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
    private SqlSession mybatis;

    @Autowired
    public MemberDao(SqlSession mybatis) {
        this.mybatis = mybatis;
    }

    public void join(MemberDto memberDto) {
        System.out.println("실행");
        mybatis.insert("MemberDao.join", memberDto);
    }
}
