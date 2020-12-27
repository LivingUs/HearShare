<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 10초 마다 새로고침 -->
<!-- <META HTTP-EQUIV="refresh" CONTENT="10"> -->
<title>Hear : Share</title>
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<link rel="stylesheet" href="../../../resources/css/board/boardContent.css" />
</head>
<body>
	<div id="wrapper">
        
		<!-- Nav -->
		<jsp:include page="../common/menuBar.jsp"></jsp:include>
        <br>
        <br>
		<div id="main">
			<article class="panel intro">
				<section>
					<article id="boardContent">
						<input type="hidden" value="${board.bNo }" name="bNo">
                        <h4>${board.bTitle }</h4>
                        <br>
                        <h6 style="float: left; width: 30%;">${board.memberId }</h6>
                        <nav id="smallnav">
                        	<c:if test="${board.memberId eq loginMember.memberId }">
                        		<c:if test="${board.memberId eq 'admin' }">
			                        <a href="#" class="fas fa-user-edit" onclick="updateNotice();"><span>수정</span></a> 
								    <a href="#" class="far fa-trash-alt" onclick="return questionBoard();"><span>삭제</span></a>
								    <a href="#" class="fas fa-list" onclick="location.href='boardList.do'"><span>목록</span></a>
						    	</c:if>
						    	<c:if test="${board.memberId ne 'admin' }">
			                        <a href="#" class="fas fa-user-edit" onclick="updateBoard();"><span>수정</span></a> 
								    <a href="#" class="far fa-trash-alt" onclick="return questionBoard();"><span>삭제</span></a>
								    <a href="#" class="fas fa-list" onclick="location.href='boardList.do'"><span>목록</span></a>
						    	</c:if>
						    </c:if>
						    <c:if test="${board.memberId ne loginMember.memberId }">
						    <a class="fas fa-list" onclick="location.href='boardList.do'" style="left : 690px;"><span>목록</span></a>
						    </c:if> 
					    </nav>
					    <br>					  
                        <hr>
					    <c:if test="${board.bFileName ne null }">
					    <div>
					    	<pre id="inFile">${board.bContent }</pre>
					    </div>
					    <div>
					    	<img src="../../../resources/bUploadFiles/${board.bFileName }">
					    </div>
					    </c:if>
					    <c:if test="${board.bFileName eq null }">
					    	<pre id="noneFile">${board.bContent }</pre>
					    </c:if>
                        <br>
                        <div id="boardContentOther">
                        	<a href="javascript:addbLike();" id="bLikeHeart">
                         		<c:if test="${empty bLike.lCheckYn || bLike.lCheckYn eq 'N'}">
                        			<i class="far fa-heart fa-2x" id="emptyHeart"></i>
                        		</c:if>
                        		<c:if test="${bLike.lCheckYn eq 'Y'}">
                        			<i class="fas fa-heart fa-2x" id="fullHeart"></i>
                        		</c:if>                      		
                        	</a>
							<p id="bLike">${board.bLike }</p>
							<i class="fas fa-eye fa-2x"></i>
							<p>${board.bViewNo }</p>
                            <p style="margin-left:810px;margin-right:0px;">${board.bUpdateDate }</p>
                        </div>
                        <br>
                        <hr style="float:left;width:1060px;">
                        <div id="frontComment"></div>                     
				    </article>
				</section>
			</article>
		</div>
        <div id="commentInput">
            <input type="text" class="form-control" placeholder="댓글을 입력해주세요" id="bcContent">
            <input type="submit" class="btn btn-danger" value="댓글등록" id="cSubmit">
        </div>
	</div>
    <!-- script -->
    <script src="../../../resources/js/jquery.min.js"></script>
    <script src="../../../resources/js/breakpoints.min.js"></script>
    <script src="../../../resources/js/main.js"></script>
    <script>   		
    
	    // 게시물 삭제확인
	    function questionBoard() {
	    	if (confirm("정말 삭제하시겠습니까?") == true){
	    		var bNo = '${board.bNo }';
	    		location.href = "boardDelete.do?bNo="+bNo;
	    	}else {
	    	    return;
			}
	    }
	    
	    // 게시물 수정
	    function updateBoard() {
	    	var bNo = '${board.bNo }';
	    	location.href = "boardUpdateView.do?bNo="+bNo;
	    } 
	    
	    // 공지사항 수정
	    function updateNotice() {
	    	var bNo = '${board.bNo }';
	    	location.href = "noticeUpdateView.do?bNo="+bNo;
	    }    
    
    
	    $(function() {
	    	
	    	getCommentList();
	    	
	    	setInterval(function() {
	    		getCommentList();
			}, 5000);
	    	
	    	// 댓글 등록
	    	$("#cSubmit").on("click", function() {
	    		var bcContent = $("#bcContent").val();
	    		var bNo = ${board.bNo};
	    			
	    		$.ajax({
	    			url : "insertComment.do",
	    			type : "post",
	    			data : {"bcContent" : bcContent, "bNo" : bNo},
	    			success : function(data) {
	    				if (data == "success"){
	    					getCommentList();
	    					$("#bcContent").val("");
	    				} else {
	    					alert("댓글 등록에 실패하였습니다.");
	    				}
	    			}
	    		});
	    			
	    	});
	    });
		
	    // 댓글 삭제 확인
	    function questionComment(bcNo){
	    	if (confirm("정말 삭제하시겠습니까?") == true){
	    		var bNo = '${board.bNo }';
	    		var bcNo = bcNo;
	    		location.href = "commentDelete.do?bNo="+bNo+"&bcNo="+bcNo;
	    	}else {
	    	    return;
			}
	    }
	    
    	 
    	// 댓글 조회
     	function getCommentList() {
     		var bNo = ${board.bNo};
     			
     		$.ajax({
     			url : "boardCommentList.do",
     			type : "get",
     			data : {"bNo" : bNo},
     			dataType : "json",
     			success : function(data) {
     				
     				$frontComment = $("#frontComment");
     				$frontComment.html("");
     				
     				var $div;
     				var $br;
     				var $memberId;
     				var $bcContent;
     				var $bcTime;
     				var $delete;
     				var $hr
					if (data.length > 0) {
						for (var i in data) {
							$div = $("<div class='boardComment' id='boardComment'>");
							$memberId = $("<h6>").text(data[i].memberId);
							$bcTime = $("<h6 style='margin-left:30px;' class='commentWriteTime' id='bcWriteDate'>").text(transferTime(data[i].bcTime));
							$br = $("<br><br>");
							$bcContent = $("<p id='bcComment'>").text(decodeURIComponent(data[i].bcContent.replace(/\+/g," ")));
							$delete = $("<button class='btn btn-outline-danger' onclick='questionComment("+data[i].bcNo+");' id='commentDelete'>").text("삭제");
							$hr = $("<hr style='width:1060px;'>");
							
							$frontComment.append($div);
							$div.append($memberId);
							$div.append($bcTime);
							$div.append($br);
							$div.append($bcContent);
							if (data[i].memberId == "${loginMember.memberId}") {
								$div.append($delete);
							}
							$div.append($hr);
							
						}
					} else {
						$frontComment.append("<div class='boardComment' id='boardComment'><h6>등록된 댓글이 없습니다.</h6></div>");
					}  				
     			}
     		});
     			
     	}	 
    	
    	
     	// 하트 아이콘 클릭 시 발생 이벤트
    	function addbLike() {
    		var bNo = ${board.bNo};
    		var memberId = "${loginMember.memberId}";
    		
    		$.ajax ({
    			url : "addbLike.do",
    			type : "post",
    			data : {"bNo" : bNo, "memberId" : memberId },
    			success : function(data) {
    				$bLikeHeart = $("#bLikeHeart");
    				
    				if(data.likeYn == "Y") {
    					$bLikeHeart.html("");
    					$bLikeHeart.append("<i class='fas fa-heart fa-2x' id='fullHeart'></i>");
    				} else if (data.likeYn == "N") {
    					$bLikeHeart.html("");
    					$bLikeHeart.append("<i class='far fa-heart fa-2x' id='fullHeart'></i>");
    				}
    				
    				$p = $("#bLike");
    				$p.html("");
    				$p.append(data.likeCount);
    				
    			}
    		});
    		
    	}
		
     	// 댓글 작성시간 비교 후 출력
     	function transferTime(time){    
     	     var now = new Date();
     	     var sYear = time.substring(0,4);
     	     var sMonth = time.substring(4,6)-1;
     	     var sDate = time.substring(6,8);
     	     var sHour = time.substring(8,10);
     	     var sMin = time.substring(10,12);
     	     var sSecond = time.substring(12,14);
     	     var sc = 1000;
     	 
     	     var today = new Date(sYear,sMonth,sDate,sHour,sMin,sSecond);
     	     //지나간 초
     	     var pastSecond = parseInt((now-today)/sc,10);
     	 
     	     var date;
     	     var hour;
     	     var min;
     	     var str = "";
     	 
     	     var restSecond = 0;
     	     if(pastSecond > 86400){
     	      date = parseInt(pastSecond / 86400,10);
     	      restSecond = pastSecond % 86400;
     	      str = date + "일 전";
     	     }else if(pastSecond > 3600){
     	      hour = parseInt(pastSecond / 3600,10);
     	      restSecond = pastSecond % 3600;
     	      str = str + hour + "시간 전";
     	     }else if(pastSecond > 60){
     	      min = parseInt(pastSecond / 60,10);
     	      restSecond = pastSecond % 60;
     	      str = str + min + "분 전";
     	     }else{
     	      str = pastSecond + "초 전";
     	     }
     	 
     	     if(str=="0초 전"){
     	         str = "방금 전";
     	     }
     	     
     	     return str;
     	}

	
 
		 
    </script>
    
</body>
</html>