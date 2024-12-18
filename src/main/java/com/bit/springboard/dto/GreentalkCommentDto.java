package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class GreentalkCommentDto {
    private int green_id;
    private int green_comment_id;
    private String comment_content;
    private LocalDateTime comment_reg;
    private LocalDateTime comment_mod;
    private String mem_nickname;
    private String mem_pic;
    private int mem_id;

    public int getMem_id() {
        return mem_id;
    }

    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    }

    public int getGreen_id() {
        return green_id;
    }

    public void setGreen_id(int green_id) {
        this.green_id = green_id;
    }

    public int getGreen_comment_id() {
        return green_comment_id;
    }

    public void setGreen_comment_id(int green_comment_id) {
        this.green_comment_id = green_comment_id;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public LocalDateTime getComment_reg() {
        return comment_reg;
    }

    public void setComment_reg(LocalDateTime comment_reg) {
        this.comment_reg = comment_reg;
    }

    public LocalDateTime getComment_mod() {
        return comment_mod;
    }

    public void setComment_mod(LocalDateTime comment_mod) {
        this.comment_mod = comment_mod;
    }

    public String getMem_nickname() {
        return mem_nickname;
    }

    public void setMem_nickname(String mem_nickname) {
        this.mem_nickname = mem_nickname;
    }

    public String getMem_pic() {
        return mem_pic;
    }

    public void setMem_pic(String mem_pic) {
        this.mem_pic = mem_pic;
    }


    @Override
    public String toString() {
        return "GreentalkCommentDto{" +
                "green_id=" + green_id +
                ", green_comment_id=" + green_comment_id +
                ", comment_content='" + comment_content + '\'' +
                ", comment_reg=" + comment_reg +
                ", comment_mod=" + comment_mod +
                ", mem_nickname='" + mem_nickname + '\'' +
                ", mem_pic='" + mem_pic + '\'' +
                '}';
    }
}
