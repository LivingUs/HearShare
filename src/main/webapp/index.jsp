<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome To Hear:Share</title>
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./resources/css/index.css">
</head>
<body>
	 <section class="login-form">
        <pre>  듣다   여기</pre>
        <br>
        <h1>Hear : Share</h1>
        <form action="memberLogin.do" method="get">
            <div class="int-area">
                <input type="text" name="memberId" id="id" autocomplete="off" required><label for="id">ID</label>
            </div>
            <div class="int-area">
                <input type="password" name="password" id="pw" autocomplete="off" required><label for="pw">PASSWORD</label>
            </div>
            <div class="caption">
                <a href="">Forgot Password?</a>
            </div>
            <div class="btn-area">
                    <button id="btn" type="submit">LOGIN</button>
            </div>
        </form>
         <br>
      <a href="memberJoin.do">Sign in</a>
      <a href="home.do">홈으로</a>
    </section>
    <img src="resources/images/home.png" style="width:50px;margin-bottom: 420px;">
    
    <script>
        let id = $('#id');
        let pw = $('#pw');
        let btn = $('#btn');
        
        $(btn).on('click', function(){
           if($(id).val() == ""){
               $(id).next('label').addClass('warning');
               setTimeout(function() {
                   $('label').removeClass('warning');     
               }, 500);
             
           }
            else if($(pw).val() == ""){
               $(pw).next('label').addClass('warning');
                 setTimeout(function() {
                   $('label').removeClass('warning');     
               }, 500);
           } 
        });
    </script>
</body>
</html>