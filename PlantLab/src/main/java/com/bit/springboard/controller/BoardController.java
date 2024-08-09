package com.bit.springboard.controller;

import com.bit.springboard.dto.*;
import com.bit.springboard.service.BoardService;
import com.bit.springboard.service.GreentalkService;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
//import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/board")
public class BoardController {
    private BoardService boardService;
    private GreentalkService greentalkService;
    private ApplicationContext applicationContext;

    @Autowired
    public BoardController(BoardService boardService, ApplicationContext applicationContext, GreentalkService greentalkService) {
        this.boardService = boardService;
        this.applicationContext = applicationContext;
        this.greentalkService = greentalkService;
    }

    @RequestMapping("/board-main.do")
    public String boardList(Model model, HttpSession session,
                            @RequestParam("tab") int tab,
                            @RequestParam(value = "search_condition", required = false) String search_condition,
                            @RequestParam(value = "search_keyword", required = false) String search_keyword,
                            @RequestParam(value = "pop_condition", required = false) String pop_condition,
                            @RequestParam (value = "rec_condition", required = false) String rec_condition,
                            @RequestParam(value = "rowsNum", required = false) String rowsNum, Criteria cri){

        Map<String, String> search = new HashMap<>();
        search.put("search_condition", search_condition);
        search.put("search_keyword", search_keyword);

        Map<String, String> table = new HashMap<>();
        table.put("rec_condition", rec_condition);
        table.put("rowsNum", rowsNum);

        if(table.get("rowsNum") != null) {
            cri.setAmount(Integer.parseInt(table.get("rowsNum")));
        } else {
            cri.setAmount(10);
        }

        System.out.println(cri);

        model.addAttribute("tab", tab);
        model.addAttribute("popList", boardService.view_popular(tab, pop_condition));
        model.addAttribute("boardList", boardService.view_all(tab, search, table, cri));
        model.addAttribute("search", search);
        session.setAttribute("pop_condition", pop_condition);
        session.setAttribute("table", table);

        int total = boardService.getBoardTotal(tab, search);
        model.addAttribute("total", total);
        model.addAttribute("page", new BoardPageDto(cri, total));

//        System.out.println(pop_condition);
//        System.out.println(table);
        return "/WEB-INF/views/board/board-main";

    }


    @GetMapping("/post.do")
    public String post(Model model, @RequestParam("tab") int tab) {
        model.addAttribute("tab", tab);
        return "/WEB-INF/views/board/post";
    }

    @PostMapping("/post.do")
    public String uploadPost(BoardDto boardDto){
        String content = boardDto.getBoard_content();
        boardDto.setBoard_content(content.replace("\r\n", "<br>"));
        boardService.post(boardDto);
//        System.out.println(boardDto);
//        model.addAttribute("board", boardService.getBoard(boardDto.getBoard_id()));
        return "redirect:/board/board-main.do?tab=" + boardDto.getBoard_type();
    }


    @RequestMapping("/greentalk.do")
    public String greentalk(Model model, Criteria cri, Map<String, String> searchMap) {

        List<Map<String, Object>> mapList = new ArrayList<>();

        List<GreentalkDto> greentalkPopList = greentalkService.getPopGreenList();

        List<GreentalkDto> greentalkDtoList = greentalkService.getGreenList(searchMap, cri);

        greentalkDtoList.forEach(greentalkDto -> {
            List<GreentalkDto> greentalkPicDtoList = greentalkService.getGreenFileList(greentalkDto.getGreen_id());
            Map<String, Object> map = new HashMap<>();
            map.put("greentalkDto", greentalkDto);
            if (greentalkPicDtoList.size() > 0)
                map.put("file", greentalkPicDtoList.get(0));

            mapList.add(map);
        }); // 강사님찬스

        // 인기글 두개 가져오는 거 구현
        model.addAttribute("popList", greentalkPopList);

        //밑에 세개
        model.addAttribute("greentalkList", mapList);

        int total = greentalkService.getTotalCnt(searchMap);

        model.addAttribute("page", new GreentalkPageDto(cri, total));
        return "/WEB-INF/views/board/greentalk";

    }

    @GetMapping("/board-detail.do")
    public String board(Model model, @RequestParam("id") int id) {
        model.addAttribute("board", boardService.view_one(id));
        model.addAttribute("commentList", boardService.showCommentList(id));
        return "/WEB-INF/views/board/board-detail";
    }

    @GetMapping("/update-cnt.do")
    public String board_view_cnt (@RequestParam("id") int id){
        boardService.update_view_cnt(id);
        return "redirect:/board/board-detail.do?id=" + id;
    }

    @GetMapping("/greentalk_post")
    public String greentalk_post(HttpSession session) {
        MemberDto loggedInMember = (MemberDto)session.getAttribute("loggedInMember");
        if(loggedInMember == null) {
            return "redirect:/member/greenpost_login.do";
        }
        return "/WEB-INF/views/board/greentalk_post";
    }

    @GetMapping("/api/check-login")
    @ResponseBody
    public Map<String, Boolean> checkLogin(HttpSession session) {
        MemberDto loggedInMember = (MemberDto)session.getAttribute("loggedInMember");
        boolean loggedIn = (loggedInMember != null);
        Map<String, Boolean> response = new HashMap<>();
        response.put("loggedIn", loggedIn);
        return response;
    }

