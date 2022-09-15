# :smiley_cat: 게시판
***

###  :bell: 소개
***

간단한 로그인, 회원가입, 게시판 CRUD 구현

<br>
<br>

### :cyclone: 요구사항 분석
***

 1. 회원가입
    * 유효성 검사 
      * 아이디는 최소 3~12자이며, 특수문자를 제외한 영문숫자 조합
      * 패스워드는 최소 8~16자이며, 특수문자를 제외한 영문숫자 조합
      * 이름은 최소 2자이상이며, 한글만 입력 가능 등 기본적인 형식에 맞게 유효성 검사를 실시함
    * 중복확인
      * 아이디를 입력시 자동으로 ajax를 통해 데이터베이스에 존재하는 아이디를 중복체크 후 메시지를 통해 보여주기
 2. 로그인 페이지
    * 로그인을 해야지만 게시판을 이용 가능
      * 올바르지 않은 경로로 접근시 로그인하도록 로그인 페이지로 이동 처리
      * 로그인 전에 게시판 링크 클릭시 로그인 후 게시판으로 자동이동하도록 처리
    * 로그인 검사
      * 아이디와 비밀번호가 일치하지 않을시 "메시지"를 보여주기
    * 로그아웃
      * 로그아웃시 세션을 제거 
    * 비밀번호 찾기
 3. 비밀번호 찾기
    * 아이디와 이메일을 입력받아 일치하는 계정이 있으면 12자리의 임시 비밀번호를 생성 후 이메일로 임시비밀번호를 전송
 4. 게시판 이용
    * 게시글 CRUD
      * 게시글 쓰기 기능  
      * 게시글 수정시 자신이 작성한 게시글만 수정 가능하게 처리
      * 게시글 삭제시 자신이 작성한 게시글만 삭제 가능하게 처리
      * 최신 글이 처음 나타나도록 처리
    * 게시글 검색 기능
      * option: 제목 + 내용, 제목, 작성자를 선택후 keyword를 통해 원하는 결과만 검색해서 보여주도록 처리
    * 페이징
      * nav와 pageSize 조절을 통해 보여줄 게시물의 갯수와 네비게이션을 조절 할 수 있도록 처리
      * nav 사이즈를 벗어나면 <, > 기호를 통해 네비를 이동하도록 처리
      * nav에 있는 번호를 누루면 nav 이동을 통해 다른 게시물들 확인 하도록 처리
    * 조회수
      * 자신의 게시물이 아닌 다른 사람의 게시물을 클릭하여 접근시 조회수 증가 


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