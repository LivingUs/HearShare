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
<link rel="stylesheet" href="../../../resources/css/place/meeting_like.css" />
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
<h3 style="float: left; width: 30%; font-weight: bold; font-family: 'Jal_Onuel';">&nbsp;Like</h3>
    <nav id="smallnav">
        <a onclick="location.href='meetingWriteView.do'" class="far fa-edit"></a> 
        <a onclick="location.href='meeting.do'" class="fas fa-users"></a> 
        <a onclick="location.href='place.do'" class="far fa-map"></a> 
        <a onclick="location.href='like.do'" class="far fa-heart"></a>
    </nav>
<hr>
</header>
<section>
    	<c:set var="i" value="0" />
		<c:set var="j" value="3" />	
		<c:set var="c" value="0" />
    <table>
    	<c:forEach items="${plikeList}" var="place">
    	<c:if test="${loginMember.memberId eq place.memberId}">
		<c:set var="c" value="${c+1 }" />
		</c:if>
		<c:if test="${ loginMember.memberId eq place.memberId && c > 0 }">
		<c:if test="${i%j == 0 }">
		<tr>
		</tr>
		</c:if>    	
        <td>
        	<c:url var="pDetail" value="placedetail.do">
        	<c:param name="pNo" value="${place.pNo}"></c:param>
        	</c:url>
            <a href="${pDetail}">
                <div id="place_div">
                    <div id="place_img">
                        <img src="${place.pFilename}" style="width: 200px; height: 200px;">
                    </div>
                    <div id="place_title">
                        ${place.pTitle}
                    </div>
                    <div id="place_subtitle">
                        ${place.pmTitle}
                    </div>
<%--                     <a href="javascript:addmLike();" id="place_like">
                               <c:if test="${empty mLike.mCheckYn || mLike.mCheckYn eq 'N'}">
                                 <i class="far fa-heart" id="emptyHeart"></i>
                              </c:if>
                              <c:if test="${mLike.mCheckYn eq 'Y'}">
                                 <i class="fas fa-heart" id="fullHeart"></i>
                              </c:if>                            
                           </a> --%>
                </div>
            </a>
        </td>
        <c:if test="${i%j == j-1 }">
		</c:if> 
		<c:set var="i" value="${i+1 }" />
		</c:if>
        </c:forEach>
    </table>
    
    <c:if test="${c == 0 }">
		<table id="meeting_enter2" style="margin: 0 auto;">
	        <td>
	            <div style="text-align: center; font-weight: bold;">
	            <br><br><br><br><br><br><br><br><br>
	            <p>찜한 장소가 없습니다 ㅠ_ㅠ</p>
	            <p>내맘에 드는 장소를 찜해보세요!</p>
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
</body>
</html>