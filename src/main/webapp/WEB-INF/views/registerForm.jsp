<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
<form action="<c:url value="/register/save"/>" method="POST" onsubmit="return formCheck(this)">
    <div class="title">회원가입</div>
    <div id="msg" class="msg"></div>
    <label for="">아이디</label>
    <input class="input-field" type="text" name="id" onchange="idCheck(this)" placeholder="8~12자리의 영대소문자와 숫자 조합">
    <label for="">비밀번호</label>
    <input class="input-field" type="text" name="pwd" placeholder="8~12자리의 영대소문자와 숫자 조합">
    <label for="">이름</label>
    <input class="input-field" type="text" name="name" placeholder="홍길동">
    <label for="">휴대폰 번호</label>
    <input class="input-field" type="text" name="sns" placeholder="010-000-0000">
    <label for="">이메일</label>
    <input class="input-field" type="text" name="email" placeholder="example@google.co.kr">
    <label for="">생년월일</label>
    <input class="input-field" type="text" name="birth" placeholder="2020-12-31">
    <button>회원 가입</button>
</form>
<script>
    // 입력받은 id 길이 확인
    function formCheck(frm) {
        let msg ='';
        if(frm.id.value.length<3) {
            setMessage('id의 길이는 3이상이어야 합니다.', frm.id);
            return false;
        }
        return true;
    }
    // 알림 메시지
    function setMessage(msg, element){
        document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle"> ${'${msg}'}</i>`;
        if(element) {
            element.select();
        }
    }

    // 아이디 중복확인 (수정할 예정)
    function idCheck(id) {
        let user = {id:id.value}

        $.ajax({
            type:'POST', // 요청 메서드
            url:'/register/idCheck', // 요청 URL
            headers: {"content-type": "application/json"}, // 요청 헤더
            dataType:'text', // 전송할 데이터의 타입
            data: JSON.stringify(user), // 서버로 전송할 데이터. stringify() 로 직렬화
            success : function(data){
                if(data==="true"){
                    document.getElementById("msg").style.color = "green";
                    document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle">사용 가능한 아이디입니다.</i>`;
                } else {
                    document.getElementById("msg").innerHTML = `<i class="fa fa-exclamation-circle">중복된 아이디입니다.</i>`;
                }
            },
            error : function() {
                alert("error")
            }
        }); // $.ajax()
    }

</script>
</body>
</html>