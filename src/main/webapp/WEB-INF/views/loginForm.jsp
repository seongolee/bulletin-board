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
  <link rel="stylesheet" href="<c:url value='/css/loginForm.css'/>">
  <!-- CSS only -->
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
</head>
<body>
<main class="form-signin w-100 m-auto">
  <form action="<c:url value="/login/login"/>" method="post" onsubmit="return formCheck(this);">
    <h1 class="h3 mb-3 fw-normal">Login</h1>
    <div id="msg">
      <c:if test="${not empty param.msg}">
        <i class="fa fa-exclamation-circle">${param.msg}</i>
      </c:if>
    </div>
    <div class="form-floating">
      <input type="text" class="form-control" name="id" id="floatingInput" placeholder="아이디 입력" value="${cookie.id.value}">
      <label for="floatingInput">Id</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" name="pwd" id="floatingPassword" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
      <label>
        <input type="checkbox" value="remember-me"> Remember me
      </label>
    </div>
    <%-- 다른 url 로 접근시 로그인이 안되어있을때 url 저장후 로그인 후 url로 보낼줄때 사용 --%>
    <input type="hidden" name="toURL" value="${param.toURL}" />
    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
  </form>
</main>
<%--  <div>--%>
<%--    <label><input type="checkbox" name="rememberId" ${empty cookie.id.value ? "":"checked"}> 아이디 기억</label> |--%>
<%--    <a href="<c:url value='/login/findPwd'/>">비밀번호 찾기</a> |--%>
<%--    <a href="<c:url value='/register/add'/>">회원가입</a>--%>
<%--  </div>--%>
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