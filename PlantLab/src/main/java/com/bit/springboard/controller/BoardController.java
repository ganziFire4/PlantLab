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
        return "/board/board-main";
    }

    @GetMapping("/post.do")
    public String post() {
        return "/board/post";
    }

    @GetMapping("/greentalk.do")
    public String greentalk() {
        return "/board/greentalk";
    }

    @GetMapping("/board-detail.do")
    public String board(Model model, @RequestParam("id") int id) {
        model.addAttribute("board", boardService.view_one(id));
        return "/board/board-detail";
    }

    @GetMapping("/greentalk_post")
    public String greentalk_post(){return"/board/greentalk_post";}


}
