package com.bit.springboard.dto;

public class PicDto {
    private int pic_id;
    private int product_id;
    private String file_name = ""; // 기본값 설정
    private boolean is_main = false; // 기본값 설정

    // Getters and setters
    public int getPic_id() {
        return pic_id;
    }

    public void setPic_id(int pic_id) {
        this.pic_id = pic_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getFile_name() {
        return null;
    }

    public void set(String file_name) {
        this.file_name = file_name;
    }

    public boolean isIs_main() {
        return is_main;
    }

    public void setIs_main(boolean is_main) {
        this.is_main = is_main;
    }

    public void setFile_name(String savedFileName) {
    }
}
