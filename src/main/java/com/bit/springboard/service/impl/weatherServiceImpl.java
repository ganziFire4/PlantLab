package com.bit.springboard.service.impl;

import com.bit.springboard.dao.WeatherDao;
import com.bit.springboard.dto.WeatherDto;
import com.bit.springboard.service.WeatherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class weatherServiceImpl implements WeatherService {
    private WeatherDao weatherDao;

    @Autowired
    public void updateInfo(WeatherDao weatherDao) {
        this.weatherDao = weatherDao;
    }

    @Override
    public void updateInfo(WeatherDto weatherDto) {
        weatherDao.updateInfo(weatherDto);
    }
}
