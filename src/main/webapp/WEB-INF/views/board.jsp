<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%-- default 값이기 때문에 생략해도 된다.--%>
<%@ page session="true"%>
<c:set var="loginId" value="${sessionScope.id}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'logout'}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>게시판 글쓰기</title>
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/board.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
</head>
<body>
<div id="menu">
  <ul>
    <li id="logo"><a href="<c:url value='/'/>">Portfolio</a></li>
    <li><a href="<c:url value='/'/>">Home</a></li>
    <li><a href="<c:url value='/board/list'/>">Board</a></li>
    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
    <li><a href=""><i class="fa fa-search"></i></a></li>
  </ul>
</div>
<script>
  let msg = "${msg}";
  if(msg=="MOD_OK") alert("게시물 수정 성공");
  if(msg=="WRT_ERR") alert("게시물 등록에 실패하였습니다. 다시 시도해 주세요.");
  if(msg=="MOD_ERR") alert("게시물 수정에 실패하였습니다. 다시 시도해 주세요.");
</script>
<div class="container">
  <h2 class="writing-header">게시판 ${mode=="new" ? "글쓰기" : "읽기"}</h2>
  <form id="form" class="frm" action="" method="post">
    <input type="hidden" name="bno" value="${boardDto.bno}">

    <input name="title" type="text" value="${boardDto.title}" placeholder="  제목을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>            <br>
    <textarea name="content" rows="20" placeholder=" 내용을 입력해 주세요." ${mode=="new" ? "" : "readonly='readonly'"}>${boardDto.content}</textarea>      <br>


    <c:if test="${mode eq 'new'}">
      <button type="button" id="writeBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 등록</button>
    </c:if>
    <c:if test="${mode ne 'new'}">
      <button type="button" id="writeNewBtn" class="btn btn-write"><i class="fa fa-pencil"></i> 글쓰기</button>
    </c:if>
    <%-- board/write 를 로그인 안하고 직접 들어오면 둘다 공백이라 수정 삭제가 표시됨. 예외처리 해야함. --%>
    <c:if test="${boardDto.writer eq loginId}">
      <button type="button" id="modifyBtn" class="btn btn-modify"><i class="fa fa-edit"></i> 수정</button>
      <button type="button" id="removeBtn" class="btn btn-remove"><i class="fa fa-trash"></i> 삭제</button>
    </c:if>
    <button type="button" id="listBtn" class="btn btn-list"><i class="fa fa-bars"></i> 목록</button>
  </form>
</div>
<script>
  $(document).ready(function(){
    let formCheck = function() {
      let form = document.getElementById("form");
      if(form.title.value=="") {
        alert("제목을 입력해 주세요.");
        form.title.focus();
        return false;
      }
      if(form.content.value=="") {
        alert("내용을 입력해 주세요.");
        form.content.focus();
        return false;
      }
      return true;
    }
    $("#writeNewBtn").on("click", function(){
      location.href="<c:url value='/board/write'/>";
    });
    $("#writeBtn").on("click", function(){
      let form = $("#form");
      form.attr("action", "<c:url value='/board/write'/>");
      form.attr("method", "post");
      if(formCheck())
        form.submit();
    });
    $("#modifyBtn").on("click", function(){
      let form = $("#form");
      let readonly = $("input[name=title]", "#form").attr('readonly');
      // 1. 읽기 상태이면, 수정 상태로 변경
      if(readonly!=undefined) {
        $(".writing-header").html("게시판 수정");
        $("input[name=title]", "#form").attr('readonly', false);
        $("textarea", "#form").attr('readonly', false);
        $("#modifyBtn").html("<i class='fa fa-pencil'></i> 등록");
        return;
      }
      // 2. 수정 상태이면, 수정된 내용을 서버로 전송
      form.attr("action", "<c:url value='/board/modify'/>");
      form.attr("method", "post");
      if(formCheck())
        form.submit();
    });
    $("#removeBtn").on("click", function(){
      if(!confirm("정말로 삭제하시겠습니까?")) return;
      let form = $("#form");
      form.attr("action", "<c:url value='/board/remove?page=${page}&pageSize=${pageSize}'/>");
      form.attr("method", "post");
      form.submit();
    });
    $("#listBtn").on("click", function(){
      location.href="<c:url value='/board/list?page=${page}&pageSize=${pageSize}'/>";
    });
  });
</script>
</body>
</html>