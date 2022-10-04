<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<%-- 세션에 저장된 아이디 쓸 수 있게 저장 --%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'logout'}"/>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시판</title>
  <link rel="stylesheet" href="<c:url value='/css/boardList.css'/>">
  <!-- CSS only -->
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script src="<c:url value='/js/boardList.js'/>"></script>
</head>
<body>
<div class="px-3 py-2 text-bg-dark">
  <div class="container">
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      <!--           <a href="/rentacar" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none"> -->
      <a href="<c:url value='/'/>" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
        <div>Portfolio</div>
      </a>

      <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
        <li>
          <a href="<c:url value='/'/>" class="nav-link text-white">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi d-block mx-auto mb-1" viewBox="0 0 16 16">
              <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
              <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
            </svg>
            Home
          </a>
        </li>
        <li>
          <a href="<c:url value='/board/list'/>" class="nav-link text-secondary">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi d-block mx-auto mb-1" viewBox="0 0 16 16">
              <path d="M8 4a.5.5 0 0 1 .5.5V6a.5.5 0 0 1-1 0V4.5A.5.5 0 0 1 8 4zM3.732 5.732a.5.5 0 0 1 .707 0l.915.914a.5.5 0 1 1-.708.708l-.914-.915a.5.5 0 0 1 0-.707zM2 10a.5.5 0 0 1 .5-.5h1.586a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 10zm9.5 0a.5.5 0 0 1 .5-.5h1.5a.5.5 0 0 1 0 1H12a.5.5 0 0 1-.5-.5zm.754-4.246a.389.389 0 0 0-.527-.02L7.547 9.31a.91.91 0 1 0 1.302 1.258l3.434-4.297a.389.389 0 0 0-.029-.518z"/>
              <path fill-rule="evenodd" d="M0 10a8 8 0 1 1 15.547 2.661c-.442 1.253-1.845 1.602-2.932 1.25C11.309 13.488 9.475 13 8 13c-1.474 0-3.31.488-4.615.911-1.087.352-2.49.003-2.932-1.25A7.988 7.988 0 0 1 0 10zm8-7a7 7 0 0 0-6.603 9.329c.203.575.923.876 1.68.63C4.397 12.533 6.358 12 8 12s3.604.532 4.923.96c.757.245 1.477-.056 1.68-.631A7 7 0 0 0 8 3z"/>
            </svg>
            Board
          </a>
        </li>
        <li>
          <a href="#" class="nav-link text-white">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi d-block mx-auto mb-1" viewBox="0 0 16 16">
              <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"/>
            </svg>
            Orders
          </a>
        </li>
        <li>
          <a href="#" class="nav-link text-white">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi d-block mx-auto mb-1" viewBox="0 0 16 16">
              <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5l2.404.961L10.404 2l-2.218-.887zm3.564 1.426L5.596 5 8 5.961 14.154 3.5l-2.404-.961zm3.25 1.7-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
            </svg>
            Products
          </a>
        </li>
        <li>
          <a href="#" class="nav-link text-white">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi d-block mx-auto mb-1" viewBox="0 0 16 16">
              <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
              <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
            </svg>
            Customers
          </a>
        </li>
      </ul>
    </div>
  </div>
</div>

