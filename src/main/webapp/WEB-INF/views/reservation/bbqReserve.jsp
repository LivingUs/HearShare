<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
<!-- fullCal -->
<link href='../resources/fullcal/core/main.css' rel='stylesheet' />
<link href='../resources/fullcal/daygrid/main.css' rel='stylesheet' />
<script src='../resources/fullcal/core/main.js'></script>
<script src='../resources/fullcal/daygrid/main.js'></script>
<script src='../resources/fullcal/interaction/main.js'></script>
<script src='../resources/fullcal/timegrid/main.js'></script>
<!-- jQuery -->
<script type="text/javascript"src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 공통 script -->
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/reserve/reserve.css" />
<!-- 결제 API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
var moment;
var moList = [];
var d = new Date();

var month = d.getMonth()+1;
var day = d.getDate();

var today = d.getFullYear() + '-' +
    (month<10 ? '0' : '') + month + '-' +
    (day<10 ? '0' : '') + day;

	/*    캘린더     */
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			defaultView : 'dayGridMonth',
			eventLimit: true,
			defaultDate : new Date(),
			height: 490,
			
			/* 날짜 선택시 셀 CSS 변경  */
			dateClick : function(info) {
			     
			     moment = info.dateStr;
			     moList.push(moment); 
			     
			     /* 이전 날짜 검사 */
			     if(moment < today) {
			    	 alert("이전 날짜는 예약하실 수 없습니다.");
			    	 return false;
			     }
			     			     
			      $('[data-date='+moment+']').css({"backgroundColor": "#fc9d9a"});
			     for (var i = 0; i < moList.length; i++) {
			             for (var j = 0; j < moList.length; j++) {
			            	 if(moList[i] != moList[j]) {
			            		 $('[data-date='+moList[j]+']').css({"backgroundColor": "white"});
			            		 $('[data-date='+moList[i]+']').css({"backgroundColor": "#fc9d9a"});
			            		 moList.clear;
			            	 }
			             }
			         }; 
			    		 var rCode = $("#rCode").val();
			     
			   /*   시간박스 유효성 검사 코드   */
			     $.ajax({
			            url         :   "reserveList.do",
			            dataType: "json",
						type: "get",
			            data        :   {
			                "rCode" : rCode,
			                "date"	   : moment
			            },
			            success     :   function(data){
		                	if(data.length>0) {
		                		for(var i in data) {
		                			$('[data-date='+data[i].rDate+']').css({"backgroundColor": "yellow"});
		                		}
		                	}
			            },
			            error       :   function(request, status, error){
			                console.log("AJAX_ERROR");
			            }
			        });
			},
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'today'
			},
			/* events: [
				{
			    title:"My repeating event",
			    start: '10:00', // a start time (10am in this example)
			    end: '14:00', // an end time (2pm in this example)
			    dow: [ 30 ] // Repeat monday and thursday
				}
			] */
		});
		calendar.render();
		
		/* calendar.addEvent( {'title':'월세', 'start':'2020-12-01', 'end':'2020-12-01'}); */
		
	}); 
	
	/* 페이지 내의 네비바 */
    $(document).ready(function() {
        $("#btn_study").click(function() {
            $("#studyreservation").removeClass('d-none');
            $("#healthreservation").addClass('d-none');
            $("#bbqreservation").addClass('d-none');
        });

        $("#btn_health").click(function() {
            $("#studyreservation").addClass('d-none');
            $("#healthreservation").removeClass('d-none');
            $("#bbqreservation").addClass('d-none');
        });

        $("#btn_bbq").click(function() {
            $("#studyreservation").addClass('d-none');
            $("#healthreservation").addClass('d-none');
            $("#bbqreservation").removeClass('d-none');
        });
	
    var h = document.getElementsByClassName('btn_calender');
    for (var i = 0; i < h.length; i++) {
        h[i].addEventListener('click', function() {
            for (var j = 0; j < h.length; j++) {
                h[j].style.backgroundColor = "#F7DBD3";
                h[j].style.color = "black";
            }
            h[i].style.backgroundColor = "#eeb6a5";
            h[i].style.color = "black";
        });
    }
});   
 $(function() {
    $("#reserveSubmit").click(function() {
    	 var result =  confirm(moment + " - 바베큐장 예약하시겠습니까?");
    	 
    	 if(result) {
	        //ajax로 데이터 보내줌
	        $.ajax({
	            url         :   "bbqInsert.do",
	            type        :   "post",
	            data        :   {
	                "date"	   : moment,
	                "rTime" : "00:00"
	            },
	            success     :   function(data){
	                if(data == "OK") {
	                    location.href="calendar.do";
	                } else {
	                	location.href="common/errorPage.do";
	                }
	            },
	            error       :   function(request, status, error){
	                console.log("AJAX_ERROR");
	            }
	        });
    	 }
        
    });
 });
