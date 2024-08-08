package com.bit.springboard.dto;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ProductDto {
    private int product_id;
    private String brand = "";
    private String product_name = "";
    private int price = 0;
    private double discount = 0.0;
    private double rate = 0.0;
    private String color = "";
    private boolean is_light = false;
    private String base_type = "";
    private String size = "";
    private String tag = "";
    private int view_count = 0;
    private LocalDateTime sell_start;
    private LocalDateTime sell_end;
    private boolean product_status = true;
    private LocalDateTime created_at = LocalDateTime.now();
    private LocalDateTime updated_at = LocalDateTime.now();
    private List<PicDto> pics = new ArrayList<>();
    private boolean is_sold_out = false; // 추가된 필드

    // 기본 생성자
    public ProductDto() {
        this.pics = new ArrayList<>();
    }

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

    public List<PicDto> getPics() {
        return pics;
    }

    public void setPics(List<PicDto> pics) {
        this.pics = pics;
    }

    public boolean isIs_sold_out() {
        return is_sold_out;
    }

    public void setIs_sold_out(boolean is_sold_out) {
        this.is_sold_out = is_sold_out;
    }
}
