<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="../../../resources/css/member/adminEmailSend.css" />
</head>
<body>
	<br>
	<div id="wrapper">
        
		<!-- Nav -->
		<jsp:include page="../common/menuBar.jsp"></jsp:include>
        <br>
        <br>
		<div id="main">
			<article class="panel">
				<header>
						<h3>&nbsp;Email Send</h3>
					    <nav id="smallnav">
					        <a href="#" onclick="location.href='adminPage.do'" class="fas fa-user-cog"><span>관리페이지</span></a> 
					        <a href="#" onclick="location.href='emailSendView.do'" class="fas fa-mail-bulk"><span>메일발송</span></a> 
					    </nav>
					    <hr>
				</header>
				<section>
					<!-- 관리자 이메일 발송 -->
					<article class="adminEamilSend">
						<br>
						<h6>초대할 회원의 메일주소를 입력해주세요.</h6>
						<form action="inviteMember.do" method="get">
							<div class="input-group mb-3">
								<input type="text" class="form-control" placeholder="이메일 주소" aria-label="Recipient's username" aria-describedby="button-addon2" name="email">
								<div class="input-group-append">
									<input type="submit" class="btn btn-outline-danger" id="button-addon2" value="메일발송">
								</div>
							</div>
						</form>
				    </article>
				</section>
			</article>
		</div>
		<!-- Footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
		
	</div>
    <!-- script -->
    <script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
</body>
</html>
