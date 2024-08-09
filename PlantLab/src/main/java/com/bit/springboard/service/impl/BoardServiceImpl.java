package com.bit.springboard.service.impl;

import com.bit.springboard.dao.BoardDao;
import com.bit.springboard.dto.BoardCommentDto;
import com.bit.springboard.dto.BoardDto;
import com.bit.springboard.dto.Criteria;
import com.bit.springboard.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
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
    public List<BoardDto> view_all(int tab, Map<String, String> search, Map<String, String> table, Criteria cri) {
        cri.setStartNum((cri.getPageNum() - 1) * cri.getAmount());
        return boardDao.view_all(tab, search, table, cri);
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
    public int getBoardTotal(int tab, Map<String, String> search) {
        return boardDao.getBoardTotal(tab, search);
    }

    @Override
    public void changeLike(int num, int mem_id, int board_id) {
        Map<String, Integer> paramMap = new HashMap<>();

        paramMap.put("board_id", board_id);
        paramMap.put("mem_id", mem_id);

        if(num == 1){
            boardDao.addLike(paramMap);
        } else {
            boardDao.deleteLike(paramMap);
        }
    }

    @Override
    public void changeBookmark(int num, int mem_id, int board_id) {
        Map<String, Integer> paramMap = new HashMap<>();

        paramMap.put("board_id", board_id);
        paramMap.put("mem_id", mem_id);

        if(num == 1){
            boardDao.addBookmark(paramMap);
        } else {
            boardDao.deleteBookmark(paramMap);
        }
    }

    @Override
    public void postComment(BoardCommentDto boardCommentDto) {
        boardDao.postComment(boardCommentDto);
    }

    @Override
    public void deleteComment(int id) {
        boardDao.deleteComment(id);
    }

    @Override
    public List<BoardCommentDto> showCommentList(int board_id) {
        return boardDao.showCommentList(board_id);
    }


}
