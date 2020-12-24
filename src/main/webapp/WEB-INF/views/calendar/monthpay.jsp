<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>월세 결제</title>

<!-- 공통으로 쓰는 라이브러리 -->
<link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="../../../resources/css/calendar/calendar.css" />
<!-- 아이콘 임포트 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<!-- jQuery -->
<script type="text/javascript"src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 결제 API -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	//결제 버튼
	function paySubmit() {
		if($("input:checkbox[name='agreeCk']").is(":checked") == true) {
			
			var payway = $("input[name=payway]:checked").val();
			var total = $("#amount").val();
			var mpNo = $("#mpNo").val();
			
			
			if($("input:radio[name='payway']").is(":checked") == true){
			/* 일반 결제시  */
				var IMP = window.IMP;
			    IMP.init('imp60714204');
			    var msg;
			    
			    IMP.request_pay({
			    	pg : 'html5_inicis',
			        pay_method : 'card',
			        merchant_uid : 'merchant_' + new Date().getTime(),
			        name :	'HEAR:SHARE',
			        amount : 100,
			        buyer_email : 'eye5277@naver.com',
			        buyer_name : '입주민',
			        buyer_tel : '010-2538-5276',
			        buyer_addr : '서울시 종로구',
			        buyer_postcode : '123-456'
			    }, function(rsp) {
			        if ( rsp.success ) {
			            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			            $.ajax({
				            url         :   "monthpayInsert.do",
				            traditional : true,
				            type        :   "post",
				            data        :   {
				                "total" : total,
				                "payway": payway,
				                "mpNo" 	: mpNo
				            },
				            success     :   function(data){
				                if(data == "OK") {
				                    location.href="calendar.do";
				                } else {
				                	alert("결제에 실패하였으니 다시 시도해 주시기 바랍니다.");
				                	location.href="calendar.do";
				                }
				            }
			            })
			        }
			    });
			/* else {	//정기결제시
				var IMP = window.IMP;
			    IMP.init('imp60714204');
			    var msg;
			    
			    IMP.request_pay({
			    	pg : 'html5_inicis',
			        pay_method : 'card',
			        merchant_uid: "issue_billingkey_monthly_0001", // 빌링키 발급용 주문번호
			        customer_uid: "gildong_0001_1234", // 카드(빌링키)와 1:1로 대응하는 값
			        name: "최초인증결제",
			        amount: 0, // 0 으로 설정하여 빌링키 발급만 진행합니다.
			        buyer_email : 'eye5277@naver.com',
			        buyer_name : '입주민',
			        buyer_tel : '010-2538-5276',
			        buyer_addr : '서울시 종로구',
			        buyer_postcode : '123-456'
			    }, function(rsp) {
			        if ( rsp.success ) {
			            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
			            $.ajax({
				            url         :   "monthpayInsert.do",
				            traditional : true,
				            type        :   "post",
				            data        :   {
				                "total" : total,
				                "payway": payway
				            },
				            success     :   function(data){
				                if(data == "OK") {
				                    location.href="calendar.do";
				                } else {
				                	alert("결제에 실패하였으니 다시 시도해 주시기 바랍니다.");
				                	location.href="calendar.do";
				                }
				            }
			            })
			        }
			    });
			} */
			} else {
				alert("결제 방식을 선택해 주세요.");
				return false;
			}
		} else {
			alert("이용 약관에 동의해 주셔야 결제가 가능합니다.");
			return false;
		}
	}
	function goBack() {
    	window.history.back();
    }
</script>

<style>
	#nav a:nth-child(3) {
	    opacity: 1.0;
	}
	
	#nav a:nth-child(3):after {
	   opacity: 1.0;
	    border-bottom-width: 0.5em;
	}
	#payBox {
		border-radius:5px; 
		width:95%; height:650px; 
		text-align: center; 
		background-color:rgb(255, 229, 226); 
		margin:auto; 
		padding:40px;
		padding-top:30px;
		position:relative;
		bottom:40px;
	}
	.head {
		height:15%;
		padding : 10px;
		font-size:18px;
	}
	#head1 {
		margin-right:170px;
		color:dimgray;
	}
	#head2 {
		font-size:45px;
		font-weight:bolder;
	}
	#head3 {
		font-size:18px;
		margin-left: 210px;
		color:dimgray;
	}
	#walletIcon {
		font-size:40px;
		color:dimgray;
	}
	#detail {
		color:white;
		font-size:17px;
		font-weight:bold;
		margin-left:60px;
	}
	#total {
		font-size:28px;
		font-weight:bolder;
		position:relative;
		left:250px;
		top:10px;
		color:#54546c;
	}
	/* #arrowIcon {
		-webkit-transform:rotate(90deg);
		margin-right:20px;
		font-size:40px;
	} */
	.table {
		cellpadding:0px;
		background:white;
	}
	thead {
		background:dimgray;
		color : white;
		border:none;
	}
	#payLine {
		margin-left:410px;
		font-weight:bold;
		font-size:20px;
	}
	#payway {
		text-align:center;
		font-size:17px;
		margin-top:10px;
	}
	#bottom {
		text-align: left; 
		font-size:14px; 
		font-weight: bolder;
		color:dimgray;
		margin-left:60px;
	}
	#agree {
		font-size:20px;
		margin-left:70px;
	}
	#agreeCk {
		margin-right:10px;
		width:15px;
		height:15px;
	}
	.btn {
		width:160px; 
		height:60px;
		font-size:18px;
		position:relative;
		left:280px;
		border-radius:4px;
		margin-right:40px;
	}
