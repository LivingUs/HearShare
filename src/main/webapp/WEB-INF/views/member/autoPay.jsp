<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동결제 관리</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	body {
		box-sizing: border-box;
		margin : 0 auto;
	}
	#autoPay_top {
		width : 800px;
		margin : 0 auto;
	}
	.autoPay_tb1 {
		width : 550px;
		height : 70px;
		margin: 0 auto;
		border-spacing: inherit;
	}
	.autoPay_tb1 th {
		text-align: center;
	}
	.autoPay_tb1 td {
		height : 20px;
	}
	#autoPay_bottom {
		margin : 0 auto;
		width : 800px;
		height : 300px;
	}
	#autoPay_tb2 {
		height : 200px;
		overflow-y: auto;
	}
	#autoPay_tb2 .table{
		margin : 0 auto;
		color : black;
		text-align: center;
		border-collapse: collapse;
		table-layout: fixed;
	}
	#autoPay_tb2 .table th {
		background : #eeb6a5;
		text-align: center;
		position: sticky;
		top : 0px;
		height : 20px;
	}

</style>
</head>
<body>
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
					<td>2020-11-01&nbsp;&nbsp;<input type="submit" value="해지하기"></td>
				</tr>
				<tr>
					<th>결제금액</th>
					<td>500,000원</td>
					<th></th>
					<td></td>
				</tr>
			</table>
		</div>
		<br>
		<div id="autoPay_bottom">
			<h4 style="font-weight: 900">자동결제 정보</h4>
			<div id="autoPay_tb2">
				<table class="table autoPay_tb2">
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
</body>
</html>