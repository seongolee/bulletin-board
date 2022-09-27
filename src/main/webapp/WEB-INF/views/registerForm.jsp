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
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="<c:url value='/resources/js/register.js'/>"></script>
    <!-- JavaScript Bundle with Popper -->
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
    <!-- CSS only -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
            crossorigin="anonymous">
    <title>회원가입</title>
</head>
<style>
    .form-group {
        padding: 9px 0;
    }
</style>
<body>
<div class="container">
    <div class="col-md-6 mx-auto text-center">
        <div class="header-title">
            <h1 class="wv-heading--title">
                회원가입
            </h1>
            <h2 class="wv-heading--subtitle">
                회원가입 설명
            </h2>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 mx-auto">
            <div class="myform form ">
                <form action="<c:url value='/register/add'/>" method="post">
                    <div class="form-group">
                        <input type="text" name="id"  class="form-control my-input" id="id" placeholder="3~12자리의 영대소문자와 숫자 조합">
                    </div>
                    <div class="form-group">
                        <input type="password" name="pwd"  class="form-control my-input" id="pwd" placeholder="8~16자리의 영대소문자와 숫자 조합">
                    </div>
                    <div class="form-group">
                        <input type="text" name="name" id="name"  class="form-control my-input" placeholder="홍길동">
                    </div>
                    <div class="form-group">
                        <input type="text" name="phone_number" id="phone_number"  class="form-control my-input" placeholder="010-000-0000">
                    </div>
                    <div class="form-group">
                        <input type="email" name="email" id="email"  class="form-control my-input" placeholder="exam@google.com">
                    </div>
                    <div class="form-group">
                        <input type="email" name="birth" id="birth"  class="form-control my-input" placeholder="1010/10/10">
                    </div>
                    <div class="text-center ">
                        <button type="submit" class=" btn btn-dark send-button tx-tfm">Create Your Free Account</button>
                    </div>
                    <div class="col-md-12 text-center">
                        <div class="login-or">
                            <hr class="hr-or">
                            <span class="span-or">or</span>
                        </div>
                    </div>
                    <div class="text-center">
                        <a class="btn btn-primary g-button" href="#">
                            <i class="fa fa-google"></i> Sign up with Google
                        </a>
                    </div>
                    <p class="small mt-3">By signing up, you are indicating that you have read and agree to the <a href="#" class="ps-hero__content__link">Terms of Use</a> and <a href="#">Privacy Policy</a>.
                    </p>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
