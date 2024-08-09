package com.bit.springboard.service;

import com.bit.springboard.dto.BoardCommentDto;
import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.Criteria;

import java.util.List;
import java.util.Map;

public interface BoardService {
    void post(BoardDto boardDto);
    void modify(BoardDto boardDto);
    void delete(int id);
    List<BoardDto> view_popular(int tab, String popCondition);
    List<BoardDto> view_all(int tab, Map<String, String> search, Map<String, String> table, Criteria cri);
    BoardDto view_one(int id);
    List<BoardDto> getBoard(int id);
    void update_view_cnt(int id);
    int getBoardTotal(int tab, Map<String, String> search);
    void changeLike(int num, int mem_id, int board_id);
    void changeBookmark(int num, int mem_id, int board_id);
    void postComment(BoardCommentDto boardCommentDto);
    void deleteComment(int id);
    List<BoardCommentDto> showCommentList(int board_id);
    void comment_checked(int id, int board_id, int mem_id);
}


