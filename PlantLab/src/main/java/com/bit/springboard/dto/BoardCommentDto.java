package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class BoardCommentDto {
    private int comment_id;
    private int board_id;
    private int mem_id;
    private String comment_content;
    private boolean is_checked;
    private LocalDateTime comment_reg;
    private LocalDateTime comment_mod;
    private String mem_nickname;
    private String mem_pic;

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getBoard_id() {
        return board_id;
    }

    public void setBoard_id(int board_id) {
        this.board_id = board_id;
    }

    public int getMem_id() {
        return mem_id;
    }

    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public boolean isIs_checked() {
        return is_checked;
    }

    public void setIs_checked(boolean is_checked) {
        this.is_checked = is_checked;
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
        return "BoardCommentDto{" +
                "comment_id=" + comment_id +
                ", board_id=" + board_id +
                ", mem_id=" + mem_id +
                ", comment_content='" + comment_content + '\'' +
                ", is_checked=" + is_checked +
                ", comment_reg=" + comment_reg +
                ", comment_mod=" + comment_mod +
                ", mem_nickname='" + mem_nickname + '\'' +
                ", mem_pic='" + mem_pic + '\'' +
                '}';
    }
}
