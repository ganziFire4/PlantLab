package com.bit.springboard.controller;

import com.bit.springboard.dto.WeatherDto;
import com.bit.springboard.service.WeatherService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WeatherController {
    private WeatherService weatherService;

    @Autowired
    public WeatherController(WeatherService weatherService) {
        this.weatherService = weatherService;
    }

    @PostMapping("/post-weather.do")
    public String postWeather(WeatherDto weatherDto, Model model, HttpSession session){
        weatherService.updateInfo(weatherDto);

        session.setAttribute("weather", weatherDto);
        return "index";
    }
}
