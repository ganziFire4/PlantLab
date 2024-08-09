package com.bit.springboard.dao;

import com.bit.springboard.dto.WeatherDto;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WeatherDao {
    private SqlSessionTemplate mybatis;

    @Autowired
    public WeatherDao(SqlSessionTemplate mybatis) {
        this.mybatis = mybatis;
    }

    public void updateInfo(WeatherDto weatherDto){
        mybatis.update("WeatherDao.updateInfo", weatherDto);
    }
}
