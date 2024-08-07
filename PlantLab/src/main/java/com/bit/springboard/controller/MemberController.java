package com.bit.springboard.controller;

import com.bit.springboard.dto.MemberDto;
import com.bit.springboard.service.BoardService;
import com.bit.springboard.service.GreentalkService;
import com.bit.springboard.service.MemberService;
import com.bit.springboard.service.impl.MemberServiceImpl;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.io.File;
import java.io.IOException;


@Controller
@RequestMapping("/member")
public class MemberController {
    private MemberService memberService;
    private BoardService boardService;
    private GreentalkService greentalkService;


    @Autowired
    public MemberController(MemberService memberService, BoardService boardService, GreentalkService greentalkService) {
        this.memberService = memberService;
        this.boardService = boardService;
        this.greentalkService = greentalkService;
    }

    @GetMapping("/login.do")
    public String loginView(){
        return "/WEB-INF/views/member/login_01";
    }

    @PostMapping("/login.do")
    public String login(MemberDto memberDto, Model model, HttpSession session) {
        try {
//            System.out.println("로그인 시도: " + memberDto.getLogin_id());

            MemberDto loggedInMember = memberService.login(memberDto);

//            System.out.println("로그인 성공: " + loggedInMember);
//            loggedInMember.setPassword("");

            session.setAttribute("loggedInMember", loggedInMember);

            return "redirect:/";

        }catch (Exception e) {
//            System.out.println("로그인 실패: " + e.getMessage());
            model.addAttribute("loginFailMsg", e.getMessage());
            return "/WEB-INF/views/member/login_01";
        }
    }

    @GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/green_login.do")
    public String green_loginView(){
        return "/WEB-INF/views/member/green_login_01";
    }

    @PostMapping("/green_login.do")
    public String green_login(MemberDto memberDto, Model model, HttpSession session) {
        try {
//            System.out.println("로그인 시도: " + memberDto.getLogin_id());

            MemberDto loggedInMember = memberService.login(memberDto);

//            System.out.println("로그인 성공: " + loggedInMember);
//            loggedInMember.setPassword("");

            session.setAttribute("loggedInMember", loggedInMember);

            return "redirect:/board/greentalk.do";

        }catch (Exception e) {
//            System.out.println("로그인 실패: " + e.getMessage());
            model.addAttribute("loginFailMsg", e.getMessage());
            return "/WEB-INF/views/member/green_login_01";
        }
    }

    @GetMapping("/greenpost_login.do")
    public String greenpost_loginView(){
        return "/WEB-INF/views/member/greenpost_login_01";
    }

    @PostMapping("/greenpost_login.do")
    public String greenpost_login(MemberDto memberDto, Model model, HttpSession session) {
        try {
//            System.out.println("로그인 시도: " + memberDto.getLogin_id());

            MemberDto loggedInMember = memberService.login(memberDto);

//            System.out.println("로그인 성공: " + loggedInMember);
//            loggedInMember.setPassword("");

            session.setAttribute("loggedInMember", loggedInMember);

            return "redirect:/board/greentalk_post";

        }catch (Exception e) {
//            System.out.println("로그인 실패: " + e.getMessage());
            model.addAttribute("loginFailMsg", e.getMessage());
            return "/WEB-INF/views/member/greenpost_login_01";
        }
    }

    @GetMapping("/green_logout.do")
    public String green_logout(HttpSession session) {
        session.invalidate();
        return"redirect:/board/greentalk.do";
    }


    @GetMapping("/join.do")
    public String joinView(){
        return "/WEB-INF/views/member/join_01";
    }

    @PostMapping("/join.do")
    public String join(MemberDto memberDto) {
        memberService.join(memberDto);
        return "/WEB-INF/views/member/login_01";
    }

    @GetMapping("/checkDuplicate.do")
    @ResponseBody
    public String checkDuplicate(@RequestParam("login_id") String loginId) {
        return memberService.loginIdCheck(loginId);
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

    @GetMapping("/modify.do")
    public String modifyView(){
        return "/WEB-INF/views/member/mypage";
    }

    @PostMapping("/modify.do")
    public String modify(MemberDto memberDto, HttpSession session, MultipartFile modify_pic, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        // session과 같은 정보의 Dto 만들기
        MemberDto loggedInMember = (MemberDto)session.getAttribute("loggedInMember");
        if(modify_pic != null) {
            String attachPath = request.getServletContext().getRealPath("\\") + "\\static\\images\\storage\\";

            System.out.println(attachPath);

            File directory = new File(attachPath);

            if(!directory.exists()) {
                directory.mkdirs();
            }

            File uploadFile = new File(attachPath + modify_pic.getOriginalFilename());

            if(!modify_pic.getOriginalFilename().equals("")) {
                loggedInMember.setMem_pic(modify_pic.getOriginalFilename());
            }

            try{
                modify_pic.transferTo(uploadFile);
            } catch (IOException ie) {
                System.out.println(ie.getMessage());
            }
        }
        if(!memberDto.getMem_nickname().isEmpty()){
            loggedInMember.setMem_nickname(memberDto.getMem_nickname());
        }

        if(!memberDto.getPassword().isEmpty()){
            loggedInMember.setPassword(memberDto.getPassword());
        }
        memberService.modify(loggedInMember);

        session.setAttribute("loggedInMember", loggedInMember);
        return "redirect:/member/mypage.do";
    }

    @GetMapping("/mypage.do")
    public String boardView(Model model, HttpSession session) {
        MemberDto loggedInMember = (MemberDto)session.getAttribute("loggedInMember");

        if(loggedInMember == null) {
            return "redirect:/member/login.do";
        }

        model.addAttribute("myWrite", boardService.getBoard(loggedInMember.getMem_id()));
//        session.setAttribute("myWrite", boardService.getBoard(memberDto.getMemId()));
        model.addAttribute("myGreentalk", greentalkService.getMyGreenList(loggedInMember.getMem_id()));
        model.addAttribute("boardLikeBookmarkCnt", memberService.getBoardLikeBookCnt(loggedInMember.getMem_id()));
        model.addAttribute("greenLikeBookmarkCnt", memberService.getGreenLikeBookCnt(loggedInMember.getMem_id()));

        session.setAttribute("loggedInMember", loggedInMember);
        return "/WEB-INF/views/member/mypage";
    }

    // 이메일 인증번호 발송
    @PostMapping("/sendEmailVerification")
    @ResponseBody
    public String sendEmailVerification(@RequestParam("email") String email) {
        try {
            MemberDto memberDto = new MemberDto();
            memberDto.setMem_email(email);
            //
            String verificationCode = memberService.sendSimpleMessage(email);
            return verificationCode;
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }


}
