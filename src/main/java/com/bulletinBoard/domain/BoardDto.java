package com.bulletinBoard.domain;

public class BoardDto {
    // 게시물 번호
    private Integer bno;
    // 게시물 제목
    private String title;
    // 게시물 내용
    private String content;
    // 작성자
    private String writer;
    // 조회수
    private int view_cnt;
    // 댓글수
    private int comment_cnt;

    public Integer getBno() {
        return bno;
    }

    public void setBno(Integer bno) {
        this.bno = bno;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public int getView_cnt() {
        return view_cnt;
    }

    public void setView_cnt(int view_cnt) {
        this.view_cnt = view_cnt;
    }

    public int getComment_cnt() {
        return comment_cnt;
    }

    public void setComment_cnt(int comment_cnt) {
        this.comment_cnt = comment_cnt;
    }

    public BoardDto() {}

    public BoardDto(Integer bno, String title, String content, String writer, int view_cnt, int comment_cnt) {
        this.bno = bno;
        this.title = title;
        this.content = content;
        this.writer = writer;
        this.view_cnt = view_cnt;
        this.comment_cnt = comment_cnt;
    }
}