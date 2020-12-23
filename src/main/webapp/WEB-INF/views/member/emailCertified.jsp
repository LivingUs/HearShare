<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 이메일 인증</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    
	<script>
	function check(){
		var form = document.getElementById("code");
		var authNum = ${authNum };
		
		if (!form.value) {
			alert("인증번호를 입력해주세요.");
			return false;
		}
		
		if (form.value!=authNum) {
			alert("틀린 인증번호입니다.인증번호를 다시 입력해주세요.");
			form.authNum.value="";
			return false;
		}
		
		if(form.value==authNum) {
			alert("인증완료!");
			opener.document.getElementById('noneEmail').style.display = 'none';
			opener.document.getElementById('checkEmail').style.display = 'inline-block';
			opener.document.getElementById('emailRecheck').value = "1";
			window.close();
		}
	}
		
	</script>

</head>
<body>
	<br>
	<h5>인증번호 7자리를 입력하세요</h5>
	<br>
	<div>
		<input type="text" id="code" class="form-control" aria-describedby="emailHelp" placeholder="인증번호를 입력하세요." required style="width:70%;float:left" name="authNum">
		<input type="button" class="btn btn-secondary" onclick="return check();" style="float:left;" value="인증하기">
	</div>
	
</body>
</html>