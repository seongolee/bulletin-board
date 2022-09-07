<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <li><a href="<c:url value='/login/login'/>">login</a></li>
    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
    <li><a href=""><i class="fas fa-search small"></i></a></li>
  </ul>
</div>
<div style="text-align:center">
  <table>
    <tr>
      <th class="no">번호</th>
      <th class="title">제목</th>
      <th class="writer">작성자</th>
      <th class="regdate">등록일</th>
      <th class="viewcnt">조회수</th>
    </tr>
    <c:forEach var="boardDto" items="${list}">
      <tr>
        <td class="no">${boardDto.bno}</td>
        <td class="title">${boardDto.title}</td>
        <td class="writer">${boardDto.writer}</td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>