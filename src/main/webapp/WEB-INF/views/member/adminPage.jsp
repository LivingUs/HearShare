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
    <link rel="stylesheet" href="../../../resources/css/member/adminPage.css" />
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
						<h3>&nbsp;Admin Page</h3>
					    <nav id="smallnav">
					        <a href="#" onclick="location.href='adminPage.do'" class="fas fa-user-cog"><span>관리페이지</span></a> 
					        <a href="#" onclick="location.href='emailSendView.do'" class="fas fa-mail-bulk"><span>메일발송</span></a> 
					    </nav>
					    <hr>
				</header>
				<section>
					<!-- 관리페이지 메인 -->
					<article class="adminPage">
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">#</th>
						      <th scope="col">ID</th>
						      <th scope="col">Name</th>
						      <th scope="col">Phone</th>
						      <th scope="col">Email</th>
						      <th scope="col">RoomNo</th>
						      <th scope="col">Join Date</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:forEach items="${memberList }" var="mList" begin="0" end="30" varStatus="status">
								<tr>
							      <th scope="col">${status.count }</th>
							      <td>${mList.memberId }</td>
							      <td>${mList.memberName }</td>
							      <td>${mList.phone }</td>
							      <td>${mList.email }</td>
							      <td>${mList.roomNo }</td>
							      <td>${mList.joinDate }</td>
						    	</tr>
							</c:forEach>						  
						  </tbody>
						</table>
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