    @PostMapping("/greentalk-list-ajax.do")
    @ResponseBody
    public Map<String, Object> greentalkListAjax(@RequestParam Map<String, String> searchMap, Criteria cri) {
//        System.out.println(cri.getPageNum());
//        System.out.println(cri.getAmount());
        try {
            greentalkService = applicationContext.getBean("greentalkServiceImpl", GreentalkService.class);

//            cri.setAmount(3);
//            int pageNum = Integer.parseInt(searchMap.getOrDefault("pageNum", "1"));
//            int amount = Integer.parseInt(searchMap.getOrDefault("amount", "3"));
//            cri.setPageNum(pageNum);
//            cri.setAmount(amount);


            List<Map<String, Object>> greentalkList = new ArrayList<>();

            greentalkService.getGreenList(searchMap, cri).forEach(greentalkDto -> {
                List<GreentalkDto> greentalkFileDtoList = greentalkService.getGreenFileList(greentalkDto.getGreen_id());

                Map<String, Object> map = new HashMap<>();

                map.put("greentalkDto", greentalkDto);

                if (greentalkFileDtoList.size() > 0)
                    map.put("file", greentalkFileDtoList.get(0));

                greentalkList.add(map);
            });

            Map<String, Object> returnMap = new HashMap<>();

            returnMap.put("greentalkList", greentalkList);

            return returnMap;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;
        }
    }

    @PostMapping("/modal-ajax.do")
    @ResponseBody
    public Map<String, Object> modalAjax(GreentalkDto greentalkDto) {
//        System.out.println(greentalkDto);
        Map<String, Object> map = new HashMap<>();
        try {

            GreentalkDto greentalk = greentalkService.getGreenOne(greentalkDto.getGreen_id());
            map.put("greentalk", greentalk);

            List<GreentalkCommentDto> greenComment = greentalkService.getComment(greentalkDto.getGreen_id());
            System.out.println("================================================");
            System.out.println(greenComment);
            map.put("greenComment", greenComment);


        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return map;
    }


    @PostMapping("/greentalk-post.do")
    public String greentalk_post(GreentalkDto greentalkDto, HttpSession session, MultipartFile upload_pic, HttpServletRequest request) {
        MemberDto loggedInMember = (MemberDto)session.getAttribute("loggedInMember");
        greentalkDto.setMem_id(loggedInMember.getMem_id());
        if(upload_pic != null) {
            String attachPath = request.getServletContext().getRealPath("\\") + "\\static\\images\\storage\\";

            File directory = new File(attachPath);

            if(!directory.exists()) {
                directory.mkdirs();
            }

            File uploadFile = new File(attachPath + upload_pic.getOriginalFilename());

            if(!upload_pic.getOriginalFilename().equals("")){
                greentalkDto.setGreen_pic(upload_pic.getOriginalFilename());
            }

            try{
                upload_pic.transferTo(uploadFile);
            } catch (IOException ie) {
                System.out.println(ie.getMessage());
            }
        }
        greentalkService.writePost(greentalkDto);
        greentalkService.filePost(greentalkDto);

        return "redirect:/board/greentalk.do";
    }

    @PostMapping("/board_like_cnt.do")
    @ResponseBody
    public String board_like_control(int num, int board_id, int mem_id){
        if(num == 1 || num == -1){
            boardService.changeLike(num, board_id, mem_id);
        }
        return null;
    }

    @PostMapping("/board_bookmark_cnt.do")
    @ResponseBody
    public int board_bookmark_control(int num, int board_id, int mem_id){
        if(num == 1 || num == -1){
            boardService.changeBookmark(num, board_id, mem_id);
            return num;
        }
        return 0;
    }

    @PostMapping("/green_comment.do")
    @ResponseBody
    public GreentalkCommentDto green_comment_post(GreentalkCommentDto greentalkCommentDto, HttpSession session, HttpServletRequest httpServletRequest) {
        MemberDto loggedInMember = (MemberDto)session.getAttribute("loggedInMember");

        if (loggedInMember == null) {
            throw new RuntimeException("로그인이 필요합니다.");
        }
        greentalkCommentDto.setMem_id(loggedInMember.getMem_id());
        greentalkService.commentPost(greentalkCommentDto);

        return greentalkCommentDto;
    }

    @PostMapping("/modify_comment.do")
    @ResponseBody
    public GreentalkCommentDto modifycomment(GreentalkCommentDto greentalkCommentDto, HttpSession session, HttpServletRequest httpServletRequest) {
        MemberDto loggedInMember = (MemberDto)session.getAttribute("loggedInMember");

        System.out.println("modify");

        if (loggedInMember == null) {
            throw new RuntimeException("로그인이 필요합니다.");
        }
        greentalkCommentDto.setMem_id(loggedInMember.getMem_id());
        greentalkService.modifyComment(greentalkCommentDto);

        return greentalkCommentDto;
    }

    @PostMapping("/post_comment.do")
    public String postComment(BoardCommentDto boardCommentDto){
        String content = boardCommentDto.getComment_content();
        boardCommentDto.setComment_content(content.replace("\r\n", "<br>"));
        boardService.postComment(boardCommentDto);
        return "redirect:/board/board-detail.do?id=" + boardCommentDto.getBoard_id();
    }

    @GetMapping("/delete-comment.do")
    public String deleteComment(@RequestParam("id") int id, @RequestParam("board_id") int board_id){
        boardService.deleteComment(id);
        return "redirect:/board/board-detail.do?id=" + board_id;
    }

    @GetMapping("/board-delete.do")
    public String deleteBoard(@RequestParam("id") int id, @RequestParam("tab") int tab){
        boardService.delete(id);
        return "redirect:/board/board-main.do?tab=" + tab;
    }

    @GetMapping("board_checked.do")
    public String comment_checked(@RequestParam("board") BoardDto boardDto,
                                  @RequestParam("comment") BoardCommentDto boardCommentDto){
        boardService.comment_checked(boardCommentDto.getComment_id(),
                boardDto.getBoard_id(), boardCommentDto.getMem_id());
        return "redirect:/board/board-detail.do?id=" + boardDto.getBoard_id();
    }
}


