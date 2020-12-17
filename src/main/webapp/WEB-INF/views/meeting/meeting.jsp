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
<link rel="stylesheet" href="../../../resources/css/meeting/meeting.css" />
<link rel="stylesheet" href="../../../resources/css/common/footer.css" />
</head>
<body>
	<div id="wrapper">
		<!-- Nav -->
		<jsp:include page="../common/menuBar.jsp"></jsp:include>
		<br><br>
		<div id="main">
		<article id="meeting" class="panel">
<br>
<header>
<h3 style="float: left; font-weight: bold; font-family: 'Jal_Onuel';">&nbsp;Meeting</h3>
    <nav id="smallnav">
        <a onclick="location.href='meetingWriteView.do'" class="far fa-edit"></a> 
        <a onclick="location.href='meeting.do'" class="fas fa-users"></a> 
        <a onclick="location.href='place.do'" class="far fa-map"></a> 
        <a onclick="location.href='like.do'" class="far fa-heart"></a>
    </nav>
<hr>
</header>
    <div style="text-align: right;">
        <button id="Menter_btn" class="btn_meeting">참가중인 모임</button>
        <button id="Mcontinue_btn" class="btn_meeting">진행중인 모임</button>
    </div><br>
<section>
		<c:set var="i" value="0" />
		<c:set var="j" value="3" />	
    <table id="meeting_continue">
    	<c:forEach items="${mList}" var="meeting">
 		<c:set var="mJYN" value="${meeting.mJYN}"/>
		<c:if test="${mJYN eq 'Y'}">
		<c:if test="${i%j == 0 }">
		<tr>
		</tr>
		</c:if> 
        <td>
        	<c:url var="mDetail" value="meetingdetail.do">
        	<c:param name="mNo" value="${meeting.mNo}"></c:param>
        	</c:url>
            <a href="${mDetail}">
                <div id="meeting_div">
                <div id="meeting_img">
	            	<c:if test="${!empty meeting.moriginalFileName}">
	            	<img src="/resources/meetingFiles/${meeting.moriginalFileName}" style="width: 200px; height: 200px;">
	            	</c:if>
	            	<c:if test="${empty meeting.moriginalFileName}">
	                <img src="/resources/images/home.png" style="width: 200px; height: 200px;">
	                </c:if>                    
                </div>
                <div id="meeting_title">
                    ${meeting.mTitle}
                </div>
                <div id="meeting_subtitle">
                    ${meeting.memberId}
                </div>
                <span id="meeting_date">D-7</span>
                <span id="meeting_icon" class="fas fa-users fa-4x"></span>
                <span id="meeting_person">5/10</span>
                </div>
            </a>
        </td>
        <c:if test="${i%j == j-1 }">
		</c:if> 
		<c:set var="i" value="${i+1 }" />
		</c:if> 
        </c:forEach>
    </table>
    
    	<c:set var="a" value="0" />
		<c:set var="b" value="3" />
		<c:set var="c" value="0" />
    <table id="meeting_enter" class="d-none">
    	<c:forEach items="${mList}" var="meeting">
    	<c:set var="mJYN" value="${meeting.mJYN}"/>
    		<c:if test="${mJYN eq 'N' }">
			<c:set var="c" value="${c+1 }" />
			</c:if>			
   			<c:if test="${mJYN eq 'N' && c > 0}">
   			<c:if test="${a%b == 0 }">
			<tr>
			</tr>
			</c:if> 
	        <td>
	        	<c:url var="mDetail" value="meetingdetail.do">
	        	<c:param name="mNo" value="${meeting.mNo}"></c:param>
	        	</c:url>
	            <a href="${mDetail}">
	                <div id="meeting_div">
	                <div id="meeting_img">
	                    <img src="resources/images/home.png" style="width: 200px; height: 200px;">
	                </div>
	                <div id="meeting_title">
	                    ${meeting.mTitle}
	                </div>
	                <div id="meeting_subtitle">
	                    ${meeting.memberId}
	                </div>
	                <span id="meeting_date">D-7</span>
	                <span id="meeting_icon" class="fas fa-users fa-4x"></span>
	                <span id="meeting_person">참가</span>
	                </div>
	            </a>
	        </td>
	        <c:if test="${a%b == b-1 }">
			</c:if> 
			<c:set var="a" value="${a+1 }" />
			</c:if>
        </c:forEach>
    </table>
    
    <c:if test="${c == 0 }">
		<table id="meeting_enter" class="d-none" style="margin: 0 auto;">
	        <td>
	            <div style="text-align: center; font-weight: bold;">
	            <br><br><br><br><br><br><br><br><br><br><br>
	            <p>참가중인 모임이 없습니다 ㅠ_ㅠ</p>
	            <p>진행중인 모임에서 모임을 참가해보세요!</p>
	            <br><br><br><br><br><br><br><br><br><br><br>
	            </div>
	        </td>
	    </table>
	</c:if>
</section>
</article>
</div>
	<!-- footer -->
	<div id="footer_div">
       <ul class="copyright">
           <li>&copy; hear : share</li>
           <li>대충 푸터랍니다.</li>
       </ul>
    </div>
</div>
</body>
    <script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
<script>
    $(document).ready(function() {
        $("#Mcontinue_btn").click(function() {
            $("#meeting_continue").removeClass('d-none');
            $("#meeting_enter").addClass('d-none');
        });
        $("#Menter_btn").click(function() {
            $("#meeting_continue").addClass('d-none');
            $("#meeting_enter").removeClass('d-none');
        });
    });
    var help = document.getElementsByClassName('btn_meeting');
    for (var i = 0; i < help.length; i++) {
        help[i].addEventListener('click', function() {
            for (var j = 0; j < help.length; j++) {
                help[j].style.backgroundColor = "#F7DBD3";
                help[j].style.color = "white";
            }
            this.style.backgroundColor = "#eeb6a5";
            this.style.color = "white";
        });
    }
</script>    
</html>