package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class ProductDto {
    private int product_id;
    private String brand = ""; // 기본값 설정
    private String product_name = ""; // 기본값 설정
    private int price = 0; // 기본값 설정
    private double discount = 0.0; // 기본값 설정
    private double rate = 0.0; // 기본값 설정
    private String color = ""; // 기본값 설정
    private boolean is_light = false; // 기본값 설정
    private String base_type = ""; // 기본값 설정
    private String size = ""; // 기본값 설정
    private String tag = ""; // 기본값 설정
    private int view_count = 0; // 기본값 설정
    private LocalDateTime sell_start;
    private LocalDateTime sell_end;
    private boolean product_status = true; // 기본값 설정
    private LocalDateTime created_at = LocalDateTime.now(); // 기본값 설정
    private LocalDateTime updated_at = LocalDateTime.now(); // 기본값 설정

    // Getters and setters
    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public boolean isIs_light() {
        return is_light;
    }

    public void setIs_light(boolean is_light) {
        this.is_light = is_light;
    }

    public String getBase_type() {
        return base_type;
    }

    public void setBase_type(String base_type) {
        this.base_type = base_type;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public int getView_count() {
        return view_count;
    }

    public void setView_count(int view_count) {
        this.view_count = view_count;
    }

    public LocalDateTime getSell_start() {
        return sell_start;
    }

    public void setSell_start(LocalDateTime sell_start) {
        this.sell_start = sell_start;
    }

    public LocalDateTime getSell_end() {
        return sell_end;
    }

    public void setSell_end(LocalDateTime sell_end) {
        this.sell_end = sell_end;
    }

    public boolean isProduct_status() {
        return product_status;
    }

    public void setProduct_status(boolean product_status) {
        this.product_status = product_status;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public LocalDateTime getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(LocalDateTime updated_at) {
        this.updated_at = updated_at;
    }

}
