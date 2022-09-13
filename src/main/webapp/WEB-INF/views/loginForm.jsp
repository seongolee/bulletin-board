<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginId" value="${pageContext.request.getSession(false)==null ? '' : pageContext.request.session.getAttribute('id')}"/>
<c:set var="loginOutLink" value="${loginId=='' ? '/login/login' : '/login/logout'}"/>
<c:set var="loginOut" value="${loginId=='' ? 'Login' : 'logout'}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <link rel="stylesheet" href="<c:url value='/css/menu.css'/>">
  <link rel="stylesheet" href="<c:url value='/css/loginForm.css'/>">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
<div id="menu">
  <ul>
    <li id="logo"><a href="<c:url value='/'/>">Portfolio</a></li>
    <li><a href="<c:url value='/'/>">Home</a></li>
    <li><a href="<c:url value='/board/list'/>">Board</a></li>
    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
    <li><a href="<c:url value='/register/add'/>">Sign in</a></li>
  </ul>
</div>
<form action="<c:url value="/login/login"/>" method="post" onsubmit="return formCheck(this);">
  <h3 id="title">Login</h3>
  <div id="msg">
    <c:if test="${not empty param.msg}">
      <i class="fa fa-exclamation-circle">${param.msg}</i>
    </c:if>
  </div>
  <input type="text" name="id" value="${cookie.id.value}" placeholder="아이디 입력" autofocus>

  <%-- 다른 url 로 접근시 로그인이 안되어있을때 url 저장후 로그인 후 url로 보낼줄때 사용 --%>
  <input type="hidden" name="toURL" value="${param.toURL}">
  <input type="password" name="pwd" placeholder="비밀번호">
  <button>로그인</button>
  <div>
    <label><input type="checkbox" name="rememberId" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |
    <a href="">비밀번호 찾기</a> |
    <a href="">회원가입</a>
  </div>
  <script>
    function formCheck(frm) {
      let msg ='';
      if(frm.id.value.length==0) {
        setMessage('아이디를 입력해주세요.', frm.id);
        return false;
      }
      if(frm.pwd.value.length==0) {
        setMessage('비밀번호를 입력해주세요.', frm.pwd);
        return false;
      }
      return true;
    }
    function setMessage(msg, element){
      document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'} </i>`;
      if(element) {
        element.select();
      }
    }
  </script>
</form>
</body>
</html>