package com.bit.springboard.controller;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.service.BoardService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
//import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/board")
public class BoardController {
    private BoardService boardService;

    @Autowired
    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @GetMapping("/board-main.do")
    public String boardList(Model model, @RequestParam("tab") int tab) {
        model.addAttribute("tab", tab);
        model.addAttribute("popList", boardService.view_popular(tab));
        model.addAttribute("boardList", boardService.view_all(tab));
        return "/board/board-main";
    }

//    @GetMapping("/changeTab.do")
//    @ResponseBody
//    public Map<String, Object> changeTab(HttpServletRequest request, @RequestParam("tab") int tab) {
//        Map<String, Object> response = new HashMap<>();
//        response.put("tab", tab);
//
//        // 헤더 이미지 설정
//        String header = "";
//        switch (tab) {
//            case 1:
//                header = "<img src='" + request.getContextPath() + "/static/images/header_정보.png' alt='정보게시판 헤더'>";
//                break;
//            case 2:
//                header = "<img src='" + request.getContextPath() + "/static/images/header_잡담.png' alt='잡담게시판 헤더'>";
//                break;
//            case 3:
//                header = "<img src='" + request.getContextPath() + "/static/images/header_질문.png' alt='질문게시판 헤더'>";
//                break;
//            case 4:
//                header = "<img src='" + request.getContextPath() + "/static/images/header_그린톡.png' alt='그린톡 헤더'>";
//                break;
//        }
//        response.put("header", header);
//
//        // ModelAndView를 사용하여 JSP 렌더링
//        ModelAndView mav = new ModelAndView();
//        if (tab == 4) {
//            mav.setViewName("/board/greentalk");
//        } else {
//            mav.setViewName("/board/board-list");
//        }
//        mav.addObject("popList", boardService.view_popular(tab));
//        mav.addObject("boardList", boardService.view_all(tab));
//
//        // JSP 내용을 String으로 변환
//        String boardContent = renderViewToString(request, mav.getModel(), mav.getViewName());
//        response.put("boardContent", boardContent);
//
//        return response;
//    }
//
//    // View를 String으로 변환하는 유틸리티 메서드
//    private String renderViewToString(HttpServletRequest request, Map<String, Object> model, String viewName) {
//        try {
//            WebApplicationContext webApplicationContext = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
//            View view = webApplicationContext.getBean(viewName, View.class);
//            MockHttpServletResponse mockResponse = new MockHttpServletResponse();
//            view.render(model, request, mockResponse);
//            return mockResponse.getContentAsString();
//        } catch (Exception e) {
//            throw new RuntimeException("Error rendering view to string", e);
//        }
//    }


    @GetMapping("/post.do")
    public String post() {
        return "/board/post";
    }

    @GetMapping("/greentalk.do")
    public String greentalk() {
        return "/board/greentalk";
    }


}
