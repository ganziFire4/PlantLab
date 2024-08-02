package com.bit.springboard.service.impl;

import com.bit.springboard.dao.MemberDao;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MemberService;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;

@Service
public class MemberServiceImpl implements MemberService {
    private MemberDao memberDao;
//    private String ePw; //회원이 메일로 받을 인증번호


    @Autowired
    public MemberServiceImpl(MemberDao memberDao) {
        this.memberDao = memberDao;
    }

//    @Autowired
//    //root context에 등록해둔 bean을 autowired해서 사용
//    JavaMailSender emailSender;

    @Override
    public void join(MemberDto memberDto) {
        memberDao.join(memberDto);
    }

    @Override
    public void saveAddress(MemberDto memberDto) {
        memberDao.saveAddress(memberDto);
    }

    public void modify(MemberDto memberDto) {
        memberDao.modify(memberDto);
    }

    @Override
    public MemberDto login(MemberDto memberDto) {
        int loginIdCheck = memberDao.loginIdCheck(memberDto.getLogin_id());

        if(loginIdCheck == 0)
            throw new RuntimeException("idNotExist");

        MemberDto loginMember = memberDao.login(memberDto);

        if(loginMember == null)
            throw new RuntimeException("wrongPassword");
        return loginMember;
    }

//    @Override
//    public void createMessage(MemberDto memberDto) throws MessagingException, UnsupportedEncodingException {
//        System.out.println("메일받을 사용자" + memberDto.getMem_email());
//        System.out.println("인증번호" + ePw);
//
//    }
//
//    @Override
//    public String createKey() {
//
//        return "";
//    }
//
//    @Override
//    public String sendSimpleMessage(MemberDto memberDto) throws Exception {
//        return "";
//    }

}
