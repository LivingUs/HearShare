<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Hear : Share</title>
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../../resources/css/common/menuBar.css" />
</head>
<body>
		<a id="back-to-top"></a>
        <!-- Nav -->
        <nav id="nav">
            <a href="#board" onclick="location.href='boardList.do'" class="fas fa-clipboard-list fa-4x"><span>자유게시판</span></a>
            <a href="#meeting" class="fas fa-users fa-4x"><span>모임활동</span></a>
            <a href="#calender" class="far fa-calendar-check fa-4x"><span>캘린더</span></a>
            <c:if test="${loginMember.memberId eq 'admin' }">
            	<a href="#adminPage" onclick="location.href='adminPage.do'" class="fas fa-user fa-4x"><span>관리페이지</span></a>
            </c:if>
            <c:if test="${loginMember.memberId ne 'admin' }">
            	<a href="#myPage" onclick="location.href='myPage.do'" class="fas fa-user fa-4x"><span>마이페이지</span></a>
            </c:if>         
        </nav>
		<script type="text/javascript">
			$(function() {
			    $('#back-to-top').on('click', function(e) {
			        e.preventDefault();
			        $('html,body').animate({
			            scrollTop: 0
			        }, 600);
			    });
			        
			    $(window).scroll(function() {
			        if ($(document).scrollTop() > 100) {
			            $('#back-to-top').addClass('show');
			        } else {
			            $('#back-to-top').removeClass('show');
			        }
			    });
			});
		</script>
</body>
</html>