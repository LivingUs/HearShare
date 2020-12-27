<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/other/ticket.css">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(document).ready(function() { 
	//Tab 테이블
	(function ($) { 
		$('.tab ul.tabs').addClass('active').find('> li:eq(0)').addClass('current');
		
		$('.tab ul.tabs li a').click(function (g) { 
			var tab = $(this).closest('.tab'), 
				index = $(this).closest('li').index();
			
			tab.find('ul.tabs > li').removeClass('current');
			$(this).closest('li').addClass('current');
			
			tab.find('.tab_content').find('div.tabs_item').not('div.tabs_item:eq(' + index + ')').slideUp();
			tab.find('.tab_content').find('div.tabs_item:eq(' + index + ')').slideDown();
			
			g.preventDefault();
		} );
	})(jQuery);
	
	//selectBox
    setDateBox();
 
    // select box 연도 , 월 표시
    function setDateBox(){
        var dt = new Date();
        var year = "";
        var com_year = dt.getFullYear();
        // 발행 뿌려주기
        $("#year").append("<option value=''>년도</option>");
        // 올해 기준으로 -1년부터 +5년을 보여준다.
        for(var y = (com_year-1); y <= (com_year+5); y++){
           $("#year").append("<option value='"+ y +"'>"+ y +"</option>");
        }
        // 월 뿌려주기(1월부터 12월)
        var month;
        $("#month").append("<option value=''>월</option>");
        for(var i = 1; i <= 12; i++){
        	if(i < 10){
            	$("#month").append("<option value='0"+ i +"'>0"+ i +"</option>");
        	} else {
            	$("#month").append("<option value='"+ i +"'>"+ i +"</option>");
        	}
            /* <option value="1">1</option> */
        }
    }
	
	
});	

</script>

