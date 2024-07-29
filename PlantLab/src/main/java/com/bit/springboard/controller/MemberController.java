package com.bit.springboard.controller;

import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.ResponseBody;
=======
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
>>>>>>> 1bb0ca8a6ce113579ea170d3bbcd624163ad93ff

@Controller
@RequestMapping("/member")
public class MemberController {
    private MemberService memberService;

    @Autowired
    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping("/login.do")
    public String loginView(){
        return "member/login_01";
    }

    @GetMapping("/join.do")
    public String joinView(){
        return "member/join_01";
    }

    @PostMapping("/join.do")
    public String join(MemberDto memberDto) {
        memberService.join(memberDto);
        return "member/login_01";
    }

<<<<<<< HEAD
    @Controller
    public class AddressController {
        private final MemberService memberService;

        @Autowired
        public AddressController(MemberService memberService) {
            this.memberService = memberService;
        }


        @PostMapping("/address/save")
        @ResponseBody
        public String saveAddress(MemberDto memberDto) {
            memberService.saveAddress(memberDto);
            return "주소가 성공적으로 저장되었습니다.";
        }
    }
=======
    @PostMapping("/modify.do")
    public String modify(MemberDto memberDto, MultipartFile imgFile, RedirectAttributes redirectAttributes) {

        if(imgFile != null) {
            String attachPath = "C:/Project/PlantLab/src/main/webapp/static/images/storage/";

            File directory = new File(attachPath);

            if(!directory.exists()) {
                directory.mkdirs();
            }

            File uploadFile = new File(attachPath + imgFile.getOriginalFilename());

            memberDto.setPicture(imgFile.getOriginalFilename());

            try{
                imgFile.transferTo(uploadFile);
            } catch (IOException ie) {
                System.out.println(ie.getMessage());
            }
        }
        memberService.modify(memberDto);
        return "member/login_01";
    }


>>>>>>> 1bb0ca8a6ce113579ea170d3bbcd624163ad93ff
}
