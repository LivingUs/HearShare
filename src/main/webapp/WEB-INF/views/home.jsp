<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>Hear : Share</title>
    <meta charset="utf-8" />
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
    <link rel="stylesheet" href="../../resources/css/home.css" />
</head>
<body>

	<div id="mainForm">
        <section class="home-form">
	        <pre>  듣다   여기</pre>
	        <img src="../../resources/images/home.png">
	            <br>
	        <h1>Hear : Share</h1>
	        <br>
        </section>

        <!-- Nav -->
		<jsp:include page="common/menuBar.jsp"></jsp:include>
		
		<div id="welcome">
			<h2>${loginMember.memberName }님 Hear : Share에 오신걸 환영합니다!</h2>
			<img src="../../resources/images/firework.gif">
		</div>
	</div>
	
	<script>

		//내 코드
		var d = new Date();
		var day = d.getDate();
		var month = d.getMonth()+1;
		
		
		window.onload = function () {
		    if (window.Notification) {
		        Notification.requestPermission();
		    }
		}
		
		$(function() {
			if(day == 27) {
		    setTimeout(function () {
		    	notify();
		    }, 1000);
			}
		});
		
		function notify() {
		    	if (Notification.permission != "denied") {
		    	    Notification.requestPermission(permission => {
		    	      if (permission === "granted") {
		    	    	  var notification = new Notification(month+'월의 월세 납부일입니다.', {
							  icon : '/resources/images/home.png',
		    	    		  body: '알림창을 클릭하시면                           캘린더 페이지로 이동됩니다 :)',
		                      requireInteraction : true
		    	    	  });
		    	    	  
		                      notification.onclick = function () {
		                          location.href="/calendar.do";
		                      };
		    	      }
		    	      })
		    	    }else {
		    	        alert('Notification denied');
		    	      }
		    }
</script>
</body>
</html>