<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <link rel="shortcut icon" type="image⁄x-icon" href="/resources/images/home.png">
    <title>Hear : Share</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="../../resources/css/home.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<style>
    /*smallnav*/
    #smallnav {
        text-align: right;
    }

    #smallnav>a {
        margin: 0px 10px 0px 10px;
        font-size: 30px;
        color: black;
    }

    #smallnav>a:hover {
        color: hotpink;
    }

    /*a*/
    a:link { text-decoration: none;}

</style>

<body class="is-preload">

    <!-- Wrapper-->
    <div id="wrapper">

        <!-- Nav -->
        <nav id="nav">
            <a href="#board" class="fas fa-clipboard-list fa-4x"><span>자유게시판</span></a>
            <a href="#meeting" class="fas fa-users fa-4x"><span>모임활동</span></a>
            <a href="#calender" class="far fa-calendar-check fa-4x"><span>캘린더</span></a>
            <a href="#mypage" class="fas fa-user fa-4x"><span>마이페이지</span></a>
        </nav>

        <!-- Main -->
        <br><br>
        <div id="main">
            <!-- 1번째 카테고리 - Board -->
            <article id="board" class="panel intro">
            	<jsp:include page="board/board.jsp"></jsp:include>
            </article>
     
            <!-- 2번째 카테고리 - Meeting -->
            <article id="meeting" class="panel">
            	<jsp:include page="meeting/meeting.jsp"></jsp:include>
            </article>

            <!-- 2번째 카테고리 - Meeting - Write -->
            <article id="write" class="panel">
            	<%-- <jsp:include page="meeting/write.jsp"></jsp:include> --%>
            </article>

            <!-- 2번째 카테고리 - Meeting - Place -->
            <article id="place" class="panel">
            	<%-- <jsp:include page="place/place.jsp"></jsp:include> --%>
            </article>

            <!-- 3번째 카테고리 - Calender -->
            <article id="calender" class="panel">
            	<jsp:include page="calender/calender.jsp"></jsp:include>
            </article>

            <!-- 4번째 카테고리 - Mypage -->
            <article id="mypage" class="panel">
            	<jsp:include page="member/mypage.jsp"></jsp:include>
            </article>
            
            <!-- Mypage - reservation -->
            <article id="reservation" class="panel">
            	<jsp:include page="reservation/reservation.jsp"></jsp:include>
            </article>
        </div>

        <!-- Footer -->
        <div id="footer">
            <ul class="copyright">
                <li>&copy; hear : share</li>
                <li>대충 푸터랍니다.</li>
            </ul>
        </div>
    </div>
    
    <!-- Scripts -->
    <script src="../../resources/js/jquery.min.js"></script>
    <script src="../../resources/js/breakpoints.min.js"></script>
    <script src="../../resources/js/main.js"></script>
</body>
</html>