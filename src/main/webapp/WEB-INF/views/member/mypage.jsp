<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
</head>
<body>
<br>
<header>
<h3 style="float: left; width: 30%; font-weight: bold;">&nbsp;마이페이지</h3>
    <nav id="smallnav">
        <a href="#mypage" class="icon far fa-heart"></a> 
        <a href="#reservation" class="icon far fa-heart"></a> 
        <a href="#" class="icon far fa-heart"></a> 
        <a href="#" class="icon far fa-heart"></a>
    </nav>
<hr>
</header>
<section> <!--섹션 부분 수정-->
    <ul style="list-style:none;">
        <li>&nbsp;아이디<input type="text" name="userId" id="inputbox" style="position: relative; left: 94px" placeholder="HSadmin">
        <snap style="font-size: 13px; position: relative; left: 110px;">(영문 소문자 / 숫자, 6~15자)</snap>
        </li>
        <hr>
        <li>&nbsp;비밀번호<input type="password" name="userPwd" id="inputbox" style="position: relative; left: 78px" placeholder="비이이밀번호">
        <snap style="font-size: 13px; position: relative; left: 94px;">(영문 소문자 / 숫자 / 특수문자 중 2가지 이상 조합, 10~15자)</snap>
        </li>
        <hr>
        <li>&nbsp;비밀번호 확인<input type="password" name="userPwdC" id="inputbox" style="position: relative; left: 41px" placeholder="비이이밀번호 확인"></li>
        <hr>
        <li>&nbsp;이름<input type="text" value="" name="name" id="inputbox" style="position: relative; left: 110px" placeholder="하우스관리자"></li>
        <hr>
        <li>&nbsp;폰번호<input type="phone" name="phone" id="inputbox" style="position: relative; left: 94px" placeholder="010-1577-1577"></li>
        <hr>
        <li>&nbsp;이메일<input type="email" name="email" id="inputbox" style="position: relative; left: 94px" placeholder="HSadmin@naver.com"></li>
        <hr>
        <li>&nbsp;방번호<input type="roomnum" name="roomnum" id="inputbox" style="position: relative; left: 94px" placeholder="101호"></li>
        <hr>
        <div style="text-align: center;">
        <button class="btn btn-success" style="width: 100px; font-weight: bold; margin-right: 10px;">수정</button>
        <button class="btn btn-danger" style="width: 100px; font-weight: bold; margin-left: 10px;">취소</button>
        </div>
        </ul>
    <br><br><br><br><br><br><br><br>
</section>
</body>
</html>
