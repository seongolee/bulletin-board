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

    public SearchCondition getSc() {
        return sc;
    }

    public void setSc(SearchCondition sc) {
        this.sc = sc;
    }

    public int getTotalCnt() {
        return totalCnt;
    }

    public void setTotalCnt(int totalCnt) {
        this.totalCnt = totalCnt;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getBeginPage() {
        return beginPage;
    }

    public void setBeginPage(int beginPage) {
        this.beginPage = beginPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isShowPrev() {
        return showPrev;
    }

    public void setShowPrev(boolean showPrev) {
        this.showPrev = showPrev;
    }

    public boolean isShowNext() {
        return showNext;
    }

    public void setShowNext(boolean showNext) {
        this.showNext = showNext;
    }

    public int getNAV_SIZE() {
        return NAV_SIZE;
    }
}
