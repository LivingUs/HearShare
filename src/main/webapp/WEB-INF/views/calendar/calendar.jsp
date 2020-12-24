<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 공통으로 쓰는 라이브러리 -->
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/calendar/calendar.css" />
<!-- 아이콘 임포트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<!-- jQuery -->
<script type="text/javascript"src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
   
<script>
var moment;
var moList = [];
/* today List - ajax */
	var d = new Date();

	var month = d.getMonth()+1;
	var day = d.getDate();

	var output = d.getFullYear() + '-' +
	    (month<10 ? '0' : '') + month + '-' +
	    (day<10 ? '0' : '') + day;
	
	if(moment == null) {
	 moment = output;
	 
	 $.ajax({
    	 url : "reserveToday.do",
    	 dataType : "json",
    	 type : "get",
    	 data : {
    		 "today" : moment
    	 },
    	 success : function(data) {
    			 var $ul = $("#dayList");
        		 $ul.empty();
    		 if(data.length>0) {
    		 for(var i in data){
    			 console.log(data[i].rTime);
    			 var rCode = data[i].rCode;
    			 var $li;
    			 
    			 if(rCode == 'S') {
    				 $li =  $("<li>").text(data[i].rTime + "시 스터디룸");
    				 $ul.append($li);
    			 } else if(rCode == 'H') {
    				$li =  $("<li>").text(data[i].rTime + "시 헬스룸");
   				 $ul.append($li);
    			 } else if(rCode =='B' ) {
    				$li =  $("<li>").text("바베큐장 예약");
   				 $ul.append($li);
    			 } else {
    				 $li =  $("<li>").text("'"+data[i].rCode+"'"+" 모임");
   					 $ul.append($li);
    			 }
    		 }
    	 }
  	}
});
 }

	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar2');
		var calendar2 = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			defaultView : 'dayGridMonth',
			defaultDate : new Date(),
			height: 550,
			//날짜 선택시 셀 CSS 변경, 날짜 유효성 검사 후 데이터 다르면 원상복귀
			dateClick : function(info) {
		     	 moment = info.dateStr;	//오늘 날짜 데이터 
			     moList.push(moment);	//처음 누른 날짜, 다음 누른 날짜 비교해서 배경 변경
			     
			      $('[data-date='+moment+']').css({"backgroundColor": "#fff1b9"});
			     for (var i = 0; i < moList.length; i++) {
			             for (var j = 0; j < moList.length; j++) {
			            	 if(moList[i] != moList[j]) {
			            		 $('[data-date='+moList[j]+']').css({"backgroundColor": "white"});
			            		 $('[data-date='+moList[i]+']').css({"backgroundColor": "#fff1b9"});
			            		 moList.clear;
			            	 }
			             }
			         };
			         
			         /* today List - ajax */
			     	var d = new Date();

			     	var month = d.getMonth()+1;
			     	var day = d.getDate();

			     	var output = d.getFullYear() + '-' +
			     	    (month<10 ? '0' : '') + month + '-' +
			     	    (day<10 ? '0' : '') + day;
			     	
			     	console.log(moment);
			     	if(moment == null) {
			        	 moment = output;
			         }
			         
			         $.ajax({
			        	 url : "reserveToday.do",
			        	 dataType : "json",
			        	 type : "get",
			        	 data : {
			        		 "today" : moment
			        	 },
			        	 success : function(data) {
			        			 var $ul = $("#dayList");
				        		 $ul.empty();
			        		 if(data.length>0) {
			        		 for(var i in data){
			        			 console.log(data[i].rTime);
			        			 var rCode = data[i].rCode;
			        			 var $li;
			        			 
			        			 if(rCode == 'S') {
			        				 $li =  $("<li>").text(data[i].rTime + "시 스터디룸");
			        				 $ul.append($li);
			        			 } else if(rCode == 'H') {
			        				$li =  $("<li>").text(data[i].rTime + "시 헬스룸");
			       				 $ul.append($li);
			        			 } else if(rCode =='B' ) {
			        				$li =  $("<li>").text("바베큐장 예약");
			       				 $ul.append($li);
			        			 } else {
			        				 
			        			 }
			        		 }
			        	 }
			      	}
				});
			         
		         $(function(event, jsEvent, view) {
		             $('#modalTitle').html(event.title);
		             $('#modalBody').html(event.description);
		             $('#eventUrl').attr('href',event.url);
		             $('#calendarModal').modal();
		         });
			},
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'today'
			},
			eventLimit: true,
			views: {
			    timeGrid: {
			      eventLimit: 3
			    }
			  },
	        eventLimitText: "more",
	        eventLimitClick: "popover",
	        editable: false,
	        droppable: false,
	        dayPopoverFormat: { year: 'numeric', month: 'long', day: 'numeric' },
	        
	        /* db예약 리스트 출력 */
	        events:function(info, successCallback, failureCallback){
	            $.ajax({
	                   url: 'reserveMyList.do',
	                   dataType: 'json',
	                   success: 
	                       function(result) {
	 
	                           var events = [];
	                          
	                           if(result!=null){
	                               
	                                   $.each(result, function(index, element) {
	                                	   
	                                    var startdate=element.rDate;
	                                    var rCode = element.rCode;
	                                    
	                                    // realmname (분야) 분야별로 color 설정
	                                    if (rCode == "S"){
	                                        events.push({
	                                               title: element.rTime + " 스터디룸 예약",
	                                               start: startdate,
                                                   color:"#feee7d"                                                   
	                                            }); //.push()
	                                    }
	                                                                        
	                                    else if (rCode == "H"){
	                                        events.push({
	                                               title: element.rTime + " 헬스룸 예약",
	                                               start: startdate,
                                                   color:"#ef5285"                                                   
	                                            }); //.push()
	                                    }
	                                    
	                                    else if (rCode == "B"){
	                                        events.push({
	                                               title: "바베큐장 예약",
	                                               start: startdate,
	                                               color:"#60c5ba"                                                   
	                                            }); //.push()
	                                    }
	                                    
	                                    else{
	                                        events.push({
	                                               title: element.title,
	                                               start: startdate,
	                                               color:"#ff3399"                                                   
	                                            }); //.push()
	                                    }
	                                    
	                               }); //.each()
	                               
	                               console.log(events);
	                               
	                           }//if end                           
	                           successCallback(events);                               
	                       }//success: function end                          
	            }); //ajax end
	        } //events:function end
		});
		calendar2.render();
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

