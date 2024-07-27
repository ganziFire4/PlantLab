package com.bit.springboard.dao;

import com.bit.springboard.dto.MemberDto;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public MemberDao(SqlSessionTemplate sqlSessionTemplate) {
        this.mybatis = sqlSessionTemplate;
    }

    public void join(MemberDto memberDto) {
        System.out.println("MemberDao의 join메소드 실행");
        mybatis.insert("MemberDao.join", memberDto);
        System.out.println("MemberDao의 join메소드 종료");
    }

    public void modify(MemberDto memberDto) {
        mybatis.update("MemberDao.modify", memberDto);
    }
}
