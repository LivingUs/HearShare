<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Hear : Share</title>
<meta charset="utf-8" />
<link href='../resources/fullcal/core/main.css' rel='stylesheet' />
<link href='../resources/fullcal/daygrid/main.css' rel='stylesheet' />
<script src='../resources/fullcal/core/main.js'></script>
<script src='../resources/fullcal/daygrid/main.js'></script>
<script>
    /* $(document).ready(function() {
        $("#btn_study").click(function() {
            $("#studyreservation").removeClass('d-none');
            $("#healthreservation").addClass('d-none');
            $("#bbqreservation").addClass('d-none');
        });
    });
    $(document).ready(function() {
        $("#btn_health").click(function() {
            $("#studyreservation").addClass('d-none');
            $("#healthreservation").removeClass('d-none');
            $("#bbqreservation").addClass('d-none');
        });
    });
    $(document).ready(function() {
        $("#btn_bbq").click(function() {
            $("#studyreservation").addClass('d-none');
            $("#healthreservation").addClass('d-none');
            $("#bbqreservation").removeClass('d-none');
        });
    }); */
    /* 
	  function themeBtn(this.id){
	    	console.log(this.id);
	    }); */
	    
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'interaction', 'dayGrid', 'timeGrid' ],
			defaultView : 'dayGridMonth',
			defaultDate : new Date(),
			header : {
				left : 'prev,next today',
				center : 'title',
				right : ''
			},
		});
		calendar.render();
	});
</script>
</head>
<style>
    #btn_study,
    #btn_health,
    #btn_bbq {
        width: 291px;
        height: 60px;
        background-color: #F7DBD3;
        color: black;
        font-size: 22px;
        font-weight: bold;
        cursor: pointer;
        border: none;
        margin: -2px;
    }
    
    #btn_health {
        border-right: 2px solid lightgray;
        border-left: 2px solid lightgray;
        height: 60px;
    }
    
    #btn_study:hover,
    #btn_health:hover,
    #btn_bbq:hover {
        background-color: #eeb6a5;
    }
</style>
<body>
<br>
<header>
    <h3 style="float: left; width: 30%; font-weight: bold;">&nbsp;캘린더</h3>
    <nav id="smallnav">
        <a href="#studyreservation" class="icon far fa-heart"></a>
        <a href="#" class="icon far fa-heart"></a>
        <a href="#" class="icon far fa-heart"></a>
    </nav>
    <hr>
