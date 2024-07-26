package com.bit.springboard.controller;

import com.bit.springboard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @GetMapping("/changeTab.do")
    @ResponseBody
    public Map<String, Object> changeTab(int tab){
        Map<String, Object> map = new HashMap<>();
        map.put("tab", tab);
        map.put("popList", boardService.view_popular(tab));
        map.put("boardList", boardService.view_all(tab));
        return map;
    }

    @GetMapping("/post.do")
    public String post() {
        return "/board/post";
    }

    @GetMapping("/greentalk.do")
    public String greentalk() {
        return "/board/greentalk";
    }
}
