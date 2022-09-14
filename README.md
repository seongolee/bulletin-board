# :smiley_cat: 게시판
***

###  :bell: 소개
***

간단한 로그인, 회원가입, 게시판 CRUD 구현

<br>
<br>

### :bulb: 사용한 기술
***

<span>
    <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white">  
    <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
    <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
    <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
    <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
    <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
    <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
    <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
    <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
    <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
    <img src="https://img.shields.io/badge/fontawesome-339AF0?style=for-the-badge&logo=fontawesome&logoColor=white">
</span>

<br>
<br>

### :wrench: 프로젝트 세팅
***


* Packages

  <span>
  <img src="https://img.shields.io/badge/spring-5.0.7-blue?style"/>
  <img src="https://img.shields.io/badge/mybatis-3.5.9-blue?style"/>
  <img src="https://img.shields.io/badge/openJDK-11.0.16-blue?style"/>
  <img src="https://img.shields.io/badge/mysql-8.0.30-blue?style"/>
  <img src="https://img.shields.io/badge/Jquery-3.5.1-blue?style"/>
  </span>

<br>
<br>

### :floppy_disk: DB
***

* user_info
    * id : `VARCHAR(30)`
    * pwd : `VARCHAR(30)`
    * name : `"VARCHAR(30)`
    * email : `DATE`
    * phone_number : `VARCHAR(30)`
    * reg_date : `DATETIME`

<br>

* board
    * bno : `int`
    * title : `VARCHAR(30)`
    * writer : `VARCHAR(30)`
    * view_cnt : `int`
    * comment_cnt : `int`
    * reg_date = `DATETIME`
    * up_date = `DATETIME`
    * content = `TEXT`

<br>
<br>