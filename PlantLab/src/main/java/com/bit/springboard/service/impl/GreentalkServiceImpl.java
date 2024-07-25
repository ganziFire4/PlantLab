package com.bit.springboard.service.impl;

import com.bit.springboard.dao.GreentalkDao;
import com.bit.springboard.dto.GreentalkDto;
import com.bit.springboard.service.GreentalkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GreentalkServiceImpl implements GreentalkService {
    private GreentalkDao greentalkDao;

    @Autowired
    public GreentalkServiceImpl(GreentalkDao greentalkDao) {
        this.greentalkDao = greentalkDao;
    }

    @Override
    public void green_post(GreentalkDto greentalkDto) {
        greentalkDao.green_post(greentalkDto);
    }

    @Override
    public void green_modify(GreentalkDto greentalkDto) {
        greentalkDao.green_modify(greentalkDto);
    }

    @Override
    public void green_delete(int id) {
        greentalkDao.delete(id);
    }

    @Override
    public void updateCnt(int id) {
        greentalkDao.updateCnt(id);
    }

    @Override
    public List<GreentalkDto> green_getGreenList() {
        return List.of();
    }

    @Override
    public List<GreentalkDto> green_getGreenFileList(int id) {
        return List.of();
    }

    @Override
    public GreentalkDto getGreen(int id) {
        return null;
    }
}
