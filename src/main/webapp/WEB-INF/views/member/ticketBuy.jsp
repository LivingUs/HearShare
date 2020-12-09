<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정기권 구매</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
	body {
		box-sizing: border-box;
	}
	p {
		text-align: center;
		font-size : 15px;
		line-height : 30px;
	}
	.buy_study {
		width : 800px;
		height : 350px;
		margin : 0 auto;
	}
	.study_pic {
		float : left;
		width : 397px;
	}
	.study_pic img {
		width : 350px;
		margin-top : 40px;
		margin-left: 50px;
	}
	.study_submit {
		float : left;
		width : 300px;
		margin-left : 40px;
		margin-top : 30px;
	}
	.study_submit .radio {
		font-size : 18px;
		padding-top : 10px;
		line-height: 1.8;
	}
</style>
</head>
<body>
	<div id="Buy_main">
		<div id="Buy_text">
		<h2 align="center">정기권 구매하기</h2>
		<hr>
		<p>테마룸(스터디룸/헬스룸)의 정기권을 구매할 수 있습니다.<br>
			정기권 구매 시, 예약시에 따로 결제할 필요 없이 정기권에서 차감결제 됩니다.<br>
			10/20/50/100시간 단위로 구매 가능하며, 기본금액에서 20% 할인됩니다.
		</p>
		</div>
		<div id="buy_content">
			<div class="buy_study">
				<div class="study_pic">
					<img src='../../resources/images/study.jpeg'>
				</div>
				<div class="study_submit">
					<h3>스터디룸</h3>
					<div class="radio">
						<form action="#" method="post">
							  <label>
								<input type="radio" name="study" id="study10" value="10" checked><b>&nbsp;&nbsp;10</b>시간권 &nbsp;&nbsp;&nbsp;<b>8,000</b>원
							  </label>
								<label>
								<input type="radio" name="study" id="study20" value="20"><b>&nbsp;&nbsp;20</b>시간권 &nbsp;<b>16,000</b>원
							  </label>
								<label>
								<input type="radio" name="study" id="study50" value="50"><b>&nbsp;&nbsp;50</b>시간권 &nbsp;<b>40,000</b>원
							  </label>
								<label>
								<input type="radio" name="study" id="study100" value="100"><b>100</b>시간권 &nbsp;<b>80,000</b>원
							  </label><br>
							<input class="btn btn-default" type="submit" value="구매하기" style="width:120px; padding:10px; margin-top:20px; margin-left:40px;">
						</form>
					</div>
				</div>
			</div>
		
			<div class="buy_study">
				<div class="study_pic">
					<img src='../../resources/images/health.jpg'>
				</div>
				<div class="study_submit">
					<h3>헬스룸</h3>
					<div class="radio">
						<form action="#" method="post">
							  <label>
								<input type="radio" name="health" id="health10" value="10" checked><b>&nbsp;&nbsp;10</b>시간권 &nbsp;&nbsp;&nbsp;<b>8,000</b>원
							  </label>
								<label>
								<input type="radio" name="health" id="health20" value="20"><b>&nbsp;&nbsp;20</b>시간권 &nbsp;<b>16,000</b>원
							  </label>
								<label>
								<input type="radio" name="health" id="health50" value="50"><b>&nbsp;&nbsp;50</b>시간권 &nbsp;<b>40,000</b>원
							  </label>
								<label>
								<input type="radio" name="health" id="health100" value="100"><b>100</b>시간권 &nbsp;<b>80,000</b>원
							  </label><br>
							<input class="btn btn-default" type="submit" value="구매하기" style="width:120px; padding:10px; margin-top:20px; margin-left:40px;">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>