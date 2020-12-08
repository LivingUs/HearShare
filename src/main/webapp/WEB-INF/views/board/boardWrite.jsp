<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<article id="board" class="panel intro">
				<header>
					<h3 style="float: left; width: 30%; font-weight: bold;">&nbsp;Board</h3>
					    <nav id="smallnav">
					        <a href="#" onclick="location.href='boardWrite.do'"><i class="fas fa-edit"></i></a> 
					        <a href="#"><i class="fas fa-user-edit"></i></a> 
					        <a href="#"><i class="fas fa-search"></i></a> 
					    </nav>
					    <hr>
				</header>
				<section>
					<article id="boardWriteForm">
					<form action="#" method="post" enctype="multipart/form-data">
							<select class="custom-select">
							  <option selected>글머리를 선택해주세요</option>
							  <option value="1">소통해요</option>
							  <option value="2">궁금해요</option>
							  <option value="3">건의해요</option>
							</select>
							<br>
							<br>
							<br>
							<h5>Title</h5>
							<div class="input-group mb-3">
							  <input type="text" class="form-control" placeholder="제목을 입력해주세요." aria-label="Username" aria-describedby="basic-addon1">
							</div>
							<h5>Contents
							<a href="#" class="far fa-comment-dots fa-lg" id="contentIcon"></a>
							<a href="#" class="far fa-image fa-lg" id="fileIcon"></a>
							<input type="hidden" id="iconCheck" value="0">
							</h5>
							<div class="input-group">
							  <textarea class="form-control" aria-label="With textarea" placeholder="내용을 입력해주세요." rows="5" id="writeContents"></textarea>
							</div>
							<div class="input-group">
							  <input type="file">
							</div>			
							<br>
							<div id="buttonGroup">
				                <button type="button" class="btn btn-outline-danger">Submit</button>
				                <button type="button" class="btn btn-outline-danger">Cancel</button>
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
		
		$("#contentIcon").on("click", function() {
			var iconCheck = $("#iconCheck").val();
			
			
		});
	
	</script>
	
</body>
</html>