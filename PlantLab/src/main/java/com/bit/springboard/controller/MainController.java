package com.bit.springboard.controller;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.GreentalkDto;
import com.bit.springboard.dto.GreentalkPageDto;
import com.bit.springboard.service.BoardService;
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

    @Autowired
    public MainController(BoardService boardService) {
        this.boardService = boardService;
    }


    @GetMapping("/")
    public String mainPage(Model model) {
        // 인기 정보글과 Q&A 게시글가져오기
        List<BoardDto> infoPosts = boardService.view_popular(1, null); // tab:1 정보글
        List<BoardDto> qaPosts = boardService.view_popular(2, null);   // tab:2 Q&A
//        System.out.println(infoPosts);
//        System.out.println(qaPosts);
        model.addAttribute("infoPosts", infoPosts);
        model.addAttribute("qaPosts", qaPosts);

        return "index";
    }


//    @RequestMapping("/")
//    public String greentalk_main(Model model, Criteria cri, Map<String, String> searchMap) {
//
//        List<Map<String, Object>> mapList = new ArrayList<>();
//
//        List<GreentalkDto> greentalkPopList = greentalkService.getPopGreenList();
//
//        List<GreentalkDto> greentalkDtoList = greentalkService.getGreenList(searchMap, cri);
//
//        greentalkDtoList.forEach(greentalkDto -> {
//            List<GreentalkDto> greentalkPicDtoList = greentalkService.getGreenFileList(greentalkDto.getGreen_id());
//            Map<String, Object> map = new HashMap<>();
//            map.put("greentalkDto", greentalkDto);
//            if (greentalkPicDtoList.size() > 0)
//                map.put("file", greentalkPicDtoList.get(0));
//
//            mapList.add(map);
//        }); // 강사님찬스
//
//        // 인기글 두개 가져오는 거 구현
//        model.addAttribute("popList", greentalkPopList);
//
//        //밑에 세개
//        model.addAttribute("greentalkList", mapList);
//
//        int total = greentalkService.getTotalCnt(searchMap);
//
//        model.addAttribute("page", new GreentalkPageDto(cri, total));
//        return "/WEB-INF/views/board/greentalk";
//
//    }
}
