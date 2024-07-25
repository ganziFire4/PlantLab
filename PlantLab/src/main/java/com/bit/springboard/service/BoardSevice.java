package com.bit.springboard.service;

import com.bit.springboard.dto.BoardDto;

public interface BoardSevice {
    void post(BoardDto boardDto);
    void modify(BoardDto boardDto);
    void delete(BoardDto boardDto);
    void view_popular();
    void view_all();
    void view_one(BoardDto boardDto);
}
