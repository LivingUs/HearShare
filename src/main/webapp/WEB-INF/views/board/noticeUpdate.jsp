<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hear : Share</title>
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<link rel="stylesheet" href="../../../resources/css/board/boardWrite.css" />
</head>
<body>
	<div id="wrapper">
        
		<!-- Nav -->
		<jsp:include page="../common/menuBar.jsp"></jsp:include>
        <br>
        <br>
		<div id="main">
			<article class="panel intro">
				<header>
					<h3>&nbsp;Notice Update</h3>
					    <nav id="smallnav">
					        <a href="#"></a> 
					        <a href="#"></a> 
					        <a href="#"></a> 
					    </nav>
					    <hr>
				</header>
				<section>
					<article id="boardWriteForm">
					<form action="boardUpdate.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="memberId" value="${loginMember.memberId }">
							<input type="hidden" name="bNo" value="${board.bNo }">
							<div>
							<h5>Title</h5>
								<div class="input-group mb-3">
								  <input type="text" class="form-control" name="bTitle" placeholder="${board.bTitle }" aria-label="Username" aria-describedby="basic-addon1">
								</div>
								<h5>Contents
								<a href="#" class="far fa-comment-dots fa-lg" id="contentIcon"></a>
								<a href="#" class="far fa-image fa-lg" id="fileIcon"></a>
								<input type="hidden" id="iconCheck" value="0">
								</h5>
								<div class="input-group" id="writeContents">
								  <textarea class="form-control" name="bContent" aria-label="With textarea" placeholder="${board.bContent }" rows="5"></textarea>
								</div>
								<div class="input-group" id="fileContents">
								  <div class="filebox"> 
									  <input class="upload-name" value="파일선택" disabled="disabled"> 
									  <label for="ex_filename">업로드</label> 
									  <input type="file" id="ex_filename" class="upload-hidden" name="reloadFile"> 
								  </div>
								</div>			
								<br>
							</div>
							<div id="buttonGroup">
				                <input type="submit" class="btn btn-outline-danger" value="Submit">
				                <input type="reset" class="btn btn-outline-secondary" value="cancel">
			                </div>
						</form>
				    </article>
				</section>
			</article>
		</div>
	</div>
    <!-- script -->
    <script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
	<script>
		
		// 글쓰기 아이콘을 누르면 textarea만 보임
		$("#contentIcon").on("click", function() {
			$("#iconCheck").val(0);
			
			if ($("#iconCheck").val() == 0) {
    			$("#writeContents").show();
    			$("#fileContents").hide();
			} else {
    			$("#writeContents").hide();
    			$("#fileContents").show();
			}
			
		});
		
		// 사진 아이콘을 누르면 input type=file만 보임
		$("#fileIcon").on("click", function() {
			$("#iconCheck").val(1);
			
			if ($("#iconCheck").val() == 0) {
    			$("#writeContents").show();
    			$("#fileContents").hide();
			} else {
    			$("#writeContents").hide();
    			$("#fileContents").show();
			}
			
		});
		
		// 파일 업로드 공간 디자인 제이쿼리
		$(document).ready(function(){ 
			var fileTarget = $('.filebox .upload-hidden'); 
			fileTarget.on('change', function(){ 
				// 값이 변경되면 
				if(window.FileReader){ // modern browser 
					var filename = $(this)[0].files[0].name; 
				} else { // old IE 
					var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
				} // 추출한 파일명 삽입 
				$(this).siblings('.upload-name').val(filename); 
			}); 
		});

	
	</script>
	
</body>
</html>