</script>
</head>
<style>
@font-face {
    font-family: 'Jal_Onuel';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/Jal_Onuel.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
     font-family: 'NIXGONM-Vb';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/NIXGONM-Vb.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
   
   /* 내부 CSS */
    #btn_study,
    #btn_health,
    #btn_bbq {
        width: 30%;
        height: 60px;
        background-color: #F7DBD3;
        color: black;
        font-size: 22px;
        font-weight: bold;
        cursor: pointer;
        border: none;
        margin: -2px;
    }
    
    #btn_health {
        border-right: 2px solid lightgray;
        border-left: 2px solid lightgray;
        height: 60px;
    }
    
    #btn_study:hover,
    #btn_health:hover,
    #btn_bbq:hover {
        background-color: #eeb6a5;
    }
    label {
    	padding : 5px 0px 5px 15px;
    	background-color : white;
    }
    .fc-sun {color:#e31b23}
	.fc-sat {color:#007dc3}
	input {
		border: none;
	}
</style>
<body>
<div id="wrapper">
<br>
	<!-- Nav -->
	<jsp:include page="../common/menuBar.jsp"></jsp:include>
     <br>
     <br>
     <div id="main">
    <article id="study" class="panel intro">
    <input type="hidden" id="rCode" value="B">
     <!-- 내부 코드 -->
		<header>
		    <h3 style="float: left; width: 30%; font-weight: bold; font-family:Jal_Onuel;">&nbsp;Reservation</h3>
		    <nav id="smallnav">
		        <a href="studyReserve.do"><i class="far fa-calendar-check"></i></a>
		        <a href="calendar.do"><i class="far fa-calendar-alt"></i></a>
		    </nav>
		    <hr>
		</header><br><br>
		<!-- <form action="reserveInsert.do" method="post" id="resevePay"> -->
		<section> <!--섹션 부분 수정-->
		    <div style="width:100%;">
		        <div style="text-align: center;" class="title_tabs">
		            <button id="btn_study" class="btn_calender" onclick="location.href='studyReserve.do'">스터디룸</button>
		            <button id="btn_health" class="btn_calender" onclick="location.href='healthReserve.do'">헬스룸</button>
		            <button id="btn_bbq" class="btn_calender" onclick="location.href='bbqReserve.do'" style="background:#eeb6a5">바베큐장</button>
		        </div><br><br>
		        <div style="text-align: center;">
		            <div id="studyreservation" style="width:100%; display: inline-block; padding: 50px; text-align: center; position:relative; left:35px;">
		                <div id="calendar" style="font-family:NIXGONM-Vb; border:10px solid pink; width:50%; height: 100px; float: left; position:relative; top:-10px;"></div>
		                <div style="position:relative; top:3px;">
		                <div style="border: 1px solid lightgray; width: 1px; height: 430px; float: left; margin: 0px 30px 0px 30px; position: relative; top: 15px;"></div>
		                <div style="width: 38%; height: 120px; background-color: #eeb6a5; float: left; padding: 25px;">
		                <span style="float:left; color: white; margin-right:20px;">테마룸 종류 : </span>
		                <input type="text" style="width: 130px; text-align: center; float:left;  font-size:15px;" readonly value="바베큐장"><br><br>
		                <span style="color: white; float:left; margin-right:20px;">정기권 사용 : </span>
		                <select id="ticketBox" style="width: 150px; text-align: center; float:left;  font-size:15px;">
		                    	<option selected disabled>정기권 없음</option>
		                </select>
		                </div><br>
		                <div style="width: 38%; height: 260px; background-color: #eeb6a5; float: left; padding: 20px; position: relative; top: 50px; color: white;">
		           		    <section id="time"> 
		               		    <span style="position:relative; left50px;">예약 현황</span><br>
		               		    <hr style="position:relative; bottom:8px;">
		               		    <span>예약자   :  <input type="text"></span>
		               		    
		                        <div id="timeBox" style="font-weight:400; position:relative; bottom:5px; font-size:13px;">
		                            
		                    </section>
		                </div>
		                <div style="width: 24%; height: 40px; background-color: #eeb6a5; float: left; padding: 10px; position: relative; top: 70px; color: white; text-align:left; padding-left:30px; line-height:1.4;">
		                총액 : <input type="text" style="border:none; width:40px; background-color: #eeb6a5; color:white;" id="count" name="count">원
		                </div>
		                <button id="reserveSubmit" class="btn btn-outline-danger" style="width: 100px; height: 35px;float: left; position: relative; top: 75px; left: 30px; font-size:14px; border-radius:5px;">
		                예약하기
		                </button>
		                </div>
		                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		                <ul style="text-align: left; font-size:13px; font-weight: bolder; color:gray; position:static;">
		                <li>스터디룸, 헬스룸 입실시에 꼭!! 입구에서 입실을 눌러 주세요.</li>
		                <li>예약취소는 '나의 일정'에서 가능하며, 입실 확인이 되지 않은 상태에서만 가능합니다.</li>
		                <li>예약취소를 하지 않으면 환불이 어려우니 이 점 유의하시기 바랍니다.</li>
		                <li>바베큐파티는 사용 후에는 다음 이용 주민을 위해 깔끔하게 정리하는 센스!</li>
		                </ul><br><br>
		                <p style="text-align: right; font-size: 18px; font-weight: bold; position: relative; right: 60px;">테마룸 정기권이 필요하세요?</p>
		        <button style="width: 300px; height: 40px; background-color: rgb(255, 186, 179); border: none; float: right; color: white; border-radius:4px; position:relative; right:40px;">
		         정기권 결제하러 가기 &nbsp;&nbsp;<i class="fas fa-long-arrow-alt-right" style="font-size:25px; color:rgb(255, 124, 109);"></i>
		        </button><br><br>
		            </div>
		        </div>
		    </div>
</section>
</form>
</article>
</div>
</div>
<!-- script -->
<script src="../../../resources/js/jquery.min.js"></script>
<script src="../../../resources/js/breakpoints.min.js"></script>
<script src="../../../resources/js/main.js"></script>
</body>
</html>
