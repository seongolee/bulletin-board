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

    public PageHandler(SearchCondition sc, int totalCnt) {
        this.sc = sc;
        this.totalCnt = totalCnt;

        getPaging(sc, totalCnt);
    }

    private void getPaging(SearchCondition sc, int totalCnt) {
        // 페이지 갯수
        this.totalPage = totalCnt / sc.getPageSize() + (totalCnt % sc.getPageSize()==0 ? 0 : 1);
        // 현재 페이지 : 총 페이지수 보다 같거나 적게
        this.sc.setPage(Math.min(sc.getPage(), totalPage));
        // nav 시작 번호 : 15 -> 11, 20 -> 11 처럼 10단위는 -1해야 정확한 nav 위치를 찍어 줄 수 있다.
        this.beginPage = (this.sc.getPage() - 1) / NAV_SIZE * NAV_SIZE + 1;
        // nav 마지막 번호 : begin 페이지가 각 단위 1이기때문에 nav_size - 1 해준다.
        this.endPage = Math.min(beginPage + NAV_SIZE - 1, totalPage);
        // nav 첫번째 번호가 1인지 확인
        this.showPrev = beginPage!=1;
        // nav 마지막 번호가 총 페이지 수 인지 확인
        this.showNext = endPage != totalPage;
    }

    public String getQueryString(){
        return sc.getQueryString();
    }

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
