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
	<c:if test="${ loginMember.memberId eq meeting.memberId }">
    <div style="text-align: right;">
		<c:url var="mDelete" value="meetingDelete.do">
			<c:param name="mNo" value="${meeting.mNo}"></c:param>
		</c:url>
        <button id="Mmodify_btn">
        	<a onclick='MeetingDelete();' style="color: white;">글 삭제</a>
        </button>
        <button id="Mdelete_btn">
            <a onclick="location.href='meetingmodify.do'" style="color: white;">글 수정</a>
        </button>
    </div><br></c:if>
<section><br>
    <table style="margin: 0 auto;">
        <td>
            <div id="meetingdetail_div">
            <div id="meetingdetail_img">
            	<c:if test="${!empty meeting.moriginalFileName}">
            	<img src="/resources/meetingFiles/${meeting.moriginalFileName}" style="width: 300px; height: 300px;">
            	</c:if>
            	<c:if test="${empty meeting.moriginalFileName}">
                <img src="/resources/images/home.png" style="width: 300px; height: 300px;">
                </c:if>
            </div>
            <div id="meetingdetail_title">
                ${meeting.mTitle}
            </div>
            <div id="meetingdetail_subtitle">
                <span id="meetingdetail_date">D-7</span>
                <span id="meetingdetail_bar"></span>&nbsp;
                <span id="meetingdetail_icon" class="fas fa-users fa-4x"></span>
                <span id="meetingdetail_person">5/10</span>
            </div><br><br>
            <hr style="width: 573px; margin-left: 321px;">
            <div id="meetingdetail_content" style="float: left;">
               <textarea id="meetingdetail_textarea" readonly>${meeting.mContent}</textarea> 
            </div><br><br><br><br><br><br>
            <div id="meetingdetail_function">
                <a href="#" class="fas fa-user-plus" style="color: black;"> 
                <span id="meetingdetail_Fspan">참여하기</span>
                </a>&nbsp;&nbsp;
                <a href="#" class="far fa-comment" style="color: black;"> 
                <span id="meetingdetail_Fspan">채팅하기</span>
                </a>
            </div>
            </div>
        </td>
    </table><br>
    
    
    <div style="margin: 0 auto; center; width: 780px; height: 150px; background-color: #eeb6a5; padding: 15px; color: white;">
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
   </div><br>
    
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
		$(function() {
			getCommentList();
			$("#meetingdetail_commentinsert_btn").on("click", function() {
				var meetingdetail_commentbox = $("#meetingdetail_commentbox").val();
				var mNo = ${meeting.mNo};
				
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
			var mNo = ${meeting.mNo};
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
								$div = $("<span style='font-weight: bold; font-size: 20px;'>"+data[i].memberId+"</span><span style='font-size: 13px;'>&nbsp;&nbsp;("+data[i].mcTime+")</span><a onclick='CommentDelete("+data[i].mcNo+");' style='float: right; cursor: pointer'>&nbsp;&nbsp;[삭제]</a><span style='float: right;'>[수정]</span><br><p style='font-size: 16px; margin-top: 3px;'>"+decodeURIComponent(data[i].mcContent).replace(/\+/g, " ")+"</p><hr>");
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
	</script>
</body></html>