<body>
<br>
	<div id="wrapper">
        
		<!-- Nav -->
		<jsp:include page="../common/menuBar.jsp"></jsp:include>
        <br>
        <br>
		<div id="main">
			<article id="ticket" class="panel intro">
				<header>
					<h3 style="float: left; width: 30%; font-weight: bold; font-family: 'Jal_Onuel';">&nbsp;Theme Ticket</h3>
					    <nav id="smallnav">
					        <a href="#mypage" onclick=""><i class="fas fa-user-edit"></i></a> 
					        <a href="#ticket" onclick="location.href='payAllList.do'"><i class="fas fa-ticket-alt"></i></a> 
					        <a href="#autoPay" onclick="location.href='autoPayList.do'"><i class="far fa-credit-card"></i></a> 
					        <a href="#chart" onclick="location.href='accountList.do'"><i class="fas fa-chart-bar"></i></a> 
					    </nav>
					    <hr>
				</header>
	<section>
	<div id="main_section">
		<div id="top_section">
			<div class="title_tabs" onclick="location.href='payAllList.do'">스터디룸</div>
			<div class="title_tabs"onclick="location.href='healthPay.do'">헬스룸</div>
		</div>
			<div id="health_section">
				<div id="content_section">
			<div id="mid_1" class="mid"><img src='../../resources/images/health.jpg' style="width:380px;"></div>
			<div id="mid_2" class="mid">
				<p id="p_text">현재 정기권이 <br><br><span style="font-size : 50px; font-weight: 900">
						<c:if test="${healthTicket.tYn ne null}">
							${healthTicket.tYn }
						</c:if>
						<c:if test="${healthTicket.tYn eq null}">
							0
						</c:if>
					</span>개 남았습니다.</p><br>
				<a class="btn btn-outline-danger" href="#" role="button" style="margin-left:10px; padding:10px; width:120px;">테마룸 예약</a>&nbsp;&nbsp;
				<a class="btn btn-outline-danger" href="#Buy_main" role="button" style="padding:10px; width:120px;">정기권 구매</a>
			</div>
		</div>
		<div id="tb_ticket">
			<div class="tab">
				<ul class="tabs">
					<li><a href="#">사용내역</a></li>
					<li><a href="#">결제내역</a></li>
				</ul>
				<div class="tab_content">
					<div class="tabs_item">
						<div id="select_date">
						<form action="healthSelect.do" method="get">
							<select name="year" id="year" title="년도" class="select_date"></select>년   
	            			<select name="month" id="month" title="월" class="select_date"></select>월 
							<input class="btn btn-outline-danger" type="submit" value="검색" style="width:70px; margin-top:-3px; height:35px;">
						</form>
						</div>
						<div id="reserve_tb">
							<table class="table">
								<tr>
									<th>No.</th>
									<th>일시</th>
									<th>사용갯수</th>
								</tr>
								<c:if test="${!empty healthPay }">
									<c:forEach items="${healthPay }" var="healthPay" varStatus="status">
										<tr>
											<td>${status.count }</td>
											<td>${healthPay.rDate }</td>
											<td>${healthPay.rTime }</td>
										</tr>
									</c:forEach>
								</c:if>
								<c:if test="${empty healthPay }">
									<tr>
										<td colspan="3">조회된 정보가 없습니다.</td>
									</tr>
								</c:if>
							</table>
						</div>
					</div>
					<div class="tabs_item">
						<iframe src="healthTicketList.do" style="width:100%; height:211px; border:none;">
						</iframe>
					</div> 
				</div>
			</div> 
		</div>
		</div>
	</div>
	
		<br><br><br><br>
	<div id="Buy_main">
		<div id="Buy_text">
			<h2 align="center">정기권 구매하기</h2>
			<hr>
			<p>테마룸(헬스룸)의 정기권을 구매할 수 있습니다.<br>
				정기권 구매 시, 예약시에 따로 결제할 필요 없이 정기권에서 차감결제 됩니다.<br>
				10/20/50/100시간 단위로 구매 가능하며, 기본금액에서 20% 할인됩니다.
			</p>
		</div>
		<div id="buy_content">
			<div class="buy_study">
				<div class="study_pic">
					<img src='../../resources/images/health.jpg'>
				</div>
				<div class="study_submit">
					<div class="radio">
							  <label>
								<input type="radio" name="tPriceNo" id="health10" value="10" checked><b>&nbsp;&nbsp;10</b>시간권 &nbsp;&nbsp;<b>4,000</b>원
							  </label>
								<label>
								<input type="radio" name="tPriceNo" id="health10" value="20"><b>&nbsp;&nbsp;20</b>시간권 &nbsp;&nbsp;<b>8,000</b>원
							  </label>
								<label>
								<input type="radio" name="tPriceNo" id="study50" value="50"><b>&nbsp;&nbsp;50</b>시간권 &nbsp;<b>20,000</b>원
							  </label>
								<label>
								<input type="radio" name="tPriceNo" id="study100" value="100"><b>100</b>시간권 &nbsp;<b>40,000</b>원
							  </label><br>
							<button class="btn btn-outline-danger" id="payModule" type="button" onclick="return getPayModuleHealth();" style="width:120px; padding:10px; margin-top:20px; margin-left:40px;">구매하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
			
	<script>
		//study 구매
	    function getPayModuleHealth() {
	        var IMP = window.IMP;
	        IMP.init('imp60714204');
	        var msg;
	        var $tPriceNo = $(':radio[name="tPriceNo"]:checked').val();
	        
	        IMP.request_pay({
	            pg : 'html5_inicis',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name :  'HearShare 헬스룸 정기권 구매',
	            amount : $tPriceNo*400,
	            buyer_email : 'hearShare@naver.com',
	            buyer_name : '${loginUser}'
	        }, function(rsp) {
	            if ( rsp.success ) {
	            	$.ajax({
	            		url : "insertHealthTicket.do",
	            		type : "POST",
	            		data : {"tPriceNo" : $tPriceNo},
	            		success : function(data) {
	            			alert("결제에 성공하였습니다");
	            			location.href="healthPay.do"
	            		}
	            	})
	            } else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                alert(msg);
	                return false;
	            }
	        });
	    }
	</script>
	
		</section>
		</article>
		</div>
		</div>
    <!-- script -->
    <script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
</body>
</html>