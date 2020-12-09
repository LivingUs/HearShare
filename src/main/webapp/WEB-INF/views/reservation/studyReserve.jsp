<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<script type="text/javascript"src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 공통 script -->
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/reserve/reserve.css" />

<script>    
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			defaultView : 'dayGridMonth',
			eventLimit: true,
			defaultDate : new Date(),
			height: 490,
			dateClick : function(info) {
				 var moment = info.dateStr;
			     $('[data-date='+moment+']').css({"backgroundColor": "yellow"});
			},
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'today'
			},
			events: [
				{
			    title:"My repeating event",
			    start: '10:00', // a start time (10am in this example)
			    end: '14:00', // an end time (2pm in this example)
			    dow: [ 30 ] // Repeat monday and thursday
				}
			]
		});
		calendar.render();
		
		calendar.addEvent( {'title':'월세', 'start':'2020-12-01', 'end':'2020-12-01'});
		
	}); 
	

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
            this.style.backgroundColor = "#eeb6a5";
            this.style.color = "black";
        });
    }
    $("input:checkbox[name='ck']").on("click", function() {
    	var checkId = new $(this).parent().parent().attr('id');
    	
	    if($("input:checkbox[name='ck']").is(":checked") == true) {
	    	$("#"+checkId).css("background-color", "red");
	    } else {
	    	$("#"+checkId).css("background-color", "white");
	    }
	    console.log(checkId);
    var count = $("input:checkbox[name='ck']:checked").length * 500;
    $("#count").val(count);
    })
   /*  if($("#ticketBox").val(0)==true) {
    	
    } */
});
    /* function reservePay() {
    	var count = $("#count").val(); 
    	if( $("#ticketBox").val(0)==true) {
    		var IMP = window.IMP;
		    IMP.init('imp60714204');
		    var msg;
		    
		    IMP.request_pay({
		        pg : 'html5_inicis',
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name :	'USER',
		        amount : count,
		        buyer_email : 'eye5277@naver.com',
		        buyer_name : '손님',
		        buyer_tel : '010-2538-5276',
		        buyer_addr : '서울시 종로구',
		        buyer_postcode : '123-456'
		    }, function(rsp) {
		        if ( rsp.success ) {
		            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		            jQuery.ajax({
		                url: "/payments/complete",
		                type: 'POST',
		                dataType: 'json',
		                data: {
		                    imp_uid : rsp.imp_uid
		                }
		            }).done(function(data) {
		                //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
		                if ( everythings_fine ) {
		                    msg = '결제가 완료되었습니다.';
		                    msg += '\n고유ID : ' + rsp.imp_uid;
		                    msg += '\n상점 거래ID : ' + rsp.merchant_uid;
		                    msg += '\결제 금액 : ' + rsp.paid_amount;
		                    msg += '카드 승인번호 : ' + rsp.apply_num;
		                    
		                    alert(msg);
		                } else {
		                    //[3] 아직 제대로 결제가 되지 않았습니다.
		                    //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
		                }
		            });
		            //성공시 이동할 페이지
		            $('form#resevePay').submit();
		            
		        } else {
		            msg = '결제에 실패하였습니다.';
		            msg += '에러내용 : ' + rsp.error_msg;
		            //실패시 이동할 페이지
		            alert(msg);
		            return false;
		        }
    	})
    } else {
    	 $('form#resevePay').submit();
    }
    } */

