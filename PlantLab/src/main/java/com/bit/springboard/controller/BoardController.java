package com.bit.springboard.controller;

import com.bit.springboard.service.BoardService;
import com.bit.springboard.service.impl.BoardSevieImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/board")
public class BoardController {
    private BoardService boardService;
    private ApplicationContext applicationContext;

    @Autowired
    public BoardController(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    @GetMapping("/board-main.do")
    public String boardList(Model model, @RequestParam("tab") int tab) {
        boardService = applicationContext.getBean("BoardServiceImpl", BoardService.class);

        model.addAttribute("tab", tab);
        model.addAttribute("popList", boardService.view_popular());
        model.addAttribute("boardList", boardService.view_all());
        return "/board/board-main";
    }

    @GetMapping("/post.do")
    public String post() {
        return "/board/post";
    }

}
