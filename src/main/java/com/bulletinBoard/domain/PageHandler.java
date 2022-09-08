package com.bulletinBoard.domain;

public class PageHandler {
    private SearchCondition sc;
    // page navigation size
    public final int NAV_SIZE = 10;
    // 게시물의 총 갯수
    private int totalCnt;
    // 전체 페이지의 갯수
    private int totalPage;
    // 화면에 보여줄 첫 페이지
    private int beginPage;
    // 화면에 보여줄 마지막 페이지
    private int endPage;
    // beginPage 이전을 보여줄지의 여부
    private boolean showPrev = false;
    // endPage 이후를 보여줄지의 여부
    private boolean showNext = false;
}
