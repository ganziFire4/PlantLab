package com.bit.springboard.dto;

public class MemberDto {
    private int mem_id;
    private String login_id;
    private String password;
    private String mem_name;
    private String mem_nickname;
    private String mem_email;
    private String mem_addr;
    private String mem_pic;
    private int checkCnt;
    private String mem_zipcode;
    private String mem_addr_detail;
    private int board_like_cnt;
    private int board_bookmark_cnt;
    private int green_like_cnt;
    private int green_bookmark_cnt;

    public int getMem_id() {
        return mem_id;
    }

    public void setMem_id(int mem_id) {
        this.mem_id = mem_id;
    }

    public String getLogin_id() {
        return login_id;
    }

    public void setLogin_id(String login_id) {
        this.login_id = login_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMem_name() {
        return mem_name;
    }

    public void setMem_name(String mem_name) {
        this.mem_name = mem_name;
    }

    public String getMem_nickname() {
        return mem_nickname;
    }

    public void setMem_nickname(String mem_nickname) {
        this.mem_nickname = mem_nickname;
    }

    public String getMem_email() {
        return mem_email;
    }

    public void setMem_email(String mem_email) {
        this.mem_email = mem_email;
    }

    public String getMem_addr() {
        return mem_addr;
    }

    public void setMem_addr(String mem_addr) {
        this.mem_addr = mem_addr;
    }

    public String getMem_pic() {
        return mem_pic;
    }

    public void setMem_pic(String mem_pic) {
        this.mem_pic = mem_pic;
    }

    public int getCheckCnt() {
        return checkCnt;
    }

    public void setCheckCnt(int checkCnt) {
        this.checkCnt = checkCnt;
    }

    public String getMem_zipcode() {
        return mem_zipcode;
    }

    public void setMem_zipcode(String mem_zipcode) {
        this.mem_zipcode = mem_zipcode;
    }

    public String getMem_addr_detail() {
        return mem_addr_detail;
    }

    public void setMem_addr_detail(String mem_addr_detail) {
        this.mem_addr_detail = mem_addr_detail;
    }

    public int getBoard_like_cnt() {
        return board_like_cnt;
    }

    public void setBoard_like_cnt(int board_like_cnt) {
        this.board_like_cnt = board_like_cnt;
    }

    public int getBoard_bookmark_cnt() {
        return board_bookmark_cnt;
    }

    public void setBoard_bookmark_cnt(int board_bookmark_cnt) {
        this.board_bookmark_cnt = board_bookmark_cnt;
    }

    public int getGreen_like_cnt() {
        return green_like_cnt;
    }

    public void setGreen_like_cnt(int green_like_cnt) {
        this.green_like_cnt = green_like_cnt;
    }

    public int getGreen_bookmark_cnt() {
        return green_bookmark_cnt;
    }

    public void setGreen_bookmark_cnt(int green_bookmark_cnt) {
        this.green_bookmark_cnt = green_bookmark_cnt;
    }

    @Override
    public String toString() {
        return "MemberDto{" +
                "mem_id=" + mem_id +
                ", login_id='" + login_id + '\'' +
                ", password='" + password + '\'' +
                ", mem_name='" + mem_name + '\'' +
                ", mem_nickname='" + mem_nickname + '\'' +
                ", mem_email='" + mem_email + '\'' +
                ", mem_addr='" + mem_addr + '\'' +
                ", mem_pic='" + mem_pic + '\'' +
                ", checkCnt=" + checkCnt +
                ", mem_zipcode='" + mem_zipcode + '\'' +
                ", mem_addr_detail='" + mem_addr_detail + '\'' +
                ", board_like_cnt=" + board_like_cnt +
                ", board_bookmark_cnt=" + board_bookmark_cnt +
                ", green_like_cnt=" + green_like_cnt +
                ", green_bookmark_cnt=" + green_bookmark_cnt +
                '}';
    }
}


