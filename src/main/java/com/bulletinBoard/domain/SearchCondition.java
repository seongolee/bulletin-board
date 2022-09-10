package com.bulletinBoard.domain;

import org.springframework.web.util.UriComponentsBuilder;

import static java.lang.Math.*;
import static java.util.Objects.requireNonNullElse;

public class SearchCondition {
    // 현재 페이지
    private Integer page = 1;
    // 보여줄 페이지 크기
    private Integer pageSize = DEFAULT_PAGE_SIZE;

    public static final int MIN_PAGE_SIZE = 5;
    public static final int DEFAULT_PAGE_SIZE = 10;
    public static final int MAX_PAGE_SIZE = 30;

    // 생성자
    public SearchCondition() {}

    public SearchCondition(Integer page, Integer pageSize){
        this.page = page;
        this.pageSize = pageSize;
    }

    // 예외로 page 값이 안들어올 수 있기떄문에 Overloading 처리
    public String getQueryString() {
        return getQueryString(page);
    }
    public String getQueryString(Integer page) {
        // ?page=1&pageSize=10
        return UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize", pageSize)
                .build().toString();
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        // page값이 Null인경우 들어올 경우 1로 처리
        this.page = requireNonNullElse(page, 1);
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        // pageSize값이 Null인경우 DEFAULT_PAGE_SIZE 값으로 처리
        this.pageSize = requireNonNullElse(pageSize, DEFAULT_PAGE_SIZE);
        // MIN_PAGE_SIZE, MAX_PAGE_SIZE 범위 안에 값만 유효하게 처리
        this.pageSize = max(MIN_PAGE_SIZE, min(this.pageSize, MAX_PAGE_SIZE));
    }

    public Integer getOffset() {
        return (page-1)*pageSize;
    }

    @Override
    public String toString() {
        return "SearchCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                '}';
    }
}
