<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월별 통계</title>

<link rel="stylesheet" type="text/css" href="../../resources/css/other/chart.css">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/other/chartInclude.css">

</head>
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
				<h3 style="float: left; width: 30%; font-weight: bold; font-family: 'Jal_Onuel';">&nbsp;Account Book</h3>
				    <nav id="smallnav">
					        <a href="#mypage" onclick="location.href='myPage.do'" class="fas fa-user-cog"><span>마이페이지</span></a> 
					        <a href="#ticket" onclick="location.href='payAllList.do'" class="fas fa-ticket-alt"><span>정기권</span></a> 
					        <a href="#autoPay" onclick="location.href='autoPayList.do'" class="far fa-credit-card"><span>결제관리</span></a> 
					        <a href="#chart" onclick="location.href='accountList.do'" class="fas fa-chart-bar"><span>지출관리</span></a> 
				    </nav>
				    <hr>
			</header>
<section>
	<div id="chart_wrapper">
		<div id="chart_top">
			<div class="chart_top">
				<div id="chart_input">
				<!--가계부input-->
					<form class="form-horizontal" action="insertAccount.do" method="post">
					  <div class="form-inline form-group">
						<label class="col-sm-2 control-label">구분</label>
						<div class="col-sm-10">
						  	<input type="radio" name="acInOut" id="acInOut" value="in" checked> 수입 &nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="acInOut" id="acInOut" value="out"> 지출
						</div>
					  </div>
					  <div class="form-inline form-group">
						<label class="col-sm-2 control-label">날짜</label>
						<div class="col-sm-10">
						  <input type="text" class="form-control" id="datepicker" name="acDate" placeholder="날짜를 선택하세요" style="width:300px;height:45px;">
						</div>
					  </div>
						<div class="form-inline form-group">
						<label class="col-sm-2 control-label">금액</label>
						<div class="col-sm-10">
						  <input type="text" class="form-control" id="acPrice" name="acPrice" placeholder="금액을 입력하세요" style="width:300px;height:45px;">
						</div>
					  </div>
						<div class="form-inline form-group">
						<label class="col-sm-2 control-label">내용</label>
						<div class="col-sm-10">
						  <select class="form-control" id="acBig" name="acBig" style="width:300px;height:45px;">
							  <option value="음식">음식</option>
							  <option value="커피">커피</option>
							  <option value="쇼핑">쇼핑</option>
							  <option value="기타">기타</option>
						  </select>
						</div>
					  </div>
						<div class="form-inline form-group">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-10">
						  <input type="text" class="form-control" id="acSmall" name="acSmall" placeholder="내용을 입력하세요" style="width:300px;height:45px;">
						</div>
					  </div>
						
					  <div class="form-group">
						  <button type="submit" class="btn btn-outline-danger col-sm-5" onclick="return reCheck();" style="margin-left:120px; margin-top:10px;">저장</button>
<!-- 						  <button type="submit" class="btn btn-outline-danger col-sm-5" onclick="return reCheck();" style="margin-left:120px;margin-top:10px;">저장</button> -->
					  </div>
					</form>
					
				</div>
			</div>
			<div class="chart_top">
				<div id="chart_div">
					<figure class="highcharts-figure">
					  <div id="container"></div>
					</figure>
				</div>
			</div>
		</div>
		<div id="chart_bottom">
			<div id="chart_bottom_top">
				<div align="center" class="chart_p"><p style="display:inline-block; margin-left:35%;">&#91; 이번달 소비생활 &#93;</p>
				<button type="button" class="btn btn-outline-danger" onclick="location.href='excelConvert.do'" id="excelConvertBtn"
						style="display:inline-block; margin-left:15%;">엑셀파일로 저장</button></div>
				<br>
				<div class="chart_tb">
					<div id="table_layout">
						<table class="table">
							<tr>
								<th>No.</th>
								<th>날짜</th>
								<th>분류</th>
								<th>내용</th>
								<th>금액</th>
							</tr>
							<c:forEach items="${aList }" var="aList">
								<tr>
									<td>${aList.acNo }</td>
									<td>${aList.acDate }</td>
									<td>${aList.acBig }</td>
									<td>${aList.acSmall }</td>
									<td>
										<c:if test="${aList.acInOut eq 'in' }">
											<span style="color:blue;">+ ${aList.acPrice }원</span>
										</c:if>
										<c:if test="${aList.acInOut eq 'out' }">
											<span style="color:red;">- ${aList.acPrice }원</span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<br>
					<p align="center" style="font-weight: 900; font-size:20px;">
						<span style="color:blue;">수입</span> / <span id="income"></span>&nbsp;&nbsp;
						<input type="hidden" id="accountIn" value="${accountSum.acIn }">
						<span style="color:red;">지출</span> /  <span id="outcome"></span>&nbsp;&nbsp;
						<input type="hidden" id="accountOut" value="${accountSum.acOut }">
						<span style="color:green;">합계</span> / <span id="accountSum"></span>
					</p>
					<br>
						<!-- 페이징 처리 -->
						<div align="center" id="month_paging" style="margin:0 auto; font-size:18px;">
							<!-- 이전 -->
							<c:if test="${pi.currentPage <= 1 }">
								[이전]&nbsp;
							</c:if>
							<c:if test="${pi.currentPage > 1 }">
								<c:url var="before" value="accountList.do">
									<c:param name="page" value="${pi.currentPage - 1 }"/>
								</c:url>
								<a href="${before }" style="color : black;">[이전]</a>&nbsp;
							</c:if>
							
							<!-- 페이지 -->
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<!-- 현재 선택된 페이지 -->
								<c:if test="${p eq pi.currentPage }">
									<font color="red">${p }</font>
								</c:if>
								<c:url var="pagination" value="accountList.do">
									<c:param name="page" value="${p}"/>
								</c:url>
								<c:if test="${p ne pi.currentPage }">
									<a href="${pagination }" style="color : black;">${p }</a>&nbsp;
								</c:if>
							</c:forEach>	
							
							<!-- 다음 -->
							<c:if test="${pi.currentPage >= pi.maxPage }">
								&nbsp;[다음]
							</c:if>
							<c:if test="${pi.currentPage < pi.maxPage }">
								<c:url var="after" value="accountList.do">
									<c:param name="page" value="${pi.currentPage + 1 }"/>
								</c:url>
								&nbsp;<a href="${after}" style="color : black;">[다음]</a>
							</c:if>
						</div>
				</div>
			</div>
			<br>
			<hr>
			<div id="chart_bottom_bottom">
				<p align="center" class="chart_p">&#91; 이번달 쉐어하우스생활 &#93;</p><br>
				<div class="chart_tb">
					<table class="table">
						<tr>
							<th>내용</th>
							<th>금액</th>
						</tr>
						<tr>
							<td>테마룸 이용</td>
							<td id="themeSum"></td>
						</tr>
						<tr>
							<td>정기권 구매</td>
							<td id="ticketSum"></td>
						</tr>
						<tr>
							<td>관리비</td>
							<td id="paySum"></td>
						</tr>
					</table>
					<br>
						<input type="hidden" id="themeOut" value="${month[0].rDate  }">
						<input type="hidden" id="ticketOut" value="${month[1].rDate }">
						<input type="hidden" id="payOut" value="${month[2].rDate }">
					<p align="center" style="font-weight: 900; font-size:20px;"><span style="color:green;">합계</span> / <span id="hap"></span></p>
				</div>					
			</div>
		</div>
	</div>
