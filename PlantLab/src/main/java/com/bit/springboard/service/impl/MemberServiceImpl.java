package com.bit.springboard.service.impl;

import com.bit.springboard.dao.MemberDao;
import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MemberService;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.security.SecureRandom;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class MemberServiceImpl implements MemberService {
    private static final int KEY_LENGTH = 6; // 인증 코드 길이 초기화
    private static final Random RANDOM = new SecureRandom(); // 랜덤 객체 초기화
    private MemberDao memberDao;
    private JavaMailSender emailSender;
    private String ePw; //회원이 메일로 받을 인증번호


    @Autowired
    public MemberServiceImpl(MemberDao memberDao,JavaMailSender emailSender) {
        this.memberDao = memberDao;
        this.emailSender = emailSender;
    }


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




    @Override
    public String createKey() {
        StringBuilder key = new StringBuilder(KEY_LENGTH);
        for (int i = 0; i < KEY_LENGTH; i++) {
            key.append(RANDOM.nextInt(10)); // 0-9 사이의 랜덤 숫자 추가
        }
        System.out.println("생성된 랜덤 인증코드: " + key.toString());
        return key.toString();
    }

    @Override
    public String sendSimpleMessage(String email) throws Exception {
        String verificationCode =createKey(); // 랜덤 인증코드 생성
        System.out.println("********생성된 랜덤 인증코드******** => " +  verificationCode);
        try {


            String msgg = "";

            msgg += "<h1>안녕하세요</h1>";
            msgg += "<h1>PlantLab 입니다</h1>";
            msgg += "<br>";
            msgg += "<p>아래 인증코드를 암호변경 페이지에 입력해주세요</p>";
            msgg += "<br>";
            msgg += "<br>";
            msgg += "<div align='center' style='border:1px solid black'>";
            msgg += "<h3 style='color:blue'>회원가입 인증코드 입니다</h3>";
            msgg += "<div style='font-size:130%'>";
            msgg += "<strong>" +  verificationCode + "</strong></div><br/>"; // 메일에 인증번호  verificationCode 넣기
            msgg += "</div>";

            MimeMessage message = emailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");// 메일 발송

            helper.setFrom("plantlab.ganzi4@gmail.com");
            helper.setTo(email);
            helper.setSubject("PlantLab 이메일 인증코드입니다.");
            helper.setText(msgg, true);
            emailSender.send(message);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

//        System.out.println("********생성된 메시지******** => " + message);

        return verificationCode; // 메일로 사용자에게 보낸 인증코드를 서버로 반환! 인증코드 일치여부를 확인하기

    }

    @Override
    public List<MemberDto> getBoardLikeBookCnt(int memId) {
      return memberDao.getBoardLikeBookCnt(memId);
    }

    @Override
    public List<MemberDto> getGreenLikeBookCnt(int memId) {
        return memberDao.getGreenLikeBookCnt(memId);
    }


}
