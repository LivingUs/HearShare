<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/meeting/meeting_modify.css" />
<link rel="stylesheet" href="../../../resources/css/common/footer.css" />
</head>
<body>
	<div id="wrapper">
		<!-- Nav -->
		<jsp:include page="../common/menuBar.jsp"></jsp:include>
		<br><br>
		<div id="main">
		<article id="meeting" class="panel">
<header>
<h3 style="float: left; font-weight: bold; font-family: 'Jal_Onuel';">&nbsp;Modify</h3>
<span id="Msub_title">&nbsp;(meeting)</span>
    <nav id="smallnav">
        <a onclick="location.href='meetingWriteView.do'" class="far fa-edit"><span>게시글 작성</span></a> 
        <a onclick="location.href='meeting.do'" class="fas fa-users"><span>모임하기</span></a> 
        <a onclick="location.href='place.do'" class="far fa-map"><span>장소추천</span></a> 
        <a onclick="location.href='like.do'" class="far fa-heart"><span>찜목록</span></a>
    </nav>
<hr>
</header><br>
<section>
	<form action="meetingModify.do" method="post" enctype="multipart/form-data">
        <div style="margin: 0 auto; text-align: center;">
        <input type="text" id="Mwrite_title" name="mTitle" value="${meeting.mTitle}">
        <input id="select_Mperson" style="margin: 0px 20px 0px 20px;" value="모집인원 : ${meeting.mPeople}명" readonly>
		<input id="select_Mtime" value="모집기간 : ${meeting.mDate}일" readonly><br><br>
        <textarea id="Mwrite_content" cols="100" rows="20" name="mContent" value="${meeting.mContent}"></textarea>
        <div style="position: relative; left: 255px;">
		<input type="file" id="Mwrite_btnfileselect" name="uploadFile">   
        <input id="Mwrite_btn" class='btn btn-outline-danger' type="submit" value="수정" />
        </div>
        </div>
	</form>
</section>
</article>
</div>
	<!-- Footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
</div>
</body>
    <script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
</body>
</html>