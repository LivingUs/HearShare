<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1">
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
					<h3>&nbsp;Board</h3>
					    <nav id="smallnav">
					    	<c:if test="${loginMember.memberId eq 'admin' }">
					    		<a href="#" onclick="location.href='noticeWriteForm.do'" class="fas fa-edit"><span>게시글 쓰기</span></a>					        			        
					        	<a class="fas fa-search" data-toggle="modal" href="#myModal"><span>게시물 검색</span></a>
					    	</c:if>
					    	<c:if test="${loginMember.memberId ne 'admin' }">
					    		<a href="#" onclick="location.href='boardWriteForm.do'" class="fas fa-edit"><span>게시글 쓰기</span></a> 
					        	<a href="#" onclick="location.href='myBoard.do'" class="fas fa-user-edit"><span>내가 쓴 글</span></a>					        
					        	<a class="fas fa-search" data-toggle="modal" href="#myModal"><span>게시물 검색</span></a>
					    	</c:if>
					    	<!-- 검색 모달창 -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
								<div class="modal-dialog" role="document"> 
									<div class="modal-content">
										<form action="boardSearch.do" method="get">
											<div class="modal-header"> 
												<h5 class="modal-title">Board Search</h5> 
											</div> 
											<div class="modal-body">
												<select class="custom-select" style="margin-bottom:10px;" name="searchValue">
												  <option selected>검색할 항목을 선택해주세요.</option>
												  <option value="bTitle">제목</option>
												  <option value="bHead">글머리</option>
												  <option value="memberId">작성자</option>
												</select>
												<input type="text" class="form-control" placeholder="검색어를 입력해주세요." name="searchContent">
											</div> 
											<div class="modal-footer">
												<button type="submit" class="btn btn-outline-danger">Search</button> 
												<button type="reset" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>											
											</div> 
										</form>
									</div> 
								</div> 
							</div>
					    </nav>
					    <hr>
				</header>
				<section>
					<!-- 자유게시판 메인 -->
					<article id="boardList">
				    	<i class="fas fa-volume-up fa-2x" id="noticeIcon"></i>
				    	<div id="noticeRolling">
							<ul>
					    		<c:forEach items="${bList }" var="bList">
	 					    		<c:url var="bContent" value="boardContent.do">
										<c:param name="bNo" value="${bList.bNo }"></c:param>
									</c:url>
									<c:if test="${bList.memberId eq 'admin' }">
												<li><a href="${bContent}">${bList.bTitle }</a></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>
				    	<br>
				    	<hr>
				    	<!-- 게시판 리스트 출력 -->
					   	<div id="boardListSub" align="center">
					   	<c:forEach items="${bList }" var="bList">
							<c:url var="bContent" value="boardContent.do">
						<c:param name="bNo" value="${bList.bNo }"></c:param>
						</c:url>
						<c:if test="${bList.memberId ne 'admin' }">
							<a href="${bContent }">
								<div class="card" style="width: 21rem;">
							 <div class="card-body">
							<h5 class="card-title">${bList.bTitle }</h5>
							<h6 id="boardHead">#${bList.bHead }</h6>
							   <c:if test="${bList.bFileName ne null }">
							  	<p class="card-text" id="inFile">${bList.bContent }</p>
							  	<div id="imgArea">
							  		<img src="../../../resources/bUploadFiles/${bList.bFileName }">
							  	</div>
						  </c:if>
						  <c:if test="${bList.bFileName eq null }">
						  	<p class="card-text" id="noneFile">${bList.bContent }</p>
						  </c:if>
						  <hr>
						  <div class="card-body-other">
						   <i class="fas fa-heart fa-lg"></i>
						   <p>${bList.bLike }</p>
						   <i class="fas fa-eye fa-lg"></i>
						   <p>${bList.bViewNo }</p>
						   <p>${bList.bWriteDate }</p>
							    </div>
							  </div>
							</div>
						</a>
						</c:if>
						</c:forEach>
					   	</div>
				    </article>
				</section>
			</article>
		</div>
		<!-- Footer -->
		<jsp:include page="../common/footer.jsp"></jsp:include>
		
	</div>
    <!-- script -->
	<script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
    <script src="../../../resources/js/vticker.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    
    <script>
    var i = 1;
    
    // 공지사항 스크롤 롤링
	$(function(){
		$("#noticeRolling").vTicker({ 
				speed: 300,
				pause: 2000,
				animation: 'fade',
				mousePause: true,
				showItems: 1
		});
	});
	
     
    </script>

</body>
</html>