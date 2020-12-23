<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동결제 관리</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/other/autoPay.css">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="//code.jquery.com/jquery.min.js"></script>
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
					<h3 style="float: left; width: 30%; font-weight: bold; font-family: 'Jal_Onuel';">&nbsp;AutoPay</h3>
					    <nav id="smallnav">
					        <a href="#mypage" onclick=""><i class="fas fa-user-edit"></i></a> 
					        <a href="#ticket" onclick="location.href='payAllList.do'"><i class="fas fa-ticket-alt"></i></a>
					        <a href="#autoPay" onclick="location.href='autoPayList.do'"><i class="far fa-credit-card"></i></a> 
					        <a href="#chart" onclick="location.href='accountList.do'"><i class="fas fa-chart-bar"></i></a> 
					    </nav>
					    <hr>
				</header>
<section>
	<div class="wrapper_autoPay">
		<h2 align="center">자동결제일은 매달 <span style="font-size : 1.3em;">1일</span>입니다.</h2>
		<hr>
		<div id="autoPay_top">
			<c:if test="${!empty mList }">
				<table class="table-borderless autoPay_tb1">
						<tr>
							<th>상 태</th>
							<td>
								<c:if test="${mList[0].mpTyn eq 'Y'}">
									이용중
								</c:if>
								<c:if test="${mList[0].mpTyn eq 'N'}">
									이용중지
								</c:if>
							</td>
							<th>결제기간</th>
							<td>${mList[0].memberId }</td>
						</tr>
						<tr>
							<th>결제수단</th>
							<td>${mList[0].mpMeans }</td>
							<th>다음 결제일</th>
							<td>${mList[0].nextPay }</td>
						</tr>
						<tr>
							<th>결제금액</th>
							<td>${mList[0].mpPrice }원</td>
							<th></th>
							<td>
							<c:if test="${mList[0].mpTyn eq 'Y' }"> <!-- 자동결제 이용중일 때만 해지하기 버튼 생성 -->
								<button class="btn btn-outline-danger" type="button" onclick="stopConfirm(); "style="width:120px;height:35px;">해지하기</button>
								<script>
									function stopConfirm(){
										if(confirm("정말 해지하시겠습니까?")) document.location = 'autoPayStop.do';
									};
								</script>
							</c:if>
							</td>
						</tr>
				</table>
			</c:if>
			<c:if test="${empty mList }">
				<br>
				<p style="text-align:center; font-size:20px; ">한 번의 자동결제 신청으로, 관리비 납입을 간편하게 이용하세요.<br><br>
				<button class="btn btn-outline-danger" type="button" style="width:250px; height:50px;">자동결제 신청하러 가기>></button>
				</p>
				<br>
			</c:if>
		</div>
		<br>
		<div id="autoPay_bottom">
			<h4 style="font-weight: 900;" align="center">자동결제 정보</h4><br>
			<div id="autoPay_tb">
				<table class="table autoPay_tb">
					<tr>
						<th style="width:8%;">No.</th>
						<th style="width:12%;">결제일</th>
						<th style="width:25%;">결제기간</th>
						<th style="width:10%;">결제수단</th>
						<th style="width:12%;">결제금액</th>
						<th style="width:8%;">상태</th>
					</tr>
					<c:if test="${!empty mList }">
						<c:forEach items="${mList}" var="mList">
							<tr>
								<td>${mList.mpNo}</td>
								<td>${mList.mpDate }</td>
								<td>${mList.memberId }</td>
								<td>${mList.mpMeans }</td>
								<td>${mList.mpPrice }원</td>
								<td>
									<c:if test="${mList.mYn eq 'Y' }">
										완료
									</c:if>
									<c:if test="${mList.mYn eq 'N' }">
										미납
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty mList }">
						<tr>
							<td colspan="6">조회된 정보가 없습니다.</td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
	</div>
	<br><br><br>
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