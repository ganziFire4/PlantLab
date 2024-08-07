package com.bit.springboard.service.impl;

import com.bit.springboard.common.FileUtils;
import com.bit.springboard.dao.BoardDao;
import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.GreentalkDto;
import com.bit.springboard.dto.GreentalkFileDto;
import com.bit.springboard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
    public List<BoardDto> view_popular(int tab, String popCondition) {
        return boardDao.view_popular(tab, popCondition);
    }

    @Override
    public List<BoardDto> view_all(int tab, Map<String, Object> search, Map<String, Object> table) {
        return boardDao.view_all(tab, search, table);
    }

    @Override
    public BoardDto view_one(int id) {
        return boardDao.view_one(id);
    }

    @Override
    public List<BoardDto> getBoard(int id) {
        List<BoardDto> boardDtos = boardDao.getBoard(id);
        return boardDao.getBoard(id);
    }

    @Override
    public void update_view_cnt(int id) {
        boardDao.update_view_cnt(id);
        System.out.println(boardDao.view_one(id));
    }

    @Override
    public int getBoardTotal(int tab, Map<String, Object> search) {
        return boardDao.getBoardTotal(tab, search);
    }

    @Override
    public int writePost(GreentalkDto greentalkDto) {
        boardDao.writePost(greentalkDto);
        return greentalkDto.getGreen_id();
    }

    @Override
    public void filePost(GreentalkDto greentalkDto) {
        boardDao.filePost(greentalkDto);
    }

}
