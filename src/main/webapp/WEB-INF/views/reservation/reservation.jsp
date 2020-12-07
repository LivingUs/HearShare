<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
</head>
<style>
    #Rbtn_study,
    #Rbtn_health {
        width: 437px;
        height: 50px;
        background-color: #F7DBD3;
        color: black;
        font-size: 22px;
        font-weight: bold;
        cursor: pointer;
        border: none;
        margin: -3px;
    }
    
    #Rbtn_health {
        border-left: 2px solid lightgray;
        height: 50px;
    }
    
    #Rbtn_study:hover,
    #Rbtn_health:hover,
    #Rbtn_pay:hover,
    #Rbtn_use:hover {
        background-color: #eeb6a5;
    }
    
    #Rbtn_pay,
    #Rbtn_use {
        width: 120px;
        height: 40px;
        background-color: #F7DBD3;
        border: none;
        float: right;
        color: white;
    }
    
</style>
<body>
<br>
<header>
    <h3 style="float: left; width: 40%; font-weight: bold;">&nbsp;테마룸 정기권/결제정보</h3>
    <nav id="smallnav">
        <a href="#mypage" class="icon far fa-heart"></a>
        <a href="#reservation" class="icon far fa-heart"></a>
        <a href="#" class="icon far fa-heart"></a>
        <a href="#" class="icon far fa-heart"></a>
    </nav>
    <hr>
</header>
<section> <!--섹션 부분 수정-->
    <div>
        <div style="text-align: center;">
            <button id="Rbtn_study">공부방</button>
            <button id="Rbtn_health">헬스장</button>
        </div><br><br>
        <div style="width: 100%; text-align: center;">
            <div id="information" style="display: inline-block; padding: 50px; text-align: center;">
                <div style="border: 1px solid black; width: 380px; height: 270px; float: left; margin-right: 125px;">대충 사진</div>
                <p style="font-size: 23px; font-weight: bold; float: left;">현재 정기권이<br><span style="font-size: 50px; font-weight: bold;">10</span>개 남았습니다.</p><br><br><br><br><br><br>
                <button style="width: 120px; height: 40px; background-color: #eeb6a5; border: none; float: left; color: white; border-radius: 5px; position: relative; right: 30px;">
                테마룸 예약
                </button>
                <button style="width: 120px; height: 40px; background-color: #eeb6a5; border: none; float: left; color: white; border-radius: 5px; position: relative;">
                정기권 구매
                </button><br><br><br><br><br><br><br>
                <button id="Rbtn_pay">
                사용내역
                </button>
                <button id="Rbtn_use">
                결제내역
                </button><br>
                <div style="width: 800px; height: 180px; background-color: #F7DBD3; float: left; padding: 20px; position: relative; color: white;">
                대충 내역 보는 곳
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>
