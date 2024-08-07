package com.bit.springboard.service;

import com.bit.springboard.dto.MemberDto;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

import java.io.UnsupportedEncodingException;
import java.util.List;

public interface MemberService {
    void join(MemberDto memberDto);


    void saveAddress(MemberDto memberDto);


    void modify(MemberDto memberDto);

    MemberDto login(MemberDto memberDto);

//    MimeMessage createMessage(String email) throws MessagingException, UnsupportedEncodingException;

    String createKey();

    String sendSimpleMessage(String email) throws Exception;

    List<MemberDto> getBoardLikeBookCnt(int memId);

    List<MemberDto> getGreenLikeBookCnt(int memId);
}

