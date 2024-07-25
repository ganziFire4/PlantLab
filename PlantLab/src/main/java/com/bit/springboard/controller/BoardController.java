package com.bit.springboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/board")
public class BoardController {

    @GetMapping("/board-list.do")
    public String boardList(Model model, @RequestParam("tab") int tab) {
        model.addAttribute("tab", tab);
        return "/board/board-list";
    }

    @GetMapping("/greentalk.do")
    public String greentalk() {
        return "/board/greentalk";
    }
}