</section>
</article>
</div>
</div>

    <script>
    //Datepicker
    $(function() {
        $('#datepicker').datepicker({
            dateFormat: 'yy-mm-dd' //Input Display Format 변경
            ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
            ,changeYear: true //콤보박스에서 년 선택 가능
            ,changeMonth: true //콤보박스에서 월 선택 가능                
            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트    
        	,maxDate : 0
        });
       //초기값을 오늘 날짜로 설정
        $('#datepicker').datepicker('setDate', 'today');
    });

    //input 유효성체크
	function reCheck() {
		if($("#acPrice").val() == 0){
			alert("금액을 입력해주세요.");
			$("#acPrice").focus();
			return false;
		} else if($("#acSmall").val() == 0){
			alert("내용을 입력해주세요.");
			$("#acSmall").focus();
			return false;
		}
		else { //result == true
			return true;
		}
	}
    
    
    //천단위 콤마찍기
    function AddComma(num) {
	    var regexp = /\B(?=(\d{3})+(?!\d))/g;
	    return num.toString().replace(regexp, ',');
    }

    //이번달 합계
    $(document).ready(function(){
    	var accountIn = $("#accountIn").val();
    	var accountOut = $("#accountOut").val();
    	var sum = accountIn-accountOut;
    	var income = AddComma(accountIn);
    	var outcome = AddComma(accountOut);
    	var accountSum = AddComma(sum);
    	$("#income").text(income+'원');
    	$("#outcome").text(outcome+'원');
    	$("#accountSum").text(accountSum+'원');
    	
    	var theme = $("#themeOut").val();
    	var ticket = $("#ticketOut").val();
    	var pay = $("#payOut").val();
    	var hap = parseInt(theme) + parseInt(ticket) + parseInt(pay);
    	var themeComma = AddComma(theme);
    	var ticketComma = AddComma(ticket);
    	var payComma = AddComma(pay);
    	var hapComma = AddComma(hap);
    	$("#themeSum").text(themeComma+'원');
    	$("#ticketSum").text(ticketComma+'원');
    	$("#paySum").text(payComma+'원');
    	$("#hap").text(hapComma+'원');
    });
</script>

<script>
	$(function() {

	//x축 표현해줄 날짜
		var $today = new Date();
		var $month = ($today.getMonth() + 1)+'월';  // 월
		var $preMonth = ($today.getMonth())+'월'; // 1달전
		var $ppreMonth = ($today.getMonth() - 1)+'월'; //2달전
		
		//차트 AJAX
		$.ajax({
			url : "chart.do",
			type : "GET",
			dataType : "JSON",
			async : false,
			contentType : 'application/json; charset=UTF-8',
			success : function(data){ 
				
				var dataArr = new Array();
				for(i in data){ //배열담기
					dataArr.push(Number(data[i].acPrice));
	            }
				
				Highcharts.chart('container', {
				    chart: {
				        type: 'column',
				        styledMode: true
				    },
				    title: {
				        text: '최근 3개월 가계부 지출 '
				    },
				   xAxis: { //x축
			            categories: [$ppreMonth, $preMonth, $month]
			        }, 
				    yAxis: [{ //y축
				        className: 'highcharts-color-0',
				        title: false
				    }], 
				    plotOptions: {
				        column: {
				            borderRadius: 5
				        }
				    },
				    lang: [{
				        thousandsSep: ',',
				    	labels: {
				           formatter: function () {
				               return this.value / 1000 + '원';
				           }
				   	 	},
				    }],
				    series: [{ 
				    	name : '가계부',
						data: dataArr,
						}],
				    credits:{
				    	enabled:false
				    }
			});
			}
		});
	});
</script>

<!-- 	<script src="../../resources/js/jquery.min.js"></script>  -->
	<script src="../../../resources/js/breakpoints.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
    
</body>
</html>