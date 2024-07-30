package com.bit.springboard.dto;

import java.time.LocalDateTime;

public class GreentalkDto {
    private int id;
    private int mem_id;
    private String content;
    private LocalDateTime reg;
    private LocalDateTime mod;
    private String tag;
    private int like_cnt;
    private int bookmark_cnt;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMem_id() {
        return mem_id;
    }

    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public LocalDateTime getReg() {
        return reg;
    }

    public void setReg(LocalDateTime reg) {
        this.reg = reg;
    }

    public LocalDateTime getMod() {
        return mod;
    }

    public void setMod(LocalDateTime mod) {
        this.mod = mod;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public int getLike_cnt() {
        return like_cnt;
    }

    public void setLike_cnt(int like_cnt) {
        this.like_cnt = like_cnt;
    }

    public int getBookmark_cnt() {
        return bookmark_cnt;
    }

    public void setBookmark_cnt(int bookmark_cnt) {
        this.bookmark_cnt = bookmark_cnt;
    }

    @Override
    public String toString() {
        return "GreentalkDto{" +
                "id=" + id +
                ", mem_id=" + mem_id +
                ", content='" + content + '\'' +
                ", reg=" + reg +
                ", mod=" + mod +
                ", tag='" + tag + '\'' +
                ", like_cnt=" + like_cnt +
                ", bookmark_cnt=" + bookmark_cnt +
                '}';
    }
}
