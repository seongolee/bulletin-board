<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="<c:url value='/css/registerForm.css'/>">
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <title>회원가입</title>
</head>
<body>
<%--<form action="<c:url value="/register/add"/>" method="POST" onsubmit="return formCheck(this)">--%>
<form:form onsubmit="return formCheck(this)">
    <div class="title">회원가입</div>
    <div id="msg" class="msg"></div>
    <label for="">아이디</label>
    <input class="input-field" type="text" name="id" placeholder="3~12자리의 영대소문자와 숫자 조합">
    <label for="">비밀번호</label>
    <input class="input-field" type="password" name="pwd" placeholder="8~16자리의 영대소문자와 숫자 조합">
    <label for="">이름</label>
    <input class="input-field" type="text" name="name" placeholder="홍길동">
    <label for="">휴대폰 번호</label>
    <input class="input-field" type="text" name="phone_number" placeholder="010-000-0000">
    <label for="">이메일</label>
    <input class="input-field" type="text" name="email" placeholder="example@google.com">
    <label for="">생년월일</label>
    <input class="input-field" type="text" name="birth" placeholder="2020-12-31">
    <button type="submit">회원 가입</button>
</form:form>
<script>
    // 입력받은 데이터별 체크
    function formCheck(frm) {
        // 아이디 유효성 검사
        if(!regExpTest(/^[A-Za-z0-9]{3,12}$/g, frm.id.value, frm.id, '아이디는 3~12자리의 영문과 숫자만 가능합니다.')){
            return false
        }
        // 비밀번호 유효성 검사
        if(!regExpTest(/^[A-Za-z0-9]{8,16}$/g, frm.pwd.value, frm.pwd, '비밀번호는 8~16자리의 영문과 숫자만 가능합니다.')){
            return false
        }
        // 이름 유효성 검사
        if(!regExpTest(/^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]{2,}$/, frm.name.value, frm.name, '이름은 한글 2글자 이상 가능합니다.')){
            return false
        }
        // 휴대폰 유효성 검사
        if(!regExpTest(/^\d{2,3}-\d{3,4}-\d{4}$/, frm.phone_number.value, frm.phone_number, '휴대폰 형식만 가능합니다, 010-000-0000')){
            return false
        }
        // 이메일 유효성 검사
        if(!regExpTest(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i, frm.email.value, frm.email, '이메일의 형식만 가능합니다, example@google.co.kr')){
            return false
        }
        // 생년월일 유효성 검사
        if(!regExpTest(/^\d{4}-\d{1,2}-\d{1,2}$/, frm.birth.value, frm.birth, '생년월일 입력해주세요, 2020-12-31')){
            return false
        }
        return true;
    }

    // 유효성 검사 메서드
    function regExpTest(regExp, value, formName, msg){
        if(!regExp.test(value)){
            setMessage(msg, formName);
            return false;
        }
        return true
    }

    // 알림 메시지
    function setMessage(msg, element){
        document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;
        if(element) {
            element.select();
        }
    }

    // 아이디 중복확인 중복체크 버튼으로 대체 (수정할 예정)
    // function idCheck(id) {
    //     let user = {id:id.value}
    //
    //     $.ajax({
    //         type:'POST', // 요청 메서드
    //         url:'/register/idCheck', // 요청 URL
    //         headers: {"content-type": "application/json"}, // 요청 헤더
    //         dataType:'text', // 전송할 데이터의 타입
    //         data: JSON.stringify(user), // 서버로 전송할 데이터. stringify() 로 직렬화
    //         success : function(data){
    //             if(data==="true"){
    //                 document.getElementById("msg").style.color = "green";
    //                 document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle">사용 가능한 아이디입니다.</i>`;
    //             } else {
    //                 document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle">중복된 아이디입니다.</i>`;
    //             }
    //         },
    //         error : function() {
    //             alert("error")
    //         }
    //     }); // $.ajax()
    // }
</script>
</body>
</html>