</script>
</head>
<style>
   
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
	.fc-highlight {
	  background: green !important;
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
     <!-- 내부 코드 -->
		<header>
		    <h3 style="float: left; width: 30%; font-weight: bold;">&nbsp;Reservation</h3>
		    <nav id="smallnav">
		        <a href="studyReserve.do"><i class="far fa-calendar-check"></i></a>
		        <a href="calendar.do"><i class="far fa-calendar-alt"></i></a>
		    </nav>
		    <hr>
		</header><br><br>
		<form action="reserveInsert.do" method="post" id="resevePay">
		<section> <!--섹션 부분 수정-->
		    <div style="width:100%;">
		        <div style="text-align: center;" class="title_tabs">
		            <button id="btn_study" class="btn_calender" onclick="location.href='studyReserve.do'">스터디룸</button>
		            <button id="btn_health" class="btn_calender" onclick="location.href='healthReserve.do'">헬스룸</button>
		            <button id="btn_bbq" class="btn_calender" onclick="location.href='bbqReserve.do'">바베큐장</button>
		        </div><br><br>
		        <div style="text-align: center;">
		            <div id="studyreservation" style="width:100%; display: inline-block; padding: 50px; text-align: center; position:relative; left:35px;">
		                <div id="calendar" style="border:10px solid pink; width:50%; height: 100px; float: left; position:relative; top:-10px;"></div>
		                <div style="position:relative; top:15px;">
		                <div style="border: 1px solid lightgray; width: 1px; height: 430px; float: left; margin: 0px 30px 0px 30px; position: relative; top: 15px;"></div>
		                <div style="width: 38%; height: 120px; background-color: #eeb6a5; float: left; padding: 25px;">
		                <span style="float:left; color: white; margin-right:20px;">테마룸 종류 : </span>
		                <input type="text" style="width: 130px; text-align: center; float:left;  font-size:15px;" readonly value="스터디룸"><br><br>
		                <span style="color: white; float:left; margin-right:20px;">정기권 사용 : </span>
		                <select id="ticketBox" style="width: 150px; text-align: center; float:left;  font-size:15px;">
		                    <option value="0" selected>사용 안 함</option>
		                    <option value="1">스터디룸 5시간</option>
		                    <option value="2">스터디룸 10시간</option>
		                </select>
		                </div><br>
		                <div style="width: 38%; height: 240px; background-color: #eeb6a5; float: left; padding: 20px; position: relative; top: 50px; color: white;">
		           		    <section id="time"> 
		               		         시간 선택 박스<hr style="position:relative; bottom:8px;">
		                        <div id="timeBox" style="font-weight:400; position:relative; bottom:5px; font-size:13px;">
		                            <div class="check" style="width:100%; height:30%; display:inline; color:dimgray;">
		                            <label for="ten" id="checkborder1">10:00~11:00
		                            <div style="width:30%; height:90%; display:inline;    visibility:hidden;    ">
		                            <input type="checkbox" name="ck" id="ten" class="timeCk" value="10:00~11:00">
		                            </div>
		                            </label>
		                            <label for="eleven" id="checkborder2">11:00~12:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="eleven" class="timeCk" value="11:00~12:00">
		                            </div>
		                            </label>
		                            <label for="twelve" id="checkborder3">12:00~13:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="twelve" class="timeCk" value="12:00~13:00">
		                            </div>
		                            </label>
		                            <label for="Thirt" id="checkborder4">13:00~14:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="Thirt" value="10:00~11:00" >
		                            </div>
		                            </label>
		                             <label for="fourth" id="checkborder5">14:00~15:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="fourth" value="10:00~11:00">
		                            </div>
		                            </label>
		                             <label for="fifth" id="checkborder6">15:00~16:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="fifth" value="10:00~11:00" >
		                            </div>
		                            </label>
		                             <label for="sixth" id="checkborder7">16:00~17:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="sixth" value="10:00~11:00" >
		                            </div>
		                            </label>
		                             <label for="seventh" id="checkborder8">17:00~18:00
		                            <div style="width:30%; height:90%; display:inline; visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="seventh" value="10:00~11:00" >
		                            </div>
		                            </label>
		                             <label for="eighth" id="checkborder9">18:00~19:00
		                            <div style="width:30%; height:90%; display:inline; visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="eighth" value="10:00~11:00">
		                            </div>
		                            </label>
		                            <label for="ninth" id="checkborder10">19:00~20:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="ninth" value="10:00~11:00" >
		                            </div>
		                            </label>
		                            <label for="ninth" id="checkborder11">20:00~21:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="ninth" value="10:00~11:00" >
		                            </div>
		                            </label>
		                            <label for="ninth" id="checkborder12">21:00~22:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="ninth" value="10:00~11:00" >
		                            </div>
		                            </label>
		                            </div>
		                        </div>
		                    </section>
		                </div>
		                <div style="width: 24%; height: 40px; background-color: #eeb6a5; float: left; padding: 10px; position: relative; top: 70px; color: white; text-align:left; padding-left:30px; line-height:1.4;">
		                총액 : <input type="text" style="border:none; width:40px; background-color: #eeb6a5; color:white;" id="count" name="count">원
		                </div>
		                <button onclick="location.href='reserveInsert.do'" style="width: 100px; height: 35px; background-color: #FF7C6D; border: none; float: left; position: relative; top: 75px; left: 30px; color: white; font-size:14px; border-radius:5px;">
		                예약하기
		                </button>
		                </div>
		                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		                <ul style="text-align: left; font-size:13px; font-weight: bolder; color:gray;">
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
