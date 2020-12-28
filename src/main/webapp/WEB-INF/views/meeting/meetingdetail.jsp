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
<link rel="stylesheet" href="../../../resources/css/meeting/meetingdetail.css" />
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
<h3 style="float: left; font-weight: bold; font-family: 'Jal_Onuel';">&nbsp;Meeting</h3>
    <nav id="smallnav">
        <a onclick="location.href='meetingWriteView.do'" class="far fa-edit"><span>게시글 작성</span></a> 
        <a onclick="location.href='meeting.do'" class="fas fa-users"><span>모임하기</span></a> 
        <a onclick="location.href='place.do'" class="far fa-map"><span>장소추천</span></a> 
        <a onclick="location.href='like.do'" class="far fa-heart"><span>찜목록</span></a>
    </nav>
<hr>
</header>
	<c:if test="${ loginMember.memberId eq meetingdetail.memberId }">
    <div style="text-align: right;">
		<c:url var="mDelete" value="meetingDelete.do">
			<c:param name="mNo" value="${meetingdetail.mNo}"></c:param>
		</c:url>
        <button id="Mmodify_btn">
        	<a onclick='MeetingDelete();' style="color: white;">글 삭제</a>
        </button>
        <button id="Mdelete_btn">
            <a onclick="location.href='meetingmodify.do'" style="color: white;">글 수정</a>
        </button>
    </div><br></c:if>
