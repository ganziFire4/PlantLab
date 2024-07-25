package com.bit.springboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

    @GetMapping("/login.do")
    public String loginView(){
        return "member/login_01";
    }


    @GetMapping("/join.do")
    public String joinView(){
        return "member/join_01";
    }



}
