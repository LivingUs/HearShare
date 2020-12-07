<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome To Hear:Share</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./resources/css/index.css">
</head>
<body>
	 <section class="login-form">
        <pre>  듣다   여기ㅇㅇ</pre>
        <br>
        <h1>Hear : Share</h1>
        <form action="#">
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