<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/member/ticket.css">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
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
	
	//Tab 제목
	$(".tabgroup > div").hide();
	$(".tabgroup > div:first-of-type").show();
	$(".title_tabs a").click(function (e) {
	  e.preventDefault();
	  var $this = $(this),
		tabgroup = "#" + $this.parents(".title_tabs").data("tabgroup"),
		others = $this.closest("li").siblings().children("a"),
		target = $this.attr("href");
	  others.removeClass("active");
	  $this.addClass("active");
	  $(tabgroup).children("div").hide();
	  $(target).show();
	});

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
					<h3 style="float: left; width: 30%; font-weight: bold;">&nbsp;Theme Ticket</h3>
					    <nav id="smallnav">
					        <a href="#mypage" onclick=""><i class="fas fa-user-edit"></i></a> 
					        <a href="#ticket" onclick="location.href='payAllList.do'"><i class="fas fa-ticket-alt"></i></a> 
					        <a href="#autoPay"><i class="far fa-credit-card"></i></a> 
					        <a href="#chart"><i class="fas fa-chart-bar"></i></a> 
					    </nav>
					    <hr>
				</header>
	<section>
	<div id="main_section">
		<div id="top_section">
			<ul class="title_tabs clearfix" data-tabgroup="first-tab-group">
			  <li><a href="#study_section" class="active">스터디룸</a></li>
			  <li><a href="#health_section">헬스룸</a></li>
			</ul>
		</div>
		<section id="first-tab-group" class="tabgroup">
		<div id="study_section">
		<div id="content_section">
			<div id="mid_1" class="mid"><img src='../../resources/images/study.jpeg' style="width:380px;"></div>
			<div id="mid_2" class="mid">
				<p id="p_text">현재 정기권이 <br><br><span style="font-size : 50px; font-weight: 900">10</span>개 남았습니다.</p><br>
				<a class="btn btn-default" href="#" role="button" style="margin-left:10px; padding:10px; width:120px;">테마룸 예약</a>&nbsp;&nbsp;
				<a class="btn btn-default" href="#Buy_main" role="button" style="padding:10px; width:120px;">정기권 구매</a>
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
						<form action="studySelect.do" method="get">
							<select name="year" id="year" title="년도" class="select_date"></select>년   
	            			<select name="month" id="month" title="월" class="select_date"></select>월 
							<input class="btn btn-default" type="submit" value="검색" style="width:70px; margin-top:-3px; height:35px;">
						</form>
						</div>

						<div id="reserve_tb">
							<table class="table">
								<tr>
									<th>No.</th>
									<th>일시</th>
									<th>사용갯수</th>
								</tr>
								<c:forEach items="${studyPay }" var="studyPay" varStatus="status">
									<tr>
										<c:if test="${!empty studyPay }">
											<td>${status.count }</td>
											<td>${studyPay.rDate }</td>
											<td>${studyPay.rTime }</td>
										</c:if>
										<c:if test="${empty studyPay }">
											<td colspan="3">조회된 정보가 없습니다.</td>
										</c:if>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<div class="tabs_item">
						<div id="ticket_tb">
							<table class="table">
								<tr>
									<th>No.</th>
									<th>일시</th>
									<th>갯수</th>
									<th>결제금액</th>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>10개</td>
									<td>4000원</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>10개</td>
									<td>4000원</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>10개</td>
									<td>4000원</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>10개</td>
									<td>4000원</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>10개</td>
									<td>4000원</td>
								</tr>
									
							</table>
							<br><p align="center">페이징처리</p>
						</div>
					</div> 
				</div>
			</div> 
		</div>
		
		</div>
			<div id="health_section">
				<div id="content_section">
			<div id="mid_1" class="mid"><img src='../../resources/images/health.jpg' style="width:380px;"></div>
			<div id="mid_2" class="mid">
				<p id="p_text">현재 정기권이 <br><br><span style="font-size : 50px; font-weight: 900">10</span>개 남았습니다.</p><br>
				<a class="btn btn-default" href="#" role="button" style="margin-left:10px; padding:10px; width:120px;">테마룸 예약</a>&nbsp;&nbsp;
				<a class="btn btn-default" href="#Buy_main" role="button" style="padding:10px; width:120px;">정기권 구매</a>
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
							<select name="year" id="year" title="년도" class="select_date"></select>년   
	            			<select name="month" id="month" title="월" class="select_date"></select>월 
							<input class="btn btn-default" type="submit" value="검색" style="width:70px; margin-top:-3px; height:35px;">
						</div>
						<div id="reserve_tb">
							<table class="table">
								<tr>
									<th>No.</th>
									<th>일시</th>
									<th>시간</th>
									<th>사용갯수</th>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>14시-16시</td>
									<td>2개</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>14시-16시</td>
									<td>2개</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>14시-16시</td>
									<td>2개</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>14시-16시</td>
									<td>2개</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>14시-16시</td>
									<td>2개</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>14시-16시</td>
									<td>2개</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="tabs_item">
						<div id="ticket_tb">
							<table class="table">
								<tr>
									<th>No.</th>
									<th>일시</th>
									<th>갯수</th>
									<th>결제금액</th>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>10개</td>
									<td>4000원</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>10개</td>
									<td>4000원</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>10개</td>
									<td>4000원</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>10개</td>
									<td>4000원</td>
								</tr>
								<tr>
									<td>10</td>
									<td>2020-11-20</td>
									<td>10개</td>
									<td>4000원</td>
								</tr>
									
							</table>
							<br><p align="center">페이징처리</p>
						</div>
					</div> 
				</div>
			</div> 
		</div>
		</div>
		</section>
	</div>
	
		<br><br><br><br>
		<jsp:include page="ticketBuy.jsp"></jsp:include>
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