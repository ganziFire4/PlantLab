package com.bit.springboard.service;

import com.bit.springboard.dto.BoardDto;

import java.util.List;

public interface BoardSevice {
    void post(BoardDto boardDto);
    void modify(BoardDto boardDto);
    void delete(int id);
    List<BoardDto> view_popular();
    List<BoardDto> view_all();
    BoardDto view_one(int id);
}
