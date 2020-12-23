<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../resources/css/member/memberJoinForm.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
</head>
<body>
	<section class="memberJoin-form">
        <br>
         <img src="../../../resources/images/home.png" style="position:relative;width:50px;left:250px;top:30px;">
        <h1>Hear : Share
            <br>
            <h3>회원가입</h3>
        </h1>
        <form action="memberJoin.do" method="post" name="memberJoinForm">
            <div class="int-area">
                <i class="fas fa-user fa-2x"></i><input type="text" name="memberId" id="memberId" autocomplete="off" required placeholder="아이디를 입력해주세요.">
                <br>
                <span class="id lengthShort">아이디는 5글자 이상입니다.</span>
                <span class="id lengthLong">아이디는 10글자 이하입니다.</span>
                <span class="id dup">이미 사용중인 아이디입니다.</span>
                <span class="id ok">사용 가능한 아이디입니다.</span>
                <input type="hidden" id="idRecheck" value="0">
            </div>
            <div class="int-area">
                <i class="fas fa-key fa-2x" style="top:40px;"></i><input type="password" name="password" id="password" autocomplete="off" required placeholder="비밀번호를 입력해주세요.">
                <span class="pw lengthError">8~20자 이내로 입력해주세요.</span>
                <input type="password" id="passwordRecheck" autocomplete="off" required placeholder="비밀번호를 재입력해주세요.">
            	<span class="pw error">비밀번호가 일치하지 않습니다.</span>
            	<input type="hidden" id="pwRecheck" value="0">
            </div>
            <div class="int-area">
                <i class="fas fa-user-circle fa-2x"></i><input type="text" name="memberName" autocomplete="off" required placeholder="이름을 입력해주세요.">
            </div>
            <div class="int-area">
                <i class="fas fa-mobile-alt fa-2x" style="left:-35px;"></i><input type="text" name="phone" autocomplete="off" required placeholder="핸드폰 번호를 입력해주세요.">
            </div>
            <div class="int-area">
                <i class="far fa-envelope fa-2x"></i><input type="text" name="email" id="email" autocomplete="off" required placeholder="이메일 주소를 입력해주세요.">
            </div>
            <div class="int-area">
                <i class="fas fa-home fa-2x" style="left:-42px;"></i><input type="text" name="roomNo" autocomplete="off" required placeholder="방 호수를 입력해주세요.">
            </div>
            <div class="int-area">
                <i class="fas fa-fingerprint fa-2x"></i><input type="text" name="code" id="code" autocomplete="off" required placeholder="인증번호를 입력해주세요.">
            </div>
            <div class="security-area">
                
                <a href="javascript:emailCertified();"><i class="far fa-envelope fa-2x"></i></a>
                <i class="fas fa-times fa-2x" id="noneEmail" style="display:inline-block;"></i>
                <i class="fas fa-check fa-2x" id="checkEmail" style="display:none;"></i>
                <input type="hidden" id="emailRecheck" name="emailRecheck" value="0">
                
                <a href="javascript:codeCertified();"><i class="fas fa-fingerprint fa-2x"></i></a>
                <i class="fas fa-times fa-2x" id="noneCode" style="display:inline-block;"></i>
                <i class="fas fa-check fa-2x" id="checkCode" style="display:none;"></i>
                <input type="hidden" id="codeRecheck" value="0">
            </div>
            
            <div class="btn-area">
                    <button type="submit" id="btn" onclick="return recheck();">JOIN</button>
            </div>
        </form>
    </section>
    
    <script>	    	
    	
    	// 입력값이 비정상적일 경우 가입을 못하게 막음
    	function recheck() {
    		if ($("#idRecheck").val() == 0) {
    			alert("아이디를 재확인해주세요.");
    			$("#memberId").focus();
    			return false;
    		} 
    		
    		if ($("#pwRecheck").val() == 0) {
    			alert("비밀번호를 재확인해주세요.");
    			$("#password").focus();
    			return false;
    		}
    		
    		if ($("#emailRecheck").val() == 0) {
    			alert("이메일 인증을 진행해주세요");
    			$("#email").focus();
    			return false;
    		}
    		
    		if ($("#codeRecheck").val() == 0) {
    			alert("인증번호 인증을 진행해주세요");
    			$("#code").focus();
    			return false;
    		} 
    		
    	}
    	
    	
    	// 아이디값 정상여부 체크
    	$("#memberId").on("input", function() {
    		var memberId = $(this).val();
    		
    		// 아이디 중복체크
    		$.ajax({
    			url : "idRecheck.do",
    			data : {"memberId" : memberId},
    			success : function(result) {
    				if (result == 'true') {
    					// 아이디 글자수 체크
    					if (memberId.length < 5) {
    		    			$(".id").hide();
    		       			$(".id.lengthShort").show();
    		    			$("#idRecheck").val(0);
    		    		} else if (memberId.length > 10) {
    		    			$(".id").hide();
    		    			$(".id.lengthLong").show();
    		    			$("#idRecheck").val(0);
    		    		} else if (5<=memberId.length<=10) {
    		    			$(".id").hide();
    		    			$(".id.ok").show();
    		    			$("#idRecheck").val(1);
    		    		}
    				} else if (result == 'false') {
    					$(".id").hide();
    					$(".id.dup").show();
    					$("#idRecheck").val(0);
    				}
    			}
    			
    		});

    	});
    	
    	
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
    	
    	// 인증번호 인증
    	function codeCertified() {
    		var email = $("#email").val();
    		var authNum = $("#code").val();
    		
    		$.ajax({
    			url : "codeCertified.do",
    			data : {"email" : email, "authNum" : authNum},
    			success : function(data) {
    				if (data == 'true') {
    					alert("인증번호 확인완료.");
    					$("#noneCode").hide();
    					$("#checkCode").show();
    					$("#codeRecheck").val(1);
    				} else {
    					alert("인증번호를 재확인해주세요.");
    					$("#code").focus();
    				}
    			}
    		});
    	}

    
    </script>
    
</body>
</html>