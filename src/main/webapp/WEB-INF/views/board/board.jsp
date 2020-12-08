<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="../../../resources/css/board/board.css" />
</head>    
<body>
<br>
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
					<!-- 자유게시판 메인 -->
					<article id="boardList">
				    	<a href="#" style="color:black;">
				    			<i class="fas fa-volume-up fa-2x"></i>
				    	</a>
				    	<br>
				    	<br>
				    	<div id="boardListSub" align="center">
				    		<a href="#">
						    	<div class="card" style="width: 21rem;">
								  <div class="card-body">
								    <h5 class="card-title">제목이다아아아아제목이다아아아아</h5>
								    <p class="card-text">내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이</p>
								    <hr>
								    <div class="card-body-other">
									    <i class="fas fa-heart fa-lg"></i>
									    <p>100</p>
									    <i class="fas fa-eye fa-lg"></i>
									    <p>100</p>
									    <p style="margin-left:60px;margin-right:0px;">2020.12.25</p>
								    </div>
								  </div>
								</div>
							</a>
							
							<a href="#">
						    	<div class="card" style="width: 21rem;">
								  <div class="card-body">
								    <h5 class="card-title">제목이다아아아아제목이다아아아아</h5>
								    <p class="card-text">내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이이다내용이이다내용이이다</p>
								    <hr>
								    <div class="card-body-other">
									    <i class="fas fa-heart fa-lg"></i>
									    <p>100</p>
									    <i class="fas fa-eye fa-lg"></i>
									    <p>100</p>
									    <p style="margin-left:60px;margin-right:0px;">2020.12.25</p>
								    </div>
								  </div>
								</div>
							</a>
							
							<a href="#">
						    	<div class="card" style="width: 21rem;">
								  <div class="card-body">
								    <h5 class="card-title">제목이다아아아아제목이다아아아아</h5>
								    <p class="card-text">내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이다내용이이다내용이이다내용이이다</p>
								    <hr>
								    <div class="card-body-other">
									    <i class="fas fa-heart fa-lg"></i>
									    <p>100</p>
									    <i class="fas fa-eye fa-lg"></i>
									    <p>100</p>
									    <p style="margin-left:60px;margin-right:0px;">2020.12.25</p>
								    </div>
								  </div>
								</div>
							</a>
							
						</div>
				    </article>
				</section>
			</article>
		</div>
	</div>
    <!-- script -->
    <script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
</body>
</html>