</header><br><br>
<section> <!--섹션 부분 수정-->
    <div style="font-weight:bold;">
        <div style="text-align: center;">
            <button id="btn_study" onclick="themeBtn(this.id)">스터디룸</button>
            <button id="btn_health" onclick="themeBtn(this.id)">헬스룸</button>
            <button id="btn_bbq" onclick="themeBtn(this.id)">바베큐장</button>
        </div><br><br>
        <div style="width: 100%; text-align: center;">
            <div id="studyreservation" style="display: inline-block; padding: 50px; text-align: center;">
                <div id="calendar" style="border: 1px solid black; width: 380px; height: 380px; float: left;"></div>
                <div style="border: 1px solid lightgray; width: 1px; height: 400px; float: left; margin: 0px 30px 0px 30px; position: relative; bottom: 10px;"></div>
                <div style="width: 330px; height: 120px; background-color: #eeb6a5; float: left; padding: 25px;">
                <span style="float:left; color: white; margin-right:20px;">테마룸 종류 : </span>
                <input type="text" style="width: 130px; text-align: center; float:left;  font-size:15px;" readonly value="스터디룸"><br><br>
                <span style="color: white; float:left; margin-right:20px;">정기권 사용 : </span>
                <select style="width: 150px; text-align: center; float:left;  font-size:15px;">
                    <option>스터디룸 3시간</option>
                    <option>스터디룸 5시간</option>
                    <option>스터디룸 10시간</option>
                </select>
                </div><br>
                <div style="width: 330px; height: 220px; background-color: #eeb6a5; float: left; padding: 20px; position: relative; top: 50px; color: white;">
           		    <section id="time">
               		         시간 선택 박스
                        <div id="timeBox" style="font-weight:400;">
                            <div class="check" style="width:100%; height:30%; display:inline; color:gray; background:white;">
                            <label for="ten" id="checkborder">10:00~11:00
                            <div style="width:30%; height:90%; display:inline;/*  visibility:hidden; */">
                            <input type="checkbox" name="10" id="ten" value="10:00~11:00" style="border:0px;">
                            </div>
                            </label>
                            <label for="eleven" id="checkborder">11:00~12:00
                            <div style="width:30%; height:90%; display:inline;/*  visibility:hidden; */">
                            <input type="checkbox" name="10" id="eleven" value="10:00~11:00" style="border:0px;">
                            </div>
                            </label>
                            <label for="twelve" id="checkborder">12:00~13:00
                            <div style="width:30%; height:90%; display:inline;/*  visibility:hidden; */">
                            <input type="checkbox" name="10" id="twelve" value="10:00~11:00" style="border:0px;">
                            </div>
                            </label>
                            <label for="Thirt" id="checkborder">13:00~14:00
                            <div style="width:30%; height:90%; display:inline;/*  visibility:hidden; */">
                            <input type="checkbox" name="10" id="Thirt" value="10:00~11:00" style="border:0px;">
                            </div>
                            </label>
                             <label for="fourth" id="checkborder">14:00~15:00
                            <div style="width:30%; height:90%; display:inline;/*  visibility:hidden; */">
                            <input type="checkbox" name="10" id="fourth" value="10:00~11:00" style="border:0px;">
                            </div>
                            </label>
                             <label for="fifth" id="checkborder">15:00~16:00
                            <div style="width:30%; height:90%; display:inline;/*  visibility:hidden; */">
                            <input type="checkbox" name="10" id="fifth" value="10:00~11:00" style="border:0px;">
                            </div>
                            </label>
                             <label for="sixth" id="checkborder">16:00~17:00
                            <div style="width:30%; height:90%; display:inline;/*  visibility:hidden; */">
                            <input type="checkbox" name="10" id="sixth" value="10:00~11:00" style="border:0px;">
                            </div>
                            </label>
                             <label for="seventh" id="checkborder">17:00~18:00
                            <div style="width:30%; height:90%; display:inline;/*  visibility:hidden; */">
                            <input type="checkbox" name="10" id="seventh" value="10:00~11:00" style="border:0px;">
                            </div>
                            </label>
                             <label for="eighth" id="checkborder">18:00~19:00
                            <div style="width:30%; height:90%; display:inline;/*  visibility:hidden; */">
                            <input type="checkbox" name="10" id="eighth" value="10:00~11:00" style="border:0px;">
                            </div>
                            </label>
                             <label for="ninth" id="checkborder">19:00~20:00
                            <div style="width:30%; height:90%; display:inline;/*  visibility:hidden; */">
                            <input type="checkbox" name="10" id="ninth" value="10:00~11:00" style="border:0px;">
                            </div>
                            </label>
                            </div>
                        </div>
                    </section>
                </div>
                <div style="width: 210px; height: 40px; background-color: #eeb6a5; float: left; padding: 10px; position: relative; top: 70px; color: white;">
                총액 : ${calender.count}원
                </div>
                <button style="width: 90px; height: 30px; background-color: #FF7C6D; border: none; float: left; position: relative; top: 75px; left: 20px; color: white; font-size:14px; border-radius:5px;">
                예약하기
                </button><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <ul style="text-align: left; font-size:13px; font-weight: bolder;">
                <li>스터디룸, 헬스룸 입실시에 꼭!! 입구에서 입실을 눌러 주세요.</li>
                <li>예약취소는 '나의 일정'에서 가능하며, 입실 확인이 되지 않은 상태에서만 가능합니다.</li>
                <li>예약취소를 하지 않으면 환불이 어려우니 이 점 유의하시기 바랍니다.</li>
                <li>바베큐파티는 사용 후에는 다음 이용 주민을 위해 깔끔하게 정리하는 센스!</li>
                </ul><br><br>
                <p style="text-align: right; font-size: 20px; font-weight: bold; position: relative; right: 20px;">테마룸 정기권이 필요하세요?</p>
                <button style="width: 300px; height: 40px; background-color: #eeb6a5; border: none; float: right; color: white;">
                정기권 결제하러 가기 ▶
                </button>
            </div>
            
    <!--       헬스                        -->
            <div id="healthreservation" class="d-none" style="display: inline-block; padding: 50px; text-align: center;">
                <div style="border: 1px solid black; width: 380px; height: 380px; float: left;">대충 캘린더</div>
                <div style="border: 1px solid lightgray; width: 1px; height: 400px; float: left; margin: 0px 30px 0px 30px; position: relative; bottom: 10px;"></div>
                <div style="width: 330px; height: 150px; background-color: #eeb6a5; float: left; padding: 20px;">
                <span style="color: white;">테마룸 종류 : </span>
                <input type="textbox" style="width: 150px; text-align: center;" readonly value="헬스룸"><br><br><br>
                <span style="color: white;">정기권 사용 : </span>
                <select style="width: 150px; text-align: center;">
                    <option>헬스룸 3시간</option>
                    <option>헬스룸 5시간</option>
                    <option>헬스룸 10시간</option>
                </select>
                </div><br>
                <div style="width: 330px; height: 180px; background-color: #eeb6a5; float: left; padding: 20px; position: relative; top: 50px; color: white;">
                대충 시간 선택 하는 곳
                </div>
                <div style="width: 210px; height: 40px; background-color: #eeb6a5; float: left; padding: 10px; position: relative; top: 70px; color: white;">
                총액 : ${calender.count}원
                </div>
                <button style="width: 90px; height: 30px; background-color: #FF7C6D; border: none; float: left; position: relative; top: 75px; left: 20px; color: white;">
                예약하기
                </button><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <ul style="text-align: left;">
                <li>스터디룸, 헬스룸 입실시에 꼭!! 입구에서 입실을 눌러 주세요.</li>
                <li>예약취소는 '나의 일정'에서 가능하며, 입실 확인이 되지 않은 상태에서만 가능합니다.</li>
                <li>예약취소를 하지 않으면 환불이 어려우니 이 점 유의하시기 바랍니다.</li>
                <li>바베큐파티는 사용 후에는 다음 이용 주민을 위해 깔끔하게 정리하는 센스!</li>
                </ul><br><br>
                <p style="text-align: right; font-size: 20px; font-weight: bold; position: relative; right: 20px;">테마룸 정기권이 필요하세요?</p>
                <button style="width: 300px; height: 40px; background-color: #eeb6a5; border: none; float: right; color: white;">
                정기권 결제하러 가기 ▶
                </button>
            </div>
            
    <!--             바베큐                                  -->
            <div id="bbqreservation" class="d-none" style="display: inline-block; padding: 50px; text-align: center;">
                <div style="border: 1px solid black; width: 380px; height: 380px; float: left;">대충 캘린더</div>
                <div style="border: 1px solid lightgray; width: 1px; height: 400px; float: left; margin: 0px 30px 0px 30px; position: relative; bottom: 10px;"></div>
                <div style="width: 330px; height: 150px; background-color: #eeb6a5; float: left; padding: 20px;">
                <span style="color: white;">테마룸 종류 : </span>
                <input type="textbox" style="width: 150px; text-align: center;" readonly value="바베큐장"><br><br><br>
                <span style="color: white;">정기권 사용 : </span>
                <select style="width: 150px; text-align: center;">
                    <option>바베큐장 3시간</option>
                    <option>바베큐장 5시간</option>
                    <option>바베큐장 10시간</option>
                </select>
                </div><br>
                <div style="width: 330px; height: 180px; background-color: #eeb6a5; float: left; padding: 20px; position: relative; top: 50px; color: white;">
                대충 시간 선택 하는 곳
                </div>
                <div style="width: 210px; height: 40px; background-color: #eeb6a5; float: left; padding: 10px; position: relative; top: 70px; color: white;">
                총액 : ${calender.count}원
                </div>
                <button style="width: 90px; height: 30px; background-color: #FF7C6D; border: none; float: left; position: relative; top: 75px; left: 20px; color: white;">
                예약하기
                </button><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <ul style="text-align: left;">
                <li>스터디룸, 헬스룸 입실시에 꼭!! 입구에서 입실을 눌러 주세요.</li>
                <li>예약취소는 '나의 일정'에서 가능하며, 입실 확인이 되지 않은 상태에서만 가능합니다.</li>
                <li>예약취소를 하지 않으면 환불이 어려우니 이 점 유의하시기 바랍니다.</li>
                <li>바베큐파티는 사용 후에는 다음 이용 주민을 위해 깔끔하게 정리하는 센스!</li>
                </ul><br><br>
                <p style="text-align: right; font-size: 20px; font-weight: bold; position: relative; right: 20px;">테마룸 정기권이 필요하세요?</p>
                <button style="width: 300px; height: 40px; background-color: #eeb6a5; border: none; float: right; color: white;">
                정기권 결제하러 가기 ▶
                </button>
            </div>
        </div>
    </div>
</section>
</body>
</html>
