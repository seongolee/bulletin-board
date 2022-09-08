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
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/boardList.css'/>">
</head>
<body>
<div id="menu">
  <ul>
    <li id="logo">Portfolio</li>
    <li><a href="<c:url value='/'/>">Home</a></li>
    <li><a href="<c:url value='/board/list'/>">Board</a></li>
    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
    <li><a href=""><i class="fas fa-search small"></i></a></li>
  </ul>
</div>
<div style="text-align:center">
  <div class="board-container">
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

    <table>
      <tr>
        <th class="no">번호</th>
        <th class="title">제목</th>
        <th class="writer">이름</th>
        <th class="regdate">등록일</th>
        <th class="viewcnt">조회수</th>
      </tr>
      <c:forEach var="boardDto" items="${boardDtoList}">
        <tr>
          <td class="no">${boardDto.bno}</td>
          <td class="title">${boardDto.title}</td>
<%--          <td class="title"><a href="<c:url value="/board/read${ph.sc.queryString}&bno=${boardDto.bno}"/>">${boardDto.title}</a></td>--%>
          <td class="writer">${boardDto.writer}</td>
          <td class="regdate"><fmt:formatDate value="${boardDto.reg_date}" pattern="yyyy-MM-dd HH:mm" type="both"/></td>
          <td class="viewcnt">${boardDto.view_cnt}</td>
        </tr>
      </c:forEach>
    </table>
<%--    <br>--%>
<%--    <div class="paging-container">--%>
<%--      <div class="paging">--%>
<%--        <c:if test="${totalCnt==null || totalCnt==0}">--%>
<%--          <div> 게시물이 없습니다. </div>--%>
<%--        </c:if>--%>
<%--        <c:if test="${totalCnt!=null && totalCnt!=0}">--%>
<%--          <c:if test="${ph.showPrev}">--%>
<%--            <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>--%>
<%--          </c:if>--%>
<%--          <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">--%>
<%--            <a class="page ${i==ph.sc.page? "paging-active" : ""}" href="<c:url value="/board/list${ph.sc.getQueryString(i)}"/>">${i}</a>--%>
<%--          </c:forEach>--%>
<%--          <c:if test="${ph.showNext}">--%>
<%--            <a class="page" href="<c:url value="/board/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>--%>
<%--          </c:if>--%>
<%--        </c:if>--%>
<%--      </div>--%>
<%--    </div>--%>
  </div>
</div>
</body>
</html>