<%-- body --%>
<div class="container">
  <div class="row">
    <div class="col-xl-3 col-md-6">
      <div class="card bg-pattern">
        <div class="card-body">
          <div class="float-right">
            <i class="fa fa-archive text-primary h4 ml-3"></i>
          </div>
          <h5 class="font-size-20 mt-0 pt-1">${totalCnt}</h5>
          <p class="text-muted mb-0">Total Title</p>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card bg-pattern">
        <div class="card-body">
          <div class="float-right">
            <i class="fa fa-th text-primary h4 ml-3"></i>
          </div>
          <h5 class="font-size-20 mt-0 pt-1">0</h5>
          <p class="text-muted mb-0">temp</p>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card bg-pattern">
        <div class="card-body">
          <div class="float-right">
            <i class="fa fa-file text-primary h4 ml-3"></i>
          </div>
          <h5 class="font-size-20 mt-0 pt-1">0</h5>
          <p class="text-muted mb-0">temp</p>
        </div>
      </div>
    </div>
    <div class="col-xl-3 col-md-6">
      <div class="card">
        <div class="card-body">
          <form>
            <div class="form-group mb-0">
              <label>Search</label>
              <div class="input-group mb-0">
                <input type="text" class="form-control" name="keyword" placeholder="Search..." aria-describedby="project-search-addon" />
                <div class="input-group-append">
                  <button class="btn btn-danger" type="submit" id="project-search-addon"><i class="fa fa-search search-icon font-12"></i></button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- end row -->

  <div class="row">
    <div class="col-lg-12">
      <div class="card">
        <div class="card-body">
          <div class="table-responsive project-list">
            <table class="table project-table table-centered table-nowrap">
              <thead>
              <tr>
                <th scope="col">#</th>
                <td class="col-title">제목</td>
                <td class="col-name">이름</td>
                <td class="col-reg-date">등록일</td>
                <td class="col-view-cnt">조회수</td>
                <td class="col-action">Action</td>
              </tr>
              </thead>
              <tbody>
              <c:forEach var="boardDto" items="${boardDtoList}" varStatus="status">
                <tr>
                  <th scope="row">${boardDto.bno}</th>
                  <td class="col-title poster-title"><a href="#" onclick="posterTitle(this)" tabindex="">${boardDto.title}</a></td>
                  <td class="col-name">${boardDto.writer}</td>
                  <td class="col-reg-date"><fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-mm-dd HH:mm"/> </td>
                  <td class="col-action">${boardDto.view_cnt}</td>
                  <td>
                    <c:if test="${boardDto.writer eq loginId}">
                      <div class="action col-action">
                        <a href="<c:url value='/board/modify'/>" class="text-success mr-4" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"> <i class="fa fa-pencil h5 m-0"></i></a>
                        <a href="#" onclick="removePoster(this)" class="text-danger" data-bno="${boardDto.bno}" data-toggle="tooltip" data-placement="top" title="" data-original-title="Close"> <i class="fa fa-remove h5 m-0"></i></a>
                      </div>
                    </c:if>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </div>
          <!-- end project-list -->
          <c:if test="${totalCnt!=null && totalCnt!=0}">
            <div class="pt-3">
              <div class="btn-wrapper">
                <button type="button" onclick="location.href='/board/write'" class="btn btn-dark">글쓰기</button>
              </div>
              <div class="page-handler-wrapper">
                <ul class="pagination justify-content-end mb-0">
                  <li class="page-item ${ph.showPrev ? '' : 'disabled'}">
                    <a class="page-link" href="<c:url value='/board/list${ph.sc.getQueryString(ph.beginPage-1)}'/>">Previous</a>
                  </li>
                  <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
                    <li class="page-item ${i==ph.sc.page ? 'active' : ''}"><a class="page-link" href="<c:url value='/board/list${ph.sc.getQueryString(i)}'/>">${i}</a></li>
                  </c:forEach>
                  <li class="page-item ${ph.showNext ? '' : 'disabled'}">
                    <a class="page-link" href="<c:url value='/board/list${ph.sc.getQueryString(ph.endPage + 1)}'/>">Next</a>
                  </li>
                </ul>
              </div>
            </div>
          </c:if>

        </div>
      </div>
    </div>
  </div>
  <!-- end row -->
</div>
<%--<div style="text-align:center">--%>
<%--  <div class="board-container">--%>
<%--    <div class="search-container">--%>
<%--      <form action="<c:url value="/board/list"/>" class="search-form" method="get">--%>
<%--        <select class="search-option" name="option">--%>
<%--          <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>제목+내용</option>--%>
<%--          <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>제목만</option>--%>
<%--          <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>작성자</option>--%>
<%--        </select>--%>

<%--        <input type="text" name="keyword" class="search-input" type="text" value="${ph.sc.keyword}" placeholder="검색어를 입력해주세요">--%>
<%--        <input type="submit" class="search-button" value="검색">--%>
<%--      </form>--%>
<%--      <button id="writeBtn" class="btn-write" onclick="location.href='<c:url value="/board/write"/>'"><i class="fa fa-pencil"></i> 글쓰기</button>--%>
<%--    </div>--%>
</body>
</html>