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
<link rel="stylesheet" href="../../../resources/css/meeting/meeting_write.css" />
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
<h3 style="float: left; font-weight: bold; font-family: 'Jal_Onuel';">&nbsp;Write</h3>
<span id="Msub_title">&nbsp;(meeting)</span>
    <nav id="smallnav">
        <a onclick="location.href='meetingWriteView.do'" class="far fa-edit"></a> 
        <a onclick="location.href='meeting.do'" class="fas fa-users"></a> 
        <a onclick="location.href='place.do'" class="far fa-map"></a> 
        <a onclick="location.href='like.do'" class="far fa-heart"></a>
    </nav>
<hr>
</header><br>
<section>
	<form action="meetingWrite.do" method="post" enctype="multipart/form-data">
        <div style="margin: 0 auto; text-align: center;">
        <input type="text" id="Mwrite_title" placeholder="제목을 입력하세요." name="mTitle" required>
        <select id="select_person" style="margin: 0px 20px 0px 20px;" name="mPeople" required>
			<option value="">모집 인원</option>
		    <option value="2">2명</option>
		    <option value="3">3명</option>
            <option value="4">4명</option>
		    <option value="5">5명</option>
		    <option value="6">6명</option>
            <option value="7">7명</option>
		    <option value="8">8명</option>
		    <option value="9">9명</option>
            <option value="10">10명</option>
		</select>
		<select id="select_time" name="mDate" required>
		    <option value="">모집 기간</option>
		    <option value="1">1일</option>
            <option value="2">2일</option>
            <option value="3">3일</option>
            <option value="4">4일</option>
            <option value="5">5일</option>
            <option value="6">6일</option>
            <option value="7">7일</option>
        </select><br><br>
        <textarea id="Mwrite_content" placeholder="내용을 입력하세요." cols="100" rows="20" name="mContent" required></textarea>
        <div style="position: relative; left: 255px;">
		<input type="file" id="Mwrite_btnfileselect" name="uploadFile" accept=".gif, .jpg, .png, .jpeg">
		<input type="hidden" name="pNo" value="${place.pNo}">   
        <input id="Mwrite_btn" class='btn btn-outline-danger' type="submit" value="등록" />
        </div>     
        </div>
	</form>
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

        <div style="margin: 0 auto; center; width: 780px; height: 150px; background-color: #eeb6a5; position: relative; bottom: 385px; padding: 15px; color: white;">
        <table>
            <td>
                <div style="width: 750px;">
                <div style="width: 140px; height: 120px; float: left; margin-right: 15px;">
                <img src="${place.pFilename}" style="width: 140px; height: 120px;">
                </div>
                <div style="font-size: 20px; font-weight: bold; float: left;">
               	${place.pTitle}
                </div>
                <div style="float: right; font-size: 18px; font-weight: bold;">
             	자세히 보기
                <p class="far fa-arrow-alt-circle-right" style="color: white;"></p><br><br>
                </div><br><br>
                <div style="font-size: 16px; font-weight: bold; float: left; margin-top: -15px;">${place.pmTitle}</div><br>
                <div style="font-size: 15px; float: left; margin-top: 15px;">영업시간 : ${place.pSaletime}</div>    
                </div>
            </td>
        </table>    
        </div>
        
</body>
    <script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
</body>
</html>