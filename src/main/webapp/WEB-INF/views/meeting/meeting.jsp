<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<header>
<h3 style="float: left; font-weight: bold; font-family:'Jal_Onuel';">&nbsp;Meeting</h3>
    <nav id="smallnav">
        <a onclick="location.href='meetingWriteView.do'" class="far fa-edit"><span>게시글 작성</span></a> 
        <a onclick="location.href='meeting.do'" class="fas fa-users"><span>모임하기</span></a> 
        <a onclick="location.href='place.do'" class="far fa-map"><span>장소추천</span></a> 
        <a onclick="location.href='like.do'" class="far fa-heart"><span>찜목록</span></a>
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
 		<c:set var="mDeadline" value="${meeting.mDeadline}"/>
 		<c:if test="${mDeadline eq 'Y'}">
		<c:if test="${i%j == 0 }">
		<tr>
		</tr>
		</c:if> 
        <td>
        	<c:url var="mDetail" value="meetingdetail.do">
	        	<c:param name="mNo" value="${meeting.mNo}"></c:param>
	        	<c:param name="pNo" value="${meeting.pNo}"></c:param>
        	</c:url>
            <a href="${mDetail}">
                <div id="meeting_div">
                <div id="meeting_img">
	            	<c:if test="${!empty meeting.mrenameFileName}">
	            	<img src="../../../resources/meetingFiles/${meeting.mrenameFileName}" style="width: 200px; height: 200px;">
	            	</c:if>
	            	<c:if test="${empty meeting.mrenameFileName}">
	                <img src="../../../resources/images/home.png" style="width: 200px; height: 200px;">
	                </c:if>                    
                </div>
                <div id="meeting_title">
                    ${meeting.mTitle}
                </div>
                <div id="meeting_subtitle">
                    ${meeting.memberId}
                </div>
	            <c:choose>
				    <c:when test="${meeting.mJYN < 1 && meeting.mPeoplecount == meeting.mPeople}">
				    <span id="meeting_date">마감</span>
				    </c:when>
				    <c:when test="${meeting.mJYN > 0 && meeting.mPeoplecount == meeting.mPeople}">
				    <span id="meeting_date">마감</span>
				    </c:when>
				    <c:when test="${meeting.mJYN < 1 && meeting.mPeoplecount != meeting.mPeople}">
				    <span id="meeting_date">마감</span>
				    </c:when>
				    <c:when test="${meeting.mJYN > 0 && meeting.mPeoplecount != meeting.mPeople}">
				    <span id="meeting_date">D-${meeting.mJYN}</span>
				    </c:when>
				</c:choose>
                <span id="meeting_icon" class="fas fa-users fa-4x"></span>
	            <span id="meeting_person">${meeting.mPeoplecount}/${meeting.mPeople}</span>
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
    	<c:forEach items="${mList2}" var="meeting">
    		<c:if test="${ loginMember.memberId eq meeting.joinMemberId }">
			<c:set var="c" value="${c+1 }" />
			</c:if>			
   			<c:if test="${ loginMember.memberId eq meeting.joinMemberId  && c > 0}">
   			<c:if test="${a%b == 0 }">
			<tr>
			</tr>
			</c:if> 
	        <td>
	        	<c:url var="mDetail" value="meetingdetail.do">
	        	<c:param name="mNo" value="${meeting.mNo}"></c:param>
	        	<c:param name="pNo" value="${meeting.pNo}"></c:param>
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
		            <c:choose>
					    <c:when test="${meeting.mJYN < 1 && meeting.mPeoplecount == meeting.mPeople}">
					    <span id="meeting_date">마감</span>
					    </c:when>
					    <c:when test="${meeting.mJYN > 0 && meeting.mPeoplecount == meeting.mPeople}">
					    <span id="meeting_date">마감</span>
					    </c:when>
					    <c:when test="${meeting.mJYN < 1 && meeting.mPeoplecount != meeting.mPeople}">
					    <span id="meeting_date">마감</span>
					    </c:when>
					    <c:when test="${meeting.mJYN > 0 && meeting.mPeoplecount != meeting.mPeople}">
					    <span id="meeting_date">D-${meeting.mJYN}</span>
					    </c:when>
					</c:choose>
	                <span id="meeting_icon" class="fas fa-users fa-4x"></span>
					<span id="meeting_person">${meeting.mPeoplecount}/${meeting.mPeople}</span>
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
		<table id="meeting_enter2" class="d-none" style="margin: 0 auto;">
	        <td>
	            <div style="text-align: center; font-weight: bold;">
	            <br><br><br><br><br><br><br><br><br>
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
	<!-- Footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
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
            $("#meeting_enter2").addClass('d-none');
        });
        $("#Menter_btn").click(function() {
            $("#meeting_continue").addClass('d-none');
            $("#meeting_enter").removeClass('d-none');
            $("#meeting_enter2").removeClass('d-none');
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