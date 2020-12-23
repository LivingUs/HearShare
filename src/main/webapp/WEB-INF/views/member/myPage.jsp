<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="../../../resources/css/member/myPage.css" />
</head>
<body>
	<br>
	<div id="wrapper">
        
		<!-- Nav -->
		<jsp:include page="../common/menuBar.jsp"></jsp:include>
        <br>
        <br>
		<div id="main">
			<article class="panel" id="myPage">
				<header>
						<h3>&nbsp;My Page</h3>
					    <nav id="smallnav">
					        <a href="#mypage" onclick="location.href='myPage.do'" class="fas fa-user-cog"><span>마이페이지</span></a> 
					        <a href="#ticket" onclick="location.href='payAllList.do'" class="fas fa-ticket-alt"><span>정기권</span></a> 
					        <a href="#autoPay" class="far fa-credit-card"><span>결제관리</span></a> 
					        <a href="#chart" class="fas fa-chart-bar"><span>지출관리</span></a> 
					    </nav>
					    <hr>
				</header>
				<section>
					<!-- 마이페이지 메인 -->
					<article class="memberUpdate-form">
				        <form action="memberUpdate.do" method="post" name="memberUpdateForm">
				            <div class="int-area">
				                <i class="fas fa-user fa-2x"></i><input type="text" name="memberId" id="memberId" autocomplete="off" required readonly name="memberId" value="${member.memberId }">
				                <br>
				                <span class="id lengthShort">아이디는 5글자 이상입니다.</span>
				                <span class="id lengthLong">아이디는 10글자 이하입니다.</span>
				                <span class="id dup">이미 사용중인 아이디입니다.</span>
				                <span class="id ok">사용 가능한 아이디입니다.</span>
				                <input type="hidden" id="idRecheck" value="0">
				            </div>
				            <div class="int-area">
				                <i class="fas fa-key fa-2x" style="top:40px;"></i><input type="password" name="password" id="password" autocomplete="off" placeholder="변경할 비밀번호를 입력해주세요.">
				                <span class="pw lengthError">8~20자 이내로 입력해주세요.</span>
				                <input type="password" id="passwordRecheck" autocomplete="off" placeholder="변경할 비밀번호를 재입력해주세요.">
				            	<span class="pw error">비밀번호가 일치하지 않습니다.</span>
				            	<input type="hidden" id="pwRecheck" value="0">
				            </div>
				            <div class="int-area">
				                <i class="fas fa-user-circle fa-2x"></i><input type="text" name="memberName" autocomplete="off" required value="${member.memberName }" readonly>
				            </div>
				            <div class="int-area">
				                <i class="fas fa-mobile-alt fa-2x" style="left:-35px;"></i><input type="text" name="phone" autocomplete="off" required placeholder="${member.phone }">
				            </div>
				            <div class="int-area">
				                <i class="far fa-envelope fa-2x"></i><input type="text" name="email" id="email" autocomplete="off" placeholder="${member.email }">
				            </div>
				            <div class="security-area">				 
				                <a href="javascript:emailCertified();"><i class="far fa-envelope fa-2x"></i></a>
				                <i class="fas fa-times fa-2x" id="noneEmail" style="display:inline-block;"></i>
				                <i class="fas fa-check fa-2x" id="checkEmail" style="display:none;"></i>
				                <input type="hidden" id="emailRecheck" name="emailRecheck" value="0">
				            </div>
				            
				            <div class="btn-area">
				                <input type="submit" onclick="return recheck();" class="btn btn-outline-danger" value="Update">
				                <input type="reset" class="btn btn-outline-secondary" value="cancel">
				            </div>
				        </form>				    	
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
    <script>	    	
    	
    	
    	// 비밀번호값 정상여부 체크
    	$("#password").on("input", function() {
    		var password = $(this).val();
    		
    		if (password.length<8 || 20<password.length) {
    			$(".pw.lengthError").show();
    			$("#pwRecheck").val(0);
    			return;
    		} else if (8<=password.length<=20) {
    			$(".pw.lengthError").hide();
    			$("#pwRecheck").val(1);
    			return;
    		}
    	});
    	
    	
    	// 비밀번호 재확인 정상여부 체크
    	$("#passwordRecheck").on("input", function() {
    		var password = $("#password").val();
    		var passwordRecheck = $(this).val();
    		
    		if (password == passwordRecheck) {
    			$(".pw.error").hide();
    			$("#pwRecheck").val(1);
    			return;
    		} else {
    			$(".pw.error").show();
    			$("#pwRecheck").val(0);
    			return;
    		}
    	});
    	
    	   	
    	// 이메일 인증
    	function emailCertified() {
    		var email = $("#email").val();
    		window.open('emailCertified.do?email='+email,'이메일 인증', 'width=500px, height=160px, location=no');
    	}

    
    </script>  
</body>
</html>