/* 이 페이지 Style */
	ul>li {
		margin-left : 20px;
		margin-bottom:3px;
		font-family:NIXGONM-Vb;
	}

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
		    <h3 style="float: left; width: 30%; font-weight: bold; font-family:Jal_Onuel;">&nbsp;Calendar</h3>
		    <nav id="smallnav">
		        <a href="studyReserve.do"><i class="far fa-calendar-check"></i></a>
		        <a href="calendar.do"><i class="far fa-calendar-alt"></i></a>
		    </nav>
		    <hr>
		</header><br><br>
		<section> <!--섹션 부분 수정-->
		    <div>
		        <div id="myCalendar" style="border-radius:5px; width:95%; height:700px; text-align: center; background-color:rgb(255, 229, 226); margin:auto; padding:40px; padding-left:20px; position:relative; left:10px;">
		            <div id="today" style=" width:23%; height:60%; margin-top:120px; float:left; background-image: url(../resources/images/핑크메모.png); background-repeat: no-repeat; background-size:100% 100%; padding-top:100px;">
		                <span style="font-size:21px; font-family:NIXGONM-Vb; font-weight:bold; color:black; border-bottom:1px solid gray;"><i class="far fa-check-square"></i>TODAY LIST</span><br><br>
		                <ul id="dayList" style="font-size:15px; text-align: left; marign-right:70px; color:gray;">
		                    <%-- <c:forEach items="${rToday }" var="rToday">
		                    	<c:if test="${rToday.rCode eq 'S' }">
		                    		<li>${rToday.rTime }시 스터디룸</li>
		                    	</c:if>
		                    	<c:if test="${rToday.rCode eq 'H' }">
		                    		<li>${rToday.rTime }시 헬스룸 예약</li>
		                    	</c:if>
		                    	<c:if test="${rToday.rCode eq 'B' }">
		                    		<li>바베큐장 예약</li>
		                    	</c:if>
		                    </c:forEach> --%>
		                </ul>
		            </div>
		            <div id="calendar2" style="font-family:NIXGONM-Vb; border:20px solid white; background-color:white; width:75%; height:100%; float:right; text-align: center;">
		            </div>
		        <span style="font-size:13px; float:right; margin-left:10px; position:relative; top:30px; right:20px;"><i class="fas fa-square-full" style="color:#feee7d;"></i>&nbsp;&nbsp;스터디룸&nbsp;&nbsp;&nbsp; <i class="fas fa-square-full" style="color:#ef5285;"></i>&nbsp;&nbsp;헬스룸&nbsp;&nbsp;&nbsp;
		        <i class="fas fa-square-full" style="color:#60c5ba;"></i>&nbsp;&nbsp;바베큐장&nbsp;&nbsp;&nbsp;<i class="fas fa-square-full" style="color:#a5dff9;"></i>&nbsp;&nbsp;참가한 모임&nbsp;&nbsp;&nbsp;
		        </span>
		        </div>
		        <br>
		        <div style=" text-align: right; font-size:13px; font-weight: bolder; margin-right:70px;">
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
				<div id="calendarModal" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true">×</span> <span class="sr-only">close</span>
								</button>
								<h4 id="modalTitle" class="modal-title"></h4>
							</div>
							<div id="modalBody" class="modal-body"></div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
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
