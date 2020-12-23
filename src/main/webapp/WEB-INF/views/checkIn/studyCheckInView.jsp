<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디룸 체크인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/other/checkIn.css">
<!-- <script src="../../../resources/js/jquery.min.js"></script> -->
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	//현재시각 표시
	var clockStart = setInterval(function() {
		
		//현재시간 가져오기
		var today = new Date();
		//요일을 배열로, SUN=0
		var dayList = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT']
		
		//정보 가져오기
		var YY = today.getFullYear(); //연도
		var MM = today.getMonth()+1; //월
		var DD = today.getDate(); //일
		var dd = dayList[today.getDay()]; //요일
		var hh = addZero(today.getHours()); //시
		var mm = addZero(today.getMinutes()); //분
		var ss = addZero(today.getSeconds()); //초
		
		//태그에 넣기
		document.getElementById('year').innerText = YY
		document.getElementById('month').innerText = MM
		document.getElementById('date').innerText = DD
		document.getElementById('day').innerText = dd
		document.getElementById('hours').innerText = hh
		document.getElementById('min').innerText = mm
		document.getElementById('sec').innerText = ss
	
		//시분초가 1자리일때, 앞에 0을 붙여주기
		function addZero(num) {
			return (num < 10 ? '0'+num : ''+num);
		}
	//setInterval : 1000ms = 1초에 한번씩 호출
	}, 1000);


</script>

</head>
<body>
<script>
	$(function(){
	    var responseMessage = "<c:out value="${msg}"/>";
	    if(responseMessage != ""){
	        alert(responseMessage)
	    }
	}) 
</script>
	<div id="wrapper">
		<div id="main_section">
			<p id="title" align="center">스터디룸 체크인</p>
			
			<div id="inputSection" align="center">
				<form class="form-inline">
					<div class="form-group">
			 			<input type="text" class="form-control" id="inputMemberId" name="memberId" placeholder="아이디를 입력하세요.">
						<button type="button" class="btn btn-danger btn-lg" data-toggle="modal" data-target="#myModal" id="searchBtn" >검색</button>
			        </div>
				</form>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
					<div class="modal-dialog modal-dialog-centered" role="document"align="center"> 
						<div class="modal-content">
							<form action="checkSelectStudy.do" method="get">
								<div class="modal-header"> 
									<h3 class="modal-title">체크인 시간 선택</h3>
								</div> 
								<div class="modal-body">
								<%-- <c:forEach items="${checkStudy }" var="checkStudy">
									<div class="checkbox">
									  <label>
									    <input type="checkbox" value="rNo88" name="studyCheck"> ${checkStudy.rTime }
									  </label>
									  <label>
									    <input type="checkbox" value="rNo89"> ${checkStudy.rTime }
									  </label>
									</div>
								</c:forEach> --%>
								</div> 
								<div class="modal-footer">
									<button type="submit" class="btn btn-danger">Select</button> 
									<button type="reset" class="btn btn-secondary" data-dismiss="modal">Close</button>									
								</div> 
							</form>
						</div> 
					</div> 
				</div> 
				<br>
			</div>
			<!-- 현재시각 출력 -->
			<div class="clock">
				<span id="year"></span>
				<span>. </span>
				<span id="month"></span>
				<span>. </span>
				<span id="date"></span>
				<span>. </span>
				<span id="day"></span>
				<span> </span>
				<span id="hours"></span>
				<span>:</span>
				<span id="min"></span>
			</div>
			<br>
		</div>
	</div>
	
<script>

	$(document).ready(function(){
		$("#searchBtn").on("click", function() {
			/* alert("test"); */
			var memberId = $("#inputMemberId").val();
		  	$.ajax({
				url : 'checkIdStudy.do',
				type : 'get',
				data : {"memberId" : memberId},
				dataType : "json",
				async : false,
				success : function(data) {
					
					$divBody = $(".modal-body");
					$divBody.html("");
					
					var $forEach;
					var $data;
					var $label;
					var $input;
					
					if(data.length > 0){
						$div = $("<div class='checkbox'>");
						$divBody.append($div);
						for(var i in data){
							$label = $("<label>");
							$divBody.append($label);
							$input = $("<input type='checkbox' value='"+data[i].rNo+"' name='studyCheck'>");
							$label.append($input);
							$label.append(" "+decodeURIComponent(data[i].rTime));
							$divBody.append("<br>");
						} 
					}else {
						$divBody.append("예약된 정보가 없습니다.");
					}
					
				}
			}); 
		});

	});
	
	
</script>
</body>
</html>