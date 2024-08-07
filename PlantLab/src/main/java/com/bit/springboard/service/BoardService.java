package com.bit.springboard.service;

import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.dto.GreentalkDto;
import com.bit.springboard.dto.GreentalkFileDto;
import org.springframework.web.multipart.MultipartFile;

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


}


