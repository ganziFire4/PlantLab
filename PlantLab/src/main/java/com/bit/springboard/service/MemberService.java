package com.bit.springboard.service;

import com.bit.springboard.dto.MemberDto;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import java.io.UnsupportedEncodingException;

public interface MemberService {
    void join(MemberDto memberDto);


    void saveAddress(MemberDto memberDto);


    void modify(MemberDto memberDto);

    MemberDto login(MemberDto memberDto);

//    void createMessage(MemberDto memberDto) throws MessagingException, UnsupportedEncodingException;
//
//    String createKey();
//
//    String sendSimpleMessage(MemberDto memberDto) throws Exception;


}

