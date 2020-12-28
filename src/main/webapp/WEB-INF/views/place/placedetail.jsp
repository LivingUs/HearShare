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
<link rel="stylesheet" href="../../../resources/css/place/meeting_placedetail.css" />
<link rel="stylesheet" href="../../../resources/css/common/footer.css" />
</head>
<body>
	<div id="wrapper">
		<!-- Nav -->
		<jsp:include page="../common/menuBar.jsp"></jsp:include>
		<br><br>
		<div id="main">
		<article id="meeting" class="panel">>
<header>
<h3 style="float: left; font-weight: bold; font-family: 'Jal_Onuel';">&nbsp;Place</h3>
    <nav id="smallnav">
        <a onclick="location.href='meetingWriteView.do'" class="far fa-edit"><span>게시글 작성</span></a> 
        <a onclick="location.href='meeting.do'" class="fas fa-users"><span>모임하기</span></a> 
        <a onclick="location.href='place.do'" class="far fa-map"><span>장소추천</span></a> 
        <a onclick="location.href='like.do'" class="far fa-heart"><span>찜목록</span></a>
    </nav>
<hr>
</header>
<section><br>
    <table style="margin: 0 auto;">
        <td>
            <div id="placedetail_div">
            <div id="placedetail_img">
                <img src="${place.pFilename}" style="width: 300px; height: 300px;">
            </div>
            <div id="placedetail_title">
                ${place.pTitle}
            </div>
            <div id="placedetail_like">
                    <a href="javascript:addmLike();" id="place_like" style="color:red;">
                               <c:if test="${empty mLike.mCheckYn || mLike.mCheckYn eq 'N'}">
                                 <i class="far fa-heart" id="emptyHeart"></i>
                              </c:if>
                              <c:if test="${mLike.mCheckYn eq 'Y'}">
                                 <i class="fas fa-heart" id="fullHeart"></i>
                              </c:if>                            
                           </a>                
                <p id="placedetail_likesubtitle">찜하기</p>
            </div><br><br>
            <div id="placedetail_subtitle">
                ${place.pmTitle}
            </div><br>
            <hr style="width: 573px; margin-left: 321px;">
            <div id="placedetail_content">
                <li>주소<span style="position: relative; left: 127px;">${place.pAddr}</span></li>
                <li>전화번호<span style="position: relative; left: 97px;">${place.pPhone}</span></li>
                <li>가격대<span style="position: relative; left: 112px;">${place.pPrice}</span></li>
                <li>주차<span style="position: relative; left: 127px;">${place.pParkYN}</span></li>
                <li>영업시간<span style="position: relative; left: 97px;">${place.pSaletime}</span></li>
                <li>휴일<span style="position: relative; left: 127px;">${place.pClosedate}</span></li>
            </div><br><br><br><br><br><br>
            <div id="placedetail_write">
	        	<c:url var="pWrite" value="meetingWritePlaceView.do">
	        	<c:param name="pNo" value="${place.pNo}"></c:param>
	        	</c:url>
                <a href="${pWrite}" class="far fa-edit" style="color: black;"> 
                <span id="placedetail_Fspan">모임하기</span>
                </a>
            </div>
            </div>
        </td>
    </table><hr style="width: 870px;">
    
    
    <table style="margin: 0 auto;">
        <td>
        	<div id='placedetail_div2'>
        	</div><br><br>
            <div id="placedetail_review">
            </div>
            <div id="placedetail_reviewinsert">
            <input type="text" id="placedetail_reviewbox" placeholder="내용을 입력해주세요.">
            <input type="button" id="placedetail_reviewinsert_btn" class='btn btn-outline-danger' value="등록">
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
    function addmLike() {
        var pNo = "${place.pNo}";
        var memberId = "${loginMember.memberId}";
        
        $.ajax ({
           url : "addmLike.do",
           type : "post",
           data : {"pNo" : pNo, "memberId" : memberId },
           success : function(data) {
              $place_like = $("#place_like");
              
              if(data.mlikeYn == "Y") {
                 $place_like.html("");
                 $place_like.append("<i class='fas fa-heart' id='fullHeart'></i>");
              } else if (data.mlikeYn == "N") {
                 $place_like.html("");
                 $place_like.append("<i class='far fa-heart' id='emptyHeart'></i>");
              }
           }
        });
     }
	</script>
	<script>
		$(function() {
			getReviewList();
			$("#placedetail_reviewinsert_btn").on("click", function() {
				var placedetail_reviewbox = $("#placedetail_reviewbox").val();
				var pNo = ${place.pNo};
				
				$.ajax({
					url : "addReview.do",
					type : "post",
					data : {"mrContent" : placedetail_reviewbox, "pNo" : pNo},
					success : function(data) {
						if (data == "success") {
							getReviewList();
							$("#placedetail_reviewbox").val("");
						} else {
							alert("댓글 등록 실패");
						}
					}
				});
			});
		});
		
 		function getReviewList() {
			var pNo = ${place.pNo};
			$.ajax({
				url : "reviewList.do",
				type : "get",
				data : {"pNo" : pNo},
				dataType : "json",
				success : function(data) {
					$divreview = $("#placedetail_review");
					$divreview.html("");
					
					$placedetail_div2 = $("#placedetail_div2");
					$placedetail_div2.html("");
					$placedetail_title = $("<p id='placedetail_Rtitle'>리뷰 ("+ data.length +")</p>");
					
					var $mrContent;
					var $memberId;
					var $mrTime;
					
					$placedetail_div2.append($placedetail_title)
					if (data.length > 0) {
						for ( var i in data ) {
							$memberId = data[i].memberId;
							var checkId = '${loginMember.memberId }';
							if (checkId == $memberId) {
								$div = $("<span style='font-weight: bold; font-size: 20px;'>"+data[i].memberId+"</span><span style='font-size: 13px;'>&nbsp;&nbsp;("+data[i].mrTime+")</span><a onclick='ReviewDelete("+data[i].mrNo+");' style='float: right; cursor: pointer'>&nbsp;&nbsp;[삭제]</a><br><p style='font-size: 16px; margin-top: 3px;'>"+decodeURIComponent(data[i].mrContent).replace(/\+/g, " ")+"</p><hr>");
							} else {
								$div = $("<span style='font-weight: bold; font-size: 20px;'>"+data[i].memberId+"</span><span style='font-size: 13px;'>&nbsp;&nbsp;("+data[i].mrTime+")</span><br><p style='font-size: 16px; margin-top: 3px;'>"+decodeURIComponent(data[i].mrContent).replace(/\+/g, " ")+"</p><hr>");
							}
							$divreview.append($div);
						}
					} else {
						$div = $("<p style='text-align:center; font-weight:bold;'>작성된 리뷰가 없습니다 ㅠ_ㅠ</p><p style='text-align:center; font-weight:bold;'>첫 리뷰에 주인공이 되어주세요 :)</p><hr>");
						$divreview.append($div);
					}
				}
			});
		}
 		
	      function ReviewDelete(mrNo) {
	 	    	 result = confirm('리뷰를 삭제 하시겠습니까?');
	 	    	 if(result == true){
		 	         $.ajax({
		 	            url : "ReviewDelete.do",
		 	            type : "get",
		 	            data : {"mrNo" : mrNo},
		 	            success : function(data) {
		 	               if (data == "success") {
		 	            	  getReviewList();
		 	               }else {
		 	                  alert("리뷰 삭제 실패");
		 	               }
		 	            }
		 	         });
	 	    	 } else {
	 	    		 return false;
	 	    	 }
	 	      };
	</script>
</body></html>