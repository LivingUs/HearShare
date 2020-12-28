<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 공통 script -->
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="../../../resources/css/reserve/reserve.css" />
<!-- fullCalendar -->
<link href='../resources/fullcal/core/main.css' rel='stylesheet' />
<link href='../resources/fullcal/daygrid/main.css' rel='stylesheet' />


<script>
var today;
var moList = [];


/* today List - ajax */
	var d = new Date();

	var month = d.getMonth()+1;
	var day = d.getDate();

	var output = d.getFullYear() + '-' +
	    (month<10 ? '0' : '') + month + '-' +
	    (day<10 ? '0' : '') + day;
	
	if(today == null) {
	today = output;
	 
	 $.ajax({
    	 url : "reserveToday.do",
    	 dataType : "json",
    	 type : "get",
    	 data : {
    		 "today" : today
    	 },
    	 success : function(data) {
    			 var $ul = $("#dayList");
        		 $ul.empty();
    			 var $li;
    			 
    		 if(data.length>0) {
    		 for(var i in data){
    			 console.log(data[i].rTime);
    			 var rCode = data[i].rCode;
    			 
    			 
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
    	 } else {
    		 $li =  $("<li>").text("일정이 없습니다.");
			 $ul.append($li);
    	 }
  	}
});
}
	document.addEventListener('DOMContentLoaded', function() {
        
		var calendarEl = document.getElementById('calendar2');
		var calendar2 = new FullCalendar.Calendar(calendarEl, {
			plugins : ['interaction', 'dayGrid', 'timeGrid'],
			defaultView : 'dayGridMonth',
			defaultDate : new Date(),
			height: 570,
			//날짜 선택시 셀 CSS 변경, 날짜 유효성 검사 후 데이터 다르면 원상복귀
			dateClick : function(info) {
				var d = new Date();

				var month = d.getMonth()+1;
				var day = d.getDate();

				var output = d.getFullYear() + '-' +
				    (month<10 ? '0' : '') + month + '-' +
				    (day<10 ? '0' : '') + day;	//오늘 날짜 데이터
				
		     	 today = info.dateStr;	//누른 날짜 데이터
			     moList.push(today);	//처음 누른 날짜, 다음 누른 날짜 비교해서 배경 변경
			     
			      $('[data-date='+today+']').css({"backgroundColor": "#fc9d9a"});
			     for (var i = 0; i < moList.length; i++) {
			             for (var j = 0; j < moList.length; j++) {
			            	 if(moList[i] != moList[j]) {
			            		 if(moList[j]!=output) {
			            			 $('[data-date='+moList[i]+']').css({"background": "#fc9d9a"});
			            			 $('[data-date='+moList[j]+']').css({"background": "none"});
			            		 } else {
			            			 $('[data-date='+moList[i]+']').css({"background": "#fc9d9a"});
			            			 $('[data-date='+moList[j]+']').css({"background": "#fcf8e3"});
			            		 }
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
			     	
			     	console.log(today);
			     	if(today == null) {
			     		today = output;
			         }
			         
			         $.ajax({
			        	 url : "reserveToday.do",
			        	 dataType : "json",
			        	 type : "get",
			        	 data : {
			        		 "today" : today
			        	 },
			        	 success : function(data) {
			        			 var $ul = $("#dayList");
				        		 $ul.empty();
			        			 var $li;
			        			 var momentStr = today.substring(8,10);
			        			 
			        			//월세 납부일자 등록
			        			 if(momentStr==1) {
			        				 $li =  $("<li style='color:red; font-weight:bolder;'>").text("월세 납부일");
			        				 $ul.append($li);
			        			 }
			        			 
			        		 if(data.length>0) {
			        		 for(var i in data){
			        			 var rCode = data[i].rCode;
			        			 
			        			 if(rCode == 'S') {
			        				 $li =  $("<li>").text(data[i].rTime + "시 스터디룸");
			        				 $ul.append($li);
			        			 } else if(rCode == 'H') {
			        				$li =  $("<li>").text(data[i].rTime + "시 헬스룸");
			       				 $ul.append($li);
			        			 } else if(rCode =='B' ) {
			        				$li =  $("<li>").text("바베큐장 예약");
			       				 $ul.append($li);
			        			 }
			        		 }
			        	 } else {
			        		 $li =  $("<li>").text("일정이 없습니다.");
			    			 $ul.append($li);
			        	 }
			      	}
				});	//날짜 클릭시 today List 출력
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
	        events: function(info, successCallback, failureCallback){
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
	                                    var rNo = element.rNo;
	                                    
	                                    // realmname (분야) 분야별로 color 설정
	                                    if (rCode == "S"){
	                                        events.push({
	                                               title: element.rTime + " 스터디룸 예약",
	                                               start: startdate,
	                                               contents : rNo,
	                                               rCode: rCode,
                                                   color:"#feee7d"                                                   
	                                            }); //.push()
	                                    }
	                                                                        
	                                    else if (rCode == "H"){
	                                        events.push({
	                                               title: element.rTime + " 헬스룸 예약",
	                                               start: startdate,
	                                               contents : rNo,
	                                               rCode: rCode,
                                                   color:"#ef5285"                                                   
	                                            }); //.push()
	                                    }
	                                    
	                                    else if (rCode == "B"){
	                                        events.push({
	                                               title: "바베큐장 예약",
	                                               start: startdate,
	                                               contents : rNo,
	                                               rCode: rCode,
	                                               color:"#60c5ba"                                                   
	                                            }); //.push()
	                                    } else if (rCode == "Y" || rCode == "N") {
	                                    	var newdate = startdate.substring(0,7)+'-01';
	                                    	 events.push({
	                                               title: "월세 납부일",
	                                               start: newdate,
	                                               contents : rNo,
	                                               rCode: rCode,
	                                               color:"#E71D36"                                                   
	                                            }); //.push()
	                                    } else {
	                                    	 events.push({
	                                               title: "모임 참가일",
	                                               start: startdate,
	                                               contents : rNo,
	                                               rCode: rCode,
	                                               color:"#a5dff9",
	                                               repeat:1
	                                            }); //.push()
	                                    }
	                            	   }); //.each()
	                           }//if end                           
	                           successCallback(events); 
	                           console.log(events);
	                       }//success: function end                          
	            }); //ajax end
	        }, //events:function end
	        eventClick: function(info) {
	        	var eventObj = info.event;
	        	var startDate = moment(eventObj.start).format('YYYY-MM-DD');
	        	var mpCode = eventObj.extendedProps.rCode;
	        	
	        	if(eventObj.title=="월세 납부일") {
	        		if(startDate>output) {
	        			alert("이번 달 납부만 가능합니다.");
	        		} else {
	        	 		$('.modalBtn2').trigger('click');
		        		$('#modalBox2').find('#title').val(eventObj.title);
		        		$('#modalBox2').find('#date').val(moment(eventObj.start).format('YYYY/MM/DD'));
		        		$('#modalBox2').find('#mpNo').val(eventObj.extendedProps.contents);
		        		if(mpCode=="N") {
		        			$('#modalBox2').find('#mpStatus').val("미납");
		        		} else {
		        			$('#modalBox2').find('#mpStatus').val("납부 완료");
		        		}
	        		}
	        	} else {
	        		$('.modalBtn').trigger('click');
		        	$('#modalBox').find('#title').val(eventObj.title);
		        	$('#modalBox').find('#date').val(moment(eventObj.start).format('YYYY/MM/DD'));
		        	$('#modalBox').find('#calNo').val(eventObj.extendedProps.contents);
		        	$('#modalBox').find('#calCode').val(eventObj.extendedProps.rCode);
	        	}
            }
        });//calendar end
		calendar2.render();
	});
	
	/* 일정 삭제 펑션 */
	function calDelete() {
		var calNo = $("#calNo").val();
		var calTitle = $("#title").val();
		var calCode = $("#calCode").val();
		
		/* 삭제 가능한 것만 유효성 검사 */
		if(calCode=='S'||calCode=='H'||calCode=='B'){
			$.ajax({
				url:"calDelete.do",
				type:"get",
				data : {
					"calNo" : calNo
				},
				success  :  function(data){
	                if(data == "ok") {
	                	alert("삭제되었습니다.");
	                    location.replace("calendar.do");
	                } else {
	                	alert("이용하신 예약은 취소하실 수 없습니다.");
	                }
	            },
	            error  :  function(request, status, error){
	                console.log("AJAX_ERROR");
	            }
			})
		} else {
			alert("예약하신 일정만 취소가 가능합니다.");
		}
		
	}
	
	function monthInsert() {
		if($("#mpStatus").val()=="납부 완료"){
			alert("이미 납부를 완료하셨습니다.");
			return false;
		} else {
		var href = "monthpayView.do?mpNo="+$("#mpNo").val();
		location.href=href;			
		}
	}
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
	#nav a:nth-child(3) {
    opacity: 1.0;
	}
	
	#nav a:nth-child(3):after {
	   opacity: 1.0;
	    border-bottom-width: 0.5em;
	}
	ul>li {
		margin-left : 20px;
		margin-bottom:3px;
		font-family:NIXGONM-Vb;
	}
	.fc-sun {color:#e31b23}
	.fc-sat {color:#007dc3}
	.fc-scroller {
	 	overflow-y: hidden !important;
	}
	.input-group {
		width: 300px;
		margin-left:20px;
		margin-top:10px;
	}
	input {
		margin-left:20px;
	}
	.inputSpan {
		font-weight : bolder;
	}
	
	/* modal Effect */
	.modal.fade .modal-dialog{
	  -webkit-transform: translate(0,0);
	  transform: translate(0,0);
	}

.zoom-in {
  transform: scale(0)!important;
  opacity: 0;
  -webkit-transition: 1.0s all 0s;
  -moz-transition: 0.8s all 0s;
  -ms-transition: 0.8s all 0s;
  -o-transition: 0.8s all 0s;
  transition: 0.8s all 0s;
  display: block !important;
}

.zoom-in.show {
  opacity: 1;
  transform: scale(1)!important;
  transform:none;
} */
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
		    <h3 style="float: left; width: 30%; font-weight: bold; font-family:Jal_Onuel;">&nbsp;My Calendar</h3>
		    <nav id="smallnav">
		        <a href="studyReserve.do" class="far fa-calendar-check"><span>테마룸 예약</span></a>
		        <a href="calendar.do" class="far fa-calendar-alt"><span>나의일정</span></a>
		    </nav>
		    <hr>
		</header><br><br>
		<section> <!--섹션 부분 수정-->
		    <div>
		        <div id="myCalendar" style="border-radius:5px; width:95%; height:700px; text-align: center; background-color:rgb(255, 229, 226); margin:auto; padding:30px; padding-left:20px; position:relative; left:10px;">
		            <div id="today" style=" width:23%; height:60%; margin-top:120px; float:left; background-image: url(../resources/images/핑크메모.png); background-repeat: no-repeat; background-size:100% 100%; padding-top:100px;">
		                <span style="font-size:21px; font-family:NIXGONM-Vb; font-weight:bold; color:black; border-bottom:1px solid gray;"><i class="far fa-check-square"></i>TODAY LIST</span><br><br>
		                <ul id="dayList" style="font-size:15px; text-align: left; marign-right:70px; color:gray;">
		                </ul>
		            </div>
		            <div id="calendar2" style="font-family:NIXGONM-Vb; border:20px solid white; background-color:white; width:75%; height:100%; float:right; text-align: center;">
		            </div>
		        <span style="font-size:13px; float:right; margin-left:10px; position:relative; top:20px; right:20px;"><i class="fas fa-square-full" style="color:#feee7d;"></i>&nbsp;&nbsp;스터디룸&nbsp;&nbsp;&nbsp; <i class="fas fa-square-full" style="color:#ef5285;"></i>&nbsp;&nbsp;헬스룸&nbsp;&nbsp;&nbsp;
		        <i class="fas fa-square-full" style="color:#60c5ba;"></i>&nbsp;&nbsp;바베큐장&nbsp;&nbsp;&nbsp;<i class="fas fa-square-full" style="color:#a5dff9;"></i>&nbsp;&nbsp;참가한 모임&nbsp;&nbsp;&nbsp;
		        </span>
		        </div>
		        <br>
		        <div style=" text-align: right; font-size:13px; font-weight: bolder; margin-right:70px;">
		            <span style="color:red;">※이용을 하지 않은 예약</span> 에 한해서만 예약 취소가 가능합니다.<br>환불을 원하시는 분은 꼭 해당 일정을 눌러 취소해 주세요.
		        </div>
		        <br><br><br>
		        <u style="position:relative; bottom:110px; left:70px; font-size:13px; font-weight:bolder; color:dimgray;">*월세 결제를 원하시는 분은 납부 일정을 클릭해 주세요!</u>
		        <br><br><br><br><br><br>
		        <p style="text-align: right; font-size: 18px; font-weight:600; position: relative; right: 35px;">월세 정기결제를 해지하고 싶다면?</p>
		        <button style="width: 300px; height: 40px; background-color: rgb(255, 186, 179); border: none; float: right; color: white; margin-right:30px; border-radius:4px; font-weight:700;">
		         정기결제 해지하러 가기 &nbsp;&nbsp;<i class="fas fa-long-arrow-alt-right" style="font-size:25px; color:rgb(255, 124, 109);"></i>
		        </button><br><br><br><br>
		    </div>
		    
		    		<!-- 일정 삭제 모달 -->
		    		<button type="button" style="display:none;" class="btn btn-primary modalBtn" data-toggle="modal" data-target="#modalBox">
					  Launch static backdrop modal
					</button> 
					<!-- Modal -->
					<div class="modal zoom-in" id="modalBox" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel" style="font-weight:bolder; background: linear-gradient(to top, yellow 50%, transparent 50%);">일정 삭제</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="input-group input-group-sm mb-3">
									  <span class="inputSpan">일정 이름 : </span><input type="text" id="title" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
									</div>
									<div class="input-group input-group-sm mb-3">
									  <span class="inputSpan">일정 날짜 : </span><input type="text" id="date" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
									</div>
									<input type="hidden" id="calNo" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
									<input type="hidden" id="calCode" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-dark"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-danger" onclick="calDelete()">Delete</button>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 월세 결제 모달 -->
					<button type="button" style="display:none;" class="modalBtn2" data-toggle="modal" data-target="#modalBox2">
					</button> 
					<!-- Modal -->
					<div class="modal zoom-in" id="modalBox2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="staticBackdropLabel" style="font-weight:bolder; background: linear-gradient(to top, pink 50%, transparent 50%);">월세 결제</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="input-group input-group-sm mb-3">
									  <span class="inputSpan">일정 이름 : </span><input type="text" id="title" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
									</div>
									<div class="input-group input-group-sm mb-3">
									  <span class="inputSpan">결제 날짜 : </span><input type="text" id="date" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
									</div>
									<div class="input-group input-group-sm mb-3">
									  <span class="inputSpan">납부 상태 : </span><input type="text" id="mpStatus" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
									</div>
									<input type="hidden" id="mpNo" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
									<input type="hidden" id="calCode" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm">
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline-dark"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" onclick="monthInsert()">Payment</button>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script src='../resources/fullcal/core/main.js'></script>
<script src='../resources/fullcal/daygrid/main.js'></script>
<script src='../resources/fullcal/interaction/main.js'></script>
<script src='../resources/fullcal/timegrid/main.js'></script>
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
</html>
