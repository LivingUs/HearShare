<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
<!-- fullCalendar -->
<link href='../resources/fullcal/core/main.css' rel='stylesheet' />
<link href='../resources/fullcal/daygrid/main.css' rel='stylesheet' />
<script src='../resources/fullcal/core/main.js'></script>
<script src='../resources/fullcal/daygrid/main.js'></script>
<script src='../resources/fullcal/interaction/main.js'></script>
<script src='../resources/fullcal/timegrid/main.js'></script>
<!-- 나머지 -->
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/calendar/calendar.css" />
<!-- 아이콘 임포트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<script type="text/javascript"src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
   
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar2');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			defaultView : 'dayGridMonth',
			defaultDate : new Date(),
			dateClick : function(info) {
				alert(info.dateStr);
			},
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'today'
			}
		});
		calendar.render();
	});
</script>
</head>
<style>

/* 이 페이지 Style */


</style>
<body>
<br>
<div id="wrapper">

	<!-- 네비바 -->
	<jsp:include page="../common/menuBar.jsp"></jsp:include>
    <br>
    <br>
    <div id="main">
    
    <article id="calendar" class="panel intro">
		<header>
		    <h3 style="float: left; width: 30%; font-weight: bold;">&nbsp;Calendar</h3>
		    <nav id="smallnav">
		        <a href="studyReserve.do"><i class="far fa-calendar-check"></i></a>
		        <a href="calendar.do"><i class="far fa-calendar-alt"></i></a>
		    </nav>
		    <hr>
		</header><br><br>
		<section> <!--섹션 부분 수정-->
		    <div>
		        <div id="myCalendar" style=" width:88%; height:620px; text-align: center; background-color:rgb(255, 229, 226); margin:auto; padding:40px; position:relative; left:10px;">
		            <div id="today" style="width:19%; height:50%; margin-top:150px; float:left;">
		                <span style="font-size:17px; font-weight:bold; color:black;"><i class="far fa-check-square"></i>TODAY LIST<hr></span><br>
		                <ul style="font-size:16px; text-align: left; margin-left:5px;">
		                    <li>월세 내는 날</li>
		                    <li>스터디룸 예약</li>
		                    <li>종로 돈부리 저녁 모임</li>
		                </ul>
		            </div>
		            <div id="calendar2" style="border:20px solid white; background-color:white; width:73%; height:100%; margin-left:50px; float:left; text-align: center;">
		            </div>
		        </div><br>
		        <div style="text-align: right; font-size:13px; font-weight: bolder; margin-right:70px;">
		            <span style="color:red;">※이용을 하지 않은 예약</span> 에 한해서만 예약 취소가 가능합니다.<br>환불을 원하시는 분은 꼭 해당 일정을 눌러 취소해 주세요.
		        </div>
		        <br><br><br>
		        <button onclick="" style="width:190px; height:70px; background-color:rgb(255, 186, 179); font-size:18px; margin-right:100px; margin-left:340px; border:0px; color:white; border-radius:4px;">월세 결제</button>
		        <button onclick="" style="width:190px; height:70px; background-color:rgb(255, 186, 179); font-size:18px; border:0px; color:white; border-radius:4px;">예약 취소</button>
		        <br><br><br><br><br><br>
		        <p style="text-align: right; font-size: 18px; font-weight:600; position: relative; right: 35px;">월세 정기결제를 해지하고 싶다면?</p>
		        <button style="width: 300px; height: 40px; background-color: rgb(255, 186, 179); border: none; float: right; color: white; margin-right:30px; border-radius:4px; font-weight:700;">
		         정기결제 해지하러 가기 &nbsp;&nbsp;<i class="fas fa-long-arrow-alt-right" style="font-size:25px; color:rgb(255, 124, 109);"></i>
		        </button><br><br><br><br>
		    </div>
		</section>
</article>
</div>
</div>
</body>

<!-- script -->
    <script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
</html>