</style>
</head>
<body>
<br>
<div id="wrapper">

	<!-- 네비바 -->
	<jsp:include page="../common/menuBar.jsp"></jsp:include>
    <br>
    <br>
    <div id="main">
    
    <article id="calendar" class="panel intro">
		<header>
		    <h3 style="float: left; width: 30%; font-weight: bold; font-family:Jal_Onuel;">&nbsp;My Calendar</h3>
		    <nav id="smallnav">
		        <a href="studyReserve.do"><i class="far fa-calendar-check"></i></a>
		        <a href="calendar.do"><i class="far fa-calendar-alt"></i></a>
		    </nav>
		    <hr>
		</header><br><br>
		<section> <!--섹션 부분 수정-->
		    <div id="wrapper">
		    <form action="monthpay.do" method="post" style="display:block;" id="subForm">
		    <input type="hidden" value="${mpNo }" id="mpNo">
		        <div id="payBox">
		          <div class="head">
		         	 <span id="head1"><i class="fas fa-wallet" id="walletIcon"></i>월세 결제</span>
                  	 <span id="head2">12월</span>
                   	 <u id="head3">'${memberName }'님</u>   
                   </div> 
                <hr>
                <br>
                <span id="detail">상세 내역 고지서</span>
                <br><br><br>
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">No</th>
                      <th scope="col">형태</th>
                      <th scope="col">금액</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <th scope="row">1</th>
                      <td>월세</td>
                      <td>350,000원</td>
                    </tr>
                    <tr>
                      <th scope="row">2</th>
                      <td>관리비</td>
                      <td>50,000원</td>
                    </tr>
                    <tr>
                      <th scope="row">3</th>
                      <td>전기세</td>
                      <td>5,000원</td>
                    </tr>
                    <tr>
                      <th scope="row">4</th>
                      <td>수도세(공동)</td>
                      <td>10,000원</td>
                    </tr>
                    <tr>
                      <th scope="row">5</th>
                      <td>가스비</td>
                      <td>13,500원</td>
                    </tr>
                  </tbody>
                </table>
                <br>
                <u id="total">총액 : 428,500원</u>
                <input type="hidden" value="428500" id="amount">
		        </div>
                
                <div><br>
                <span id="payLine">결제방식<hr style="width:900px;"></span>
                <div id="payway">
                <label><input type="radio" name="payway" value="basic">일반결제</label>
                <label><input type="radio" name="payway" value="month" style="margin-left:100px;">정기결제</label>
                </div>
                </div>
		        <br><br>
		        <div id="bottom">
		            <span>-일반결제에 체크할 시, 매달 홈페이지에서 월세 결제를 해 주어야 합니다.</span><br>
                    <span>-월세는 결제를 진행한 후 환불이 어려우니 이 점을 유의하시고 고지서를 확인한 후 결제를 진행해 주시기 바랍니다.</span>
                    <br><br>
                    <span>※정기결제에 체크할 시, 결제 수단이 저장되어</span>
                    <span style="color:red; font-size:18px;">매달 1일</span>
                    <span>에 자동으로 월세가 결제됩니다.</span>&nbsp;&nbsp;&nbsp;&nbsp;
                    <span id="agree"><input type="checkbox" id="agreeCk" name="agreeCk">동의합니다.</span>
		        </div>
		        <br><br><br><br>
		        <button type="button" onclick="paySubmit()" class="btn btn-outline-danger">월세 결제</button>
		        <button type="button" onclick="goBack()" class="btn btn-outline-secondary">취소</button>
		        <br><br>
				</form>
				</div> 
				</section>
</article>
</div>
</div>
</body>
</html>