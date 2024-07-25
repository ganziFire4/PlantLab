package com.bit.springboard.service.impl;

import com.bit.springboard.dao.BoardDao;
import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {
    private BoardDao boardDao;

    @Autowired
    public BoardServiceImpl(BoardDao boardDao){
        this.boardDao = boardDao;
    }

    @Override
    public void post(BoardDto boardDto) {
        boardDao.post(boardDto);
    }

    @Override
    public void modify(BoardDto boardDto) {
        boardDao.modify(boardDto);
    }

    @Override
    public void delete(int id) {
        boardDao.delete(id);
    }

    @Override
    public List<BoardDto> view_popular(int tab) {
        return boardDao.view_popular(tab);
    }

    @Override
    public List<BoardDto> view_all(int tab) {
        return boardDao.view_all(tab);
    }

    @Override
    public BoardDto view_one(int id) {
        return boardDao.view_one(id);
    }
}
