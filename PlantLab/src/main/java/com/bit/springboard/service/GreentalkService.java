package com.bit.springboard.service;

import com.bit.springboard.dto.GreentalkDto;

import java.util.List;

public interface GreentalkService {
    void green_post(GreentalkDto greentalkDto);
    void green_modify(GreentalkDto greentalkDto);
    void green_delete(int id);
    void updateCnt(int id);
    List<GreentalkDto> green_getGreenList();
    List<GreentalkDto> green_getGreenFileList(int id);
    GreentalkDto getGreen(int id);
}
