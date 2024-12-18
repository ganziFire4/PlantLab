package com.bit.springboard.controller;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.GreentalkDto;
import com.bit.springboard.dto.GreentalkPageDto;
import com.bit.springboard.service.BoardService;
import com.bit.springboard.service.GreentalkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    private final BoardService boardService;
    private final GreentalkService greentalkService;

    @Autowired
    public MainController(BoardService boardService, GreentalkService greentalkService) {
        this.boardService = boardService;
        this.greentalkService = greentalkService;
    }


    @GetMapping("/")
    public String mainPage(Model model) {
        // 인기 정보글과 Q&A 게시글가져오기
        List<BoardDto> infoPosts = boardService.view_popular(1, null); // tab:1 정보글
        List<BoardDto> qaPosts = boardService.view_popular(2, null);   // tab:2 Q&A
        List<GreentalkDto> greentalkPopLists = greentalkService.getPopGreenLists_main();
//        System.out.println(infoPosts);
//        System.out.println(qaPosts);
        model.addAttribute("infoPosts", infoPosts);
        model.addAttribute("qaPosts", qaPosts);


        System.out.println(greentalkPopLists);
        model.addAttribute("greentalkPopLists", greentalkPopLists);
        System.out.println(greentalkPopLists);


        return "index";
    }



}
