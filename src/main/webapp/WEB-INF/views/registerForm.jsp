<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%-- 세션을 생성 x --%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="<c:url value='/css/registerForm1.css'/>">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="<c:url value='/js/registerForm.js'/>"></script>
    <title>회원가입</title>
</head>
<body>
<div id="main">
    <div id="login-form-wrapper">
        <form:form id="form" onsubmit="return formCheck(this)">
            <div class="title">회원가입</div>
            <div class="input-box">
                <h4>아이디</h4>
                <div class="check-icon"></div>
                <input type="text" name="id" id="id"
                       placeholder="3~12자리의 영대소문자와 숫자 조합" onkeyup="idCheck(this)">
                <span class="text"></span>
            </div>
            <div class="input-box">
                <h4>비밀번호</h4>
                <div class="check-icon"></div>
                <input type="password" name="pwd" id="pwd"
                       placeholder="8~16자리의 영대소문자와 숫자 조합" onkeyup="pwdCheck(this)">
                <span class="text"></span>
            </div>
            <div class="input-box">
                <h4>이름</h4>
                <div class="check-icon"></div>
                <input type="text" name="name" id="name"
                       placeholder="홍길동" onkeyup="nameCheck(this)">
                <span class="text"></span>
            </div>
            <div class="input-box">
                <h4>핸드폰번호</h4>
                <div class="check-icon"></div>
                <input type="text" name="phone_number" id="phone_number"
                       placeholder="010-000-0000" onkeyup="phoneCheck(this)">
                <span class="text"></span>
            </div>
            <div class="input-box">
                <h4>이메일</h4>
                <div class="check-icon"></div>
                <input type="text" name="email" id="email"
                       placeholder="example@google.com" onkeyup="emailCheck(this)">
                <span class="text"></span>
            </div>
            <div class="input-box">
                <h4>생년월일</h4>
                <div class="check-icon"></div>
                <input type="text" name="birth" id="birth"
                       placeholder="2020-12-31" onkeyup="birthCheck(this)">
                <span class="text"></span>
            </div>
            <div class="btn-wrapper">
                <button type="submit">확인</button>
                <button type="button" id="cancel-btn" onclick="cancelBtn()">취소</button>
            </div>
        </form:form>
    </div>
</div>
</body>
