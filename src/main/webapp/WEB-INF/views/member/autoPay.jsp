<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동결제 관리</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/member/autoPay.css">
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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
	<div class="wrapper_autoPay">
		<h2 align="center">자동결제일은 매달 <span style="font-size : 1.3em;">1일</span>입니다.</h2>
		<hr>
		<div id="autoPay_top">
			<table class="table-borderless autoPay_tb1">
				<tr>
					<th>상 태</th>
					<td>이용중</td>
					<th>결제기간</th>
					<td>2020-11-01 ~ 2020-11~30</td>
				</tr>
				<tr>
					<th>결제수단</th>
					<td>신용카드</td>
					<th>다음 결제일</th>
					<td>2020-11-01&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<th>결제금액</th>
					<td>500,000원</td>
					<th></th>
					<td>
					<input class="btn btn-default" type="submit" value="해지하기" style="width:100px;height:30px;padding-top:-10px;">
					</td>
				</tr>
			</table>
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
					<tr>
						<td>1</td>
						<td>2020-10-01</td>
						<td>2020-10-01 ~ 2020-10-31</td>
						<td>신용카드</td>
						<td>500,000원</td>
						<td>완료</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2020-10-01</td>
						<td>2020-10-01 ~ 2020-10-31</td>
						<td>신용카드</td>
						<td>500,000원</td>
						<td>완료</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2020-10-01</td>
						<td>2020-10-01 ~ 2020-10-31</td>
						<td>신용카드</td>
						<td>500,000원</td>
						<td>완료</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2020-10-01</td>
						<td>2020-10-01 ~ 2020-10-31</td>
						<td>신용카드</td>
						<td>500,000원</td>
						<td>완료</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2020-10-01</td>
						<td>2020-10-01 ~ 2020-10-31</td>
						<td>신용카드</td>
						<td>500,000원</td>
						<td>완료</td>
					</tr>
					<tr>
						<td>1</td>
						<td>2020-10-01</td>
						<td>2020-10-01 ~ 2020-10-31</td>
						<td>신용카드</td>
						<td>500,000원</td>
						<td>완료</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<br><br><br>
</section>
</article>
</div>
</div>
</body>
</html>