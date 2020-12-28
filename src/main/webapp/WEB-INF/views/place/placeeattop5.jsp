<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/place/meeting_placetop5.css" />
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
<h3 style="float: left; font-weight: bold; font-family: 'Jal_Onuel';">&nbsp;Place</h3>
<span id="placetop_subtitle">&nbsp;(eat TOP5)</span>
    <nav id="smallnav">
        <a onclick="location.href='meetingWriteView.do'" class="far fa-edit"><span>게시글 작성</span></a> 
        <a onclick="location.href='meeting.do'" class="fas fa-users"><span>모임하기</span></a> 
        <a onclick="location.href='place.do'" class="far fa-map"><span>장소추천</span></a> 
        <a onclick="location.href='like.do'" class="far fa-heart"><span>찜목록</span></a>
    </nav>
<hr>
</header>
<section><br>
	<c:forEach items="${pList}" var="place">
    <table style="margin: 0 auto;">
        <td>
        	<c:url var="pDetail" value="placedetail.do">
        	<c:param name="pNo" value="${place.pNo}"></c:param>
        	</c:url>
            <a href="${pDetail}">
                <div id="placetop_div">
                <div id="placetop_img">
                    <img src="${place.pFilename}" style="width: 200px; height: 200px;">
                </div>
                <div id="placetop_title">
                    ${place.pTitle}
                </div>
                <div id="placetop_like">
<!--                     <a href="#" class="far fa-heart" style="color: black;"></a>
                    <p id="placetop_likespan">찜하기</p> --></div><br><br>
                <div id="placetop_addr">
                    ${place.pmTitle}
                </div><br><br><br>
                <div style="color: black;">
                	<p>영업시간 : ${place.pSaletime}</p> 
                  	<p>주소 : ${place.pAddr}<p> 
                </div>
                </div>
            </a>
        </td>
    </table><br>
    <hr style="width: 870px;">
    </c:forEach>
<br>
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
</body></html>