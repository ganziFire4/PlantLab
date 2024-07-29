package com.bit.springboard.controller;

import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
        System.out.println(1);
        return "member/login_01";
    }

    @GetMapping("/join.do")
    public String joinView(){
        System.out.println(2);
        return "member/join_01";
    }


    @PostMapping("/join.do")
    public String join(MemberDto memberDto) {
        System.out.println(3);
        memberService.join(memberDto);
        return "member/login";
    }

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
}