<section><br>
	<c:url var="mJoin" value="meetingJoin.do">
		<c:param name="mNo" value="${meetingdetail.mNo}"></c:param>
	</c:url>
    <table style="margin: 0 auto;">
        <td>
            <div id="meetingdetail_div">
            <div id="meetingdetail_img">
            	<c:if test="${!empty meetingdetail.mrenameFileName}">
            	<img src="/resources/meetingFiles/${meetingdetail.mrenameFileName}" style="width: 300px; height: 300px;">
            	</c:if>
            	<c:if test="${empty meetingdetail.mrenameFileName}">
                <img src="/resources/images/home.png" style="width: 300px; height: 300px;">
                </c:if>
            </div>
            <div id="meetingdetail_title">
                ${meetingdetail.mTitle}
            </div>
            <div id="meetingdetail_subtitle">
		        <c:choose>
					<c:when test="${meetingdetail.mJYN < 1 && meetingdetail.mPeoplecount == meeting.mPeople}">
					<span id="meetingdetail_date">마감</span>
				    </c:when>
				    <c:when test="${meetingdetail.mJYN > 0 && meetingdetail.mPeoplecount == meeting.mPeople}">
				    <span id="meetingdetail_date">마감</span>
				    </c:when>
				    <c:when test="${meetingdetail.mJYN < 1 && meetingdetail.mPeoplecount != meeting.mPeople}">
				    <span id="meetingdetail_date">마감</span>
				    </c:when>
				    <c:when test="${meetingdetail.mJYN > 0 && meetingdetail.mPeoplecount != meeting.mPeople}">
				    <span id="meetingdetail_date">D-${meetingdetail.mJYN}</span>
				    </c:when>
				</c:choose>
                <span id="meetingdetail_bar"></span>&nbsp;
                <span id="meetingdetail_icon" class="fas fa-users fa-4x"></span>
                <span id="meetingdetail_person">${meetingdetail.mPeoplecount}/${meetingdetail.mPeople}</span>
            </div><br><br>
            <hr style="width: 573px; margin-left: 321px;">
            <div id="meetingdetail_content" style="float: left;">
               <textarea id="meetingdetail_textarea" readonly>${meetingdetail.mContent}</textarea> 
            </div><br><br><br><br><br><br>
            <div id="meetingdetail_function">
                <a onclick='MeetingJoin();' class="fas fa-user-plus" style="color: black; text-decoration: none; cursor: pointer;"> 
                <span id="meetingdetail_Fspan">참여하기</span>
                </a>&nbsp;&nbsp;
                <a href="#" class="far fa-comment" style="color: black;"> 
                <span id="meetingdetail_Fspan">채팅하기</span>
                </a>
            </div>
            </div>
        </td>
    </table><br>
    
    <c:if test="${meetingdetail.pNo > 0}">
    <div style="margin: 0 auto; center; width: 780px; height: 150px; background-color: #eeb6a5; padding: 15px; color: white;">
        <table>
            <td>
            	<c:url var="pDetail" value="placedetail.do">
        		<c:param name="pNo" value="${meetingdetail.pNo}"></c:param>
        		</c:url>
                <div style="width: 750px;">
                <div style="width: 140px; height: 120px; float: left; margin-right: 15px;">
                <img src="${meetingdetail.pFilename}" style="width: 140px; height: 120px;">
                </div>
                <div style="font-size: 20px; font-weight: bold; float: left;">
               	${meetingdetail.pTitle}
                </div>
                <div style="float: right; font-size: 18px; font-weight: bold;">
             	자세히 보기
                <a href="${pDetail}" class="far fa-arrow-alt-circle-right" style="color: white;"></a><br><br>
                </div><br><br>
                <div style="font-size: 16px; font-weight: bold; float: left; margin-top: -15px;">${meetingdetail.pmTitle}</div><br>
                <div style="font-size: 15px; float: left; margin-top: 15px;">영업시간 : ${meetingdetail.pSaletime}</div>    
                </div>
            </td>
        </table>    
   </div><br>
   </c:if>
    
    <hr style="width: 870px;">
    <table style="margin: 0 auto;">
        <td>
            <div id="meetingdetail_div2">
            </div><br><br>
            <div id="meetingdetail_comment">
            </div>
            <div id="meetingdetail_commentinsert">
            <input type="text" id="meetingdetail_commentbox" placeholder="내용을 입력해주세요.">
            <input type="button" id="meetingdetail_commentinsert_btn" class='btn btn-outline-danger' value="등록">
            </div>
        </td>
    </table><br><br>
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
		$(function() {
			getCommentList();
			$("#meetingdetail_commentinsert_btn").on("click", function() {
				var meetingdetail_commentbox = $("#meetingdetail_commentbox").val();
				var mNo = ${meetingdetail.mNo};
				
				$.ajax({
					url : "addComment.do",
					type : "post",
					data : {"mcContent" : meetingdetail_commentbox, "mNo" : mNo},
					success : function(data) {
						if (data == "success") {
							getCommentList()
							$("#meetingdetail_commentbox").val("");
						} else {
							alert("댓글 등록 실패");
						}
					}
				});
			});
		});
		
 		function getCommentList() {
			var mNo = ${meetingdetail.mNo};
			$.ajax({
				url : "commentList.do",
				type : "get",
				data : {"mNo" : mNo},
				dataType : "json",
				success : function(data) {
					$divcomment = $("#meetingdetail_comment");
					$divcomment.html("");
					
					$meetingdetail_div2 = $("#meetingdetail_div2");
					$meetingdetail_div2.html("");
					$meetingdetail_Ctitle = $("<p id='meetingdetail_Ctitle'>댓글 ("+ data.length +")</p>");
					
					var $mcContent;
					var $memberId;
					var $mcTime;
					var $mcomment;
					var $loginMember;
					
					$meetingdetail_div2.append($meetingdetail_Ctitle)
					if (data.length > 0) {
						for ( var i in data ) {
							$memberId = data[i].memberId;
							var checkId = '${loginMember.memberId }';
							if (checkId == $memberId) {
								$div = $("<span style='font-weight: bold; font-size: 20px;'>"+data[i].memberId+"</span><span style='font-size: 13px;'>&nbsp;&nbsp;("+data[i].mcTime+")</span><a onclick='CommentDelete("+data[i].mcNo+");' style='float: right; cursor: pointer'>&nbsp;&nbsp;[삭제]</a><br><p style='font-size: 16px; margin-top: 3px;'>"+decodeURIComponent(data[i].mcContent).replace(/\+/g, " ")+"</p><hr>");
							} else {
								$div = $("<span style='font-weight: bold; font-size: 20px;'>"+data[i].memberId+"</span><span style='font-size: 13px;'>&nbsp;&nbsp;("+data[i].mcTime+")</span><br><p style='font-size: 16px; margin-top: 3px;'>"+decodeURIComponent(data[i].mcContent).replace(/\+/g, " ")+"</p><hr>");
							}
							$divcomment.append($div);
						}
					} else {
						$div = $("<p style='text-align:center; font-weight:bold;'>작성된 댓글이 없습니다 ㅠ_ㅠ</p><p style='text-align:center; font-weight:bold;'>첫 댓글에 주인공이 되어주세요 :)</p><hr>");
						$divcomment.append($div);
					}
				}
			});
		} 
 		
	     function CommentDelete(mcNo) {
 	    	 result = confirm('댓글을 삭제 하시겠습니까?');
 	    	 if(result == true){
	 	         $.ajax({
	 	            url : "CommentDelete.do",
	 	            type : "get",
	 	            data : {"mcNo" : mcNo},
	 	            success : function(data) {
	 	               if (data == "success") {
	 	            	  getCommentList();
	 	               }else {
	 	                  alert("댓글 삭제 실패");
	 	               }
	 	            }
	 	         });
 	    	 } else {
 	    		 return false;
 	    	 }
 	      };
 	    
 	     function MeetingDelete() {
 	    	result = confirm('모임글을 삭제하시겠습니까?');
 	    	if(result == true){
 	    		location.href="${mDelete}";
 	    	} else {
 	    		return false;
 	    	}
 	    };
 	    
	     function MeetingJoin() {
	 	    	result = confirm('모임에 참여하시겠습니까?');
	 	    	var loginMemberId = '${loginMember.memberId}';
	 	    	var writeMemberId = '${meetingdetail.memberId}';
	 	    	var joinMemberId = '${meeting.joinMemberId}';
	 	    	var mNo = '${meetingdetail.mNo}';
	 	    	
 	 	    	if(result == true){
 	 	    		if(writeMemberId == loginMemberId) {
	 	    			alert("모임 주죄차이십니다.");
	 	    			return false;
 	 	    		} else if(joinMemberId == loginMemberId) {
 	 	    			alert("이미 모임에 참가하셨습니다.");
				 	    return false;
 	 	    		} else {
		 	    		alert("모임에 참가되셨습니다.");
		 	    		location.href="${mJoin}";
		 	    	} 
 	 	    	} else {
 	 	    		return false;
 	 	    	}
	     };
	</script>
</body></html>