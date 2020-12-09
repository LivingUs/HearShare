<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월별 통계</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/member/chart.css">
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
	<div id="chart_wrapper">
		<div id="chart_top">
			<div class="chart_top">
				<div id="chart_input">
				<!--가계부input-->
					<form class="form-horizontal">
					  <div class="form-group">
						<label class="col-sm-3 control-label">구분</label>
						<div class="col-sm-7">
						  <select class="form-control">
							  <option>수입</option>
							  <option>지출</option>
							</select>
						</div>
					  </div>
					  <div class="form-group">
						<label class="col-sm-3 control-label">날짜</label>
						<div class="col-sm-7">
						  <input type="text" class="form-control" id="date" placeholder="날짜를 선택하세요">
						</div>
					  </div>
						<div class="form-group">
						<label class="col-sm-3 control-label">금액</label>
						<div class="col-sm-7">
						  <input type="text" class="form-control" id="date" placeholder="금액을 입력하세요">
						</div>
					  </div>
						<div class="form-group">
						<label class="col-sm-3 control-label">내용</label>
						<div class="col-sm-7">
						  <select class="form-control">
							  <option>음식</option>
							  <option>커피</option>
							  <option>쇼핑</option>
							  <option>기타</option>
						  </select>
						</div>
					  </div>
						<div class="form-group">
						<label class="col-sm-3 control-label"></label>
						<div class="col-sm-7">
						  <input type="text" class="form-control" id="date" placeholder="내용을 입력하세요">
						</div>
					  </div>
						
					  <div class="form-group">
						  <button type="submit" class="btn btn-default col-sm-5" style="margin-left:30%;">저장</button>
					  </div>
					</form>
				</div>
			</div>
			<div class="chart_top">
				<div id="chart_div">
					<!--지출차트-->
				</div>
			</div>
		</div>
		<div id="chart_bottom">
			<div id="chart_bottom_top">
				<div align="center" class="chart_p"><p style="display:inline-block; margin-left:35%;">&#91; 이번달 소비생활 &#93;</p>
				<button type="submit" class="btn btn-default" style="display:inline-block; margin-left:15%;">엑셀파일로 저장</button></div>
				<br>
				<div class="chart_tb">
					<table class="table">
						<tr>
							<th>No.</th>
							<th>날짜</th>
							<th>분류</th>
							<th>내용</th>
							<th>금액</th>
						</tr>
						<tr>
							<td>10</td>
							<td>2020-11-20</td>
							<td>음식</td>
							<td>꼬꼬아찌</td>
							<td>18,000원</td>
						</tr>
						<tr>
							<td>10</td>
							<td>2020-11-20</td>
							<td>음식</td>
							<td>꼬꼬아찌</td>
							<td>18,000원</td>
						</tr>
						<tr>
							<td>10</td>
							<td>2020-11-20</td>
							<td>음식</td>
							<td>꼬꼬아찌</td>
							<td>18,000원</td>
						</tr>
						<tr>
							<td>10</td>
							<td>2020-11-20</td>
							<td>음식</td>
							<td>꼬꼬아찌</td>
							<td>18,000원</td>
						</tr>
						<tr>
							<td>10</td>
							<td>2020-11-20</td>
							<td>음식</td>
							<td>꼬꼬아찌</td>
							<td>18,000원</td>
						</tr>
						
					</table>
				</div>

				<br>
				<p align="center" style="font-weight: 900">
				<span style="color:blue;">수입</span> / 400,000원&nbsp;&nbsp;
				<span style="color:red;">지출</span> /  200,000원&nbsp;&nbsp;
				<span style="color:green;">합계</span> / 200,000원&nbsp;&nbsp;</p>
							<!--페이징 처리-->
				<div id="pageing" style="text-align: center;">123445</div>
			</div>
			<hr>
			<div id="chart_bottom_bottom">
				<p align="center" class="chart_p">&#91; 이번달 쉐어하우스생활 &#93;</p>
				<div class="chart_tb">
					<table class="table">
						<tr>
							<th>No.</th>
							<th>내용</th>
							<th>금액</th>
						</tr>
						<tr>
							<td>10</td>
							<td>테마룸 이용</td>
							<td>4000원</td>
						</tr>
						<tr>
							<td>10</td>
							<td>정기권 구매</td>
							<td>16,000원</td>
						</tr>
						<tr>
							<td>10</td>
							<td>금액</td>
							<td>428,500원</td>
						</tr>
					</table>
					<br>
					<p align="center" style="font-weight: 900"><span style="color:green;">합계</span> / 200,000원 </p>
				</div>					
			</div>
		</div>
	</div>
</section>
</article>
</div>
</div>
</body>
</html>