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
			//날짜 선택시 셀 CSS 변경, 날짜 유효성 검사 후 데이터 다르면 원상복귀
			dateClick : function(info) {
				var d = new Date();

				var month = d.getMonth()+1;
				var day = d.getDate();

				var output = d.getFullYear() + '-' +
				    (month<10 ? '0' : '') + month + '-' +
				    (day<10 ? '0' : '') + day;	//오늘 날짜 데이터
				
		     	 moment = info.dateStr;	//누른 날짜 데이터 
			     moList.push(moment);	//처음 누른 날짜, 다음 누른 날짜 비교해서 배경 변경
			     
			     if(moment<output) {
			    	 alert("이전 날짜는 선택하실 수 없습니다.");
			    	 return false;
			     }
			     
			      $('[data-date='+moment+']').css({"backgroundColor": "#fc9d9a"});
			     for (var i = 0; i < moList.length; i++) {
			             for (var j = 0; j < moList.length; j++) {
			            	 if(moList[i] != moList[j]) {
			            		 if(moList[j]!=output) {
			            			 $('[data-date='+moList[i]+']').css({"backgroundColor": "#fc9d9a"});
			            			 $('[data-date='+moList[j]+']').css({"background": "none"});
			            		 } else {
			            			 $('[data-date='+moList[i]+']').css({"backgroundColor": "#fc9d9a"});
			            			 $('[data-date='+moList[j]+']').css({"background": "#fcf8e3"});
			            		 }
			            		 moList.clear;
			            	 }
			             }
			         }; 
			    		 var rCode = $("#rCode").val();
			     
			     //시간박스 유효성 검사 코드
			     var timeArr = [];
			     var timeId = [];
			        $("input[name='ck']").each(function(){
			        	timeArr.push($(this).val());
			        	timeId.push($(this).attr('id'));
			        });
			     
			     $.ajax({
			            url         :   "reserveList.do",
			            dataType: "json",
						type: "get",
			            data        :   {
			                "rCode" : rCode,
			                "date"	   : moment
			            },
			            success     :   function(data){
		                	$("input[name='ck']").each(function(){
	    			        	$(this).parent().parent().css("background-color", "white");
	    			        	$(this).parent().parent().css("color", "dimgray");
	    			        	$(this).attr("disabled", false); 
		    			    });
			                if(data.length>0){
			                	for(var i in data) {
			                		for(var j in timeArr) {
			                		if(data[i].rTime==timeArr[j]) {
			                			console.log(timeId[j]);
			                			$("#"+timeId[j]).attr("disabled", "true");
			                			$("#"+timeId[j]).parent().parent().css("background-color", "dimgray");
			                			$("#"+timeId[j]).parent().parent().css("color", "white");
			                		}
			                		}
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
	
    
    /* 시간선택박스 다중선택, 선택에 따른 총 금액 */
    $("input:checkbox[name='ck']").on("click", function() {
    /* 시간 박스 비교해서 활성화, 비활성화 */
   	var checkId = $(this).parent().parent().attr('id');
   	
    /* 시간박스 선택 효과 */
    if($("input:checkbox[name='ck']").is(":checked") == true) {
    	$("#"+checkId).css("background-color", "#f15c5c");
    	$("#"+checkId).css("color", "white");
    }
    /* 정기권, 시간 비교 */
    var tId = $(this).attr('id');
    var tNo = $("#ticketBox").val();
    var tUseNo = $("#tUseNo").val();
    var tPriceNo = $("#tPriceNo").val();
    if(tNo!=0) {
 	var tArr = [];
    $("input[name='ck']:checked").each(function(){
    	tArr.push($(this).val());
    });
    var tStock = tPriceNo - tUseNo;
    if(tArr.length>tStock) {
    	alert("정기권 수량을 확인해 주세요.");
    	$("#"+checkId).css("background-color", "white");
    	$("#"+tId).prop("checked", false);
    	console.log(tId);
    }
    }
	 /* 총 금액 */  
    var count = $("input:checkbox[name='ck']:checked").length * 500;
    $("#count").val(count);
    
   
 })
    
    
    /* 취소버튼 */
    $("#resetCk").click(function() {
    	var timeId = [];
        $("input[name='ck']:checked").each(function(){
        	timeId.push($(this).attr('id'));
        });
    	for(var i in timeId) {
    		/* if($("#"+timeId[i]).is(":abled")) { */
    			$($("#"+timeId[i])).prop("checked", false);
    			$($("#"+timeId[i])).parent().parent().css("background-color", "white");
    			$($("#"+timeId[i])).parent().parent().css("color", "dimgray");
    			$("#count").val(0);
    		/* } */
    	}
    });
});
    
    //  예약 인서트   //
 $(function() {
    $("#reserveSubmit").click(function() {
    	
    	var timeArr = [];
        $("input[name='ck']:checked").each(function(){
        	timeArr.push($(this).val());
        });
        
        /* var tStock = tPriceNo - tUseNo;
        if(timeArr.length>tStock) {
    		alert("정기권의 수량을 확인하여 주세요!");
    		return false;
    	} */
        
        
        var tNo = $("#ticketBox").val();
        var tUseNo = $("#tUseNo").val();
        var tPriceNo = $("#tPriceNo").val();
        if($("#ticketBox").val()!=0){
        //ajax로 데이터 보내줌
        $.ajax({
        	 url         :   "reserveInsert.do",
             traditional : true,
             type        :   "post",
             data        :   {
                 "tList" : timeArr,
                 "rCode" : "H",
                 "date"	   : moment,
                 "tPriceNo" : tPriceNo,
                 "tNo"   : tNo,
                 "tUseNo": tUseNo
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
        } else {
        	var total = $("#count").val();
        	
    //     결제 API       //
        	var IMP = window.IMP;
		    IMP.init('imp60714204');
		    var msg;
		    
		    IMP.request_pay({
		        pg : 'html5_inicis',
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name :	'HEAR:SHARE',
		        amount : 100,
		        buyer_email : 'eye5277@naver.com',
		        buyer_name : '입주민',
		        buyer_tel : '010-2538-5276',
		        buyer_addr : '서울시 종로구',
		        buyer_postcode : '123-456'
		    }, function(rsp) {
		        if ( rsp.success ) {
		            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
		            $.ajax({
			            url         :   "reserveInsert.do",
			            traditional : true,
			            type        :   "post",
			            data        :   {
			                "tList" : timeArr,
			                "rCode" : "H",
			                "date"	   : moment,
			                "tNo"   : tNo
			            },
			            success     :   function(data){
			                if(data == "OK") {
			                    location.href="calendar.do";
			                } else {
			                	location.href="common/errorPage.do";
			                }
			            }
		            })
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
   	#nav a:nth-child(3) {
    opacity: 1.0;
	}
	
	#nav a:nth-child(3):after {
	   opacity: 1.0;
	    border-bottom-width: 0.5em;
	}
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
		.fc-scroller {
 		  overflow-y: hidden !important;
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
    <input type="hidden" id="rCode" value="H">
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
		            <button id="btn_health" class="btn_calender" onclick="location.href='healthReserve.do'" style="background:#eeb6a5">헬스룸</button>
		            <button id="btn_bbq" class="btn_calender" onclick="location.href='bbqReserve.do'">바베큐장</button>
		        </div><br><br>
		        <div style="text-align: center;">
		            <div id="studyreservation" style="width:100%; display: inline-block; padding: 50px; text-align: center; position:relative; left:35px;">
		                <div id="calendar" style="font-family:NIXGONM-Vb; border:10px solid pink;border-radius:3px; width:50%; height: 100px; float: left; position:relative; top:-10px;"></div>
		                <div style="position:relative; top:3px;">
		                <div style="border: 1px solid lightgray; width: 1px; height: 430px; float: left; margin: 0px 30px 0px 30px; position: relative; top: 15px;"></div>
		                <div style="width: 38%; height: 120px; background-color: #eeb6a5; float: left; padding: 25px; border-radius:5px;">
		                <span style="float:left; color: white; margin-right:20px;">테마룸 종류 : </span>
		                <input type="text" style="width: 130px; text-align: center; float:left;  font-size:15px;" readonly value="헬스룸"><br><br>
		                <span style="color: white; float:left; margin-right:20px;">정기권 사용 : </span>
		                <select id="ticketBox" class="btn btn-secondary dropdown-toggle" style="width: 160px; background-color:#004e66; text-align: center; float:left;  font-size:15px; position:relative; bottom:5px;">
		                    <c:if test="${! empty tList }">
		                    <option value="0" selected>사용 안 함</option>
		                    	<option value="${tList.tNo }">헬스룸 ${tList.tPriceNo }시간권</option>
		                    	<%-- <input type="text" value="${tList.tNo }"> --%>
		                    	<input type="hidden" id="tUseNo" value="${tList.tUseNo }">
		                    	<input type="hidden" id="tPriceNo" value="${tList.tPriceNo }">
		                    </c:if>
		                    <c:if test="${ empty tList }">
		                    	 <option value="0" selected>정기권 없음</option>
		                    </c:if>
		                </select>
		                </div><br>
		                <div style="width: 38%; height: 260px; background-color: #eeb6a5; float: left; padding: 20px; position: relative; top: 50px; color: white; border-radius:5px;">
		           		    <section id="time"> 
		               		    <span style="position:relative; left50px;">시간 선택 박스</span>
		               
		               		    <hr style="position:relative; bottom:8px;">
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
		                            <div style="width:30%; height:90%; display:inline;   visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="twelve" class="timeCk" value="12:00~13:00">
		                            </div>
		                            </label>
		                            <label for="Thirt" id="checkborder4">13:00~14:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="Thirt" value="13:00~14:00" >
		                            </div>
		                            </label>
		                             <label for="fourth" id="checkborder5">14:00~15:00
		                            <div style="width:30%; height:90%; display:inline;   visibility:hidden;  ">
		                            <input type="checkbox" name="ck" id="fourth" value="14:00~15:00">
		                            </div>
		                            </label>
		                             <label for="fifth" id="checkborder6">15:00~16:00
		                            <div style="width:30%; height:90%; display:inline;   visibility:hidden;  ">
		                            <input type="checkbox" name="ck" id="fifth" value="15:00~16:00" >
		                            </div>
		                            </label>
		                             <label for="sixth" id="checkborder7">16:00~17:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="sixth" value="16:00~17:00" >
		                            </div>
		                            </label>
		                             <label for="seventh" id="checkborder8">17:00~18:00
		                            <div style="width:30%; height:90%; display:inline; visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="seventh" value="17:00~18:00" >
		                            </div>
		                            </label>
		                             <label for="eighth" id="checkborder9">18:00~19:00
		                            <div style="width:30%; height:90%; display:inline; visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="eighth" value="18:00~19:00">
		                            </div>
		                            </label>
		                            <label for="ninth" id="checkborder10">19:00~20:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="ninth" value="19:00~20:00" >
		                            </div>
		                            </label>
		                            <label for="twenty" id="checkborder11">20:00~21:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="twenty" value="20:00~21:00" >
		                            </div>
		                            </label>
		                            <label for="twentyone" id="checkborder12">21:00~22:00
		                            <div style="width:30%; height:90%; display:inline;  visibility:hidden; ">
		                            <input type="checkbox" name="ck" id="twentyone" value="21:00~22:00" >
		                            </div>
		                            </label>
		                            </div>
		                        </div>
		                        <span style="font-size:11px; float:left; margin-left:5px;"><i class="fas fa-square-full" style="color:white;"></i>&nbsp;예약 가능&nbsp;&nbsp;&nbsp; <i class="fas fa-square-full" style="color:dimgray;"></i>&nbsp;예약 완료</span>
		                    </section>
		                </div>
		                <div style="width: 24%; height: 40px; background-color: #eeb6a5; border-radius:5px; float: left; padding: 10px; position: relative; top: 70px; color: white; text-align:left; padding-left:30px; line-height:1.4;">
		                총액 : <input type="text" style="border:none; width:40px; background-color: #eeb6a5; color:white;" id="count" name="count">원
		                </div>
		                <button id="reserveSubmit" class="btn btn-outline-danger" style="width: 100px; height: 35px; float: left; position: relative; top: 75px; left: 30px; font-size:14px; border-radius:5px;">
		                예약하기
		                </button>
		                <button id="resetCk" class="btn btn-light" style="width: 80px; height: 30px; /* float: left; */  position: relative; bottom: 195px; right: 80px; font-size:12px; border-radius:5px;">
		             선택 해제
		                </button>
		                </div>
		                <br><br><br><br><br><br><br>
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
