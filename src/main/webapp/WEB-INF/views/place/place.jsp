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
<link rel="stylesheet" href="../../../resources/css/place/meeting_place.css" />
<link rel="stylesheet" href="../../../resources/css/common/footer.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qjjwiy53k6"></script>
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
<h3 style="float: left; font-weight: bold; font-family: 'Jal_Onuel';">&nbsp;Place</h3>
    <nav id="smallnav">
        <a onclick="location.href='meetingWriteView.do'" class="far fa-edit"></a> 
        <a onclick="location.href='meeting.do'" class="fas fa-users"></a> 
        <a onclick="location.href='place.do'" class="far fa-map"></a> 
        <a onclick="location.href='like.do'" class="far fa-heart"></a>
    </nav>
    <hr>
</header>
<section>
    <div><br>
        <div style="text-align: center;">
            <a onclick="location.href='placeplaytop5.do'" style="margin-right: 40px; cursor:pointer;">
                <img src="/resources/images/meeting/play.png">
            </a>
            <a onclick="location.href='placeeattop5.do'" style="margin-left: 40px; cursor:pointer;">
                <img src="/resources/images/meeting/eat.png">
            </a>
        </div>
    </div>
</section><br><br><br>
<section>
<div id="map">
</div>
</section><br>                   
<hr><br>
<h3 style="text-align: center; font-weight: bold;">이런곳은 어때요?</h3><br>
<section>
    	<c:set var="i" value="0" />
		<c:set var="j" value="3" />	
    <table>
    	<c:forEach items="${pList}" var="place">
		<c:if test="${i%j == 0 }">
		<tr>
		</tr>
		</c:if>    	
        <td>
        	<c:url var="pDetail" value="placedetail.do">
        	<c:param name="pNo" value="${place.pNo}"></c:param>
        	</c:url>
            <a href="${pDetail}">
                <div id="place_div">
                    <div id="place_img">
                        <img src="${place.pFilename}" style="width: 200px; height: 200px;">
                    </div>
                    <div id="place_title">
                        ${place.pTitle}
                    </div>
                    <div id="place_subtitle">
                        ${place.pmTitle}
                    </div>
<%--                     <a href="javascript:addmLike();" id="place_like" value="${place.pNo}">
                               <c:if test="${empty mLike.mCheckYn || mLike.mCheckYn eq 'N'}">
                                 <i class="far fa-heart" id="emptyHeart"></i>
                              </c:if>
                              <c:if test="${mLike.mCheckYn eq 'Y'}">
                                 <i class="fas fa-heart" id="fullHeart"></i>
                              </c:if>                            
                           </a> --%>
                </div>
            </a>
        </td>
        <c:if test="${i%j == j-1 }">
		</c:if> 
		<c:set var="i" value="${i+1 }" />
        </c:forEach>
    </table>
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

		
		<!-- 지도 API -->
		 $(function() { /* 지도 시작점 */
         var map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(37.5679, 126.983),
            zoom: 16
         });

         var marker = new naver.maps.Marker({
            position: new naver.maps.LatLng(37.5679, 126.983),
            map:map,
            icon: {
                url: '/resources/images/meeting/pin_default.png'
            } 
         });
         var contentString = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>KH쉐어하우스</span></div>"].join("");
         var infoWindow = new naver.maps.InfoWindow();
         naver.maps.Event.addListener(marker, "click", function(e) {
        	 if(infoWindow.getMap()) {
        		 infoWindow.close(); 
        	 } else {
        		 infoWindow = new naver.maps.InfoWindow({
        			content : contentString
        		});       
                infoWindow.open(map,marker);
        	 	}
            });  
             
         var marker1 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.5636522937762, 126.98439448691325),
             map:map
          });
          var contentString1 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>알카트래즈 </span><a href='/placedetail.do?pNo=1' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow1 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker1, "click", function(e) {
         	 if(infoWindow1.getMap()) {
         		 infoWindow1.close(); 
         	 } else {
         		 infoWindow1 = new naver.maps.InfoWindow({
         			content : contentString1
         		});       
                 infoWindow1.open(map,marker1);
         	 	}
             }); 
         
         var marker2 = new naver.maps.Marker({
            position: new naver.maps.LatLng(37.56518587945031, 126.98140118441076),
            map:map
         });
         var contentString2 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>롯데호텔 모모야마 </span><a href='/placedetail.do?pNo=2' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
         var infoWindow2 = new naver.maps.InfoWindow();
         naver.maps.Event.addListener(marker2, "click", function(e) {
        	 if(infoWindow2.getMap()) {
        		 infoWindow2.close(); 
        	 } else {
        		 infoWindow2 = new naver.maps.InfoWindow({
        			content : contentString2
        		});       
                infoWindow2.open(map,marker2);
        	 	}
            });              
		 
         var marker3 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.569389398953874, 126.98601417116343),
             map:map
          });
          var contentString3 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>제이앤제이볼링센터 </span><a href='/placedetail.do?pNo=3' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow3 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker3, "click", function(e) {
         	 if(infoWindow3.getMap()) {
         		 infoWindow3.close(); 
         	 } else {
         		 infoWindow3 = new naver.maps.InfoWindow({
         			content : contentString3
         		});       
                 infoWindow3.open(map,marker3);
         	 	}
             });                         
      	 
         var marker4 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.564797562925094, 126.97804826907088),
             map:map
          });
          var contentString4 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>주옥 </span><a href='/placedetail.do?pNo=4' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow4 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker4, "click", function(e) {
         	 if(infoWindow4.getMap()) {
         		 infoWindow4.close(); 
         	 } else {
         		 infoWindow4 = new naver.maps.InfoWindow({
         			content : contentString4
         		});       
                 infoWindow4.open(map,marker4);
         	 	}
             });              
      	 
         var marker5 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56919466503747, 126.98648619790588),
             map:map
          });
          var contentString5 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>셜록홈즈 </span><a href='/placedetail.do?pNo=5' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow5 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker5, "click", function(e) {
         	 if(infoWindow5.getMap()) {
         		 infoWindow5.close(); 
         	 } else {
         		 infoWindow5 = new naver.maps.InfoWindow({
         			content : contentString5
         		});       
                 infoWindow5.open(map,marker5);
         	 	}
             });              
      	 
         var marker6 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56458167662456, 126.98510432858546),
             map:map
          });
          var contentString6 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>하동관본점 </span><a href='/placedetail.do?pNo=6' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow6 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker6, "click", function(e) {
         	 if(infoWindow6.getMap()) {
         		 infoWindow6.close(); 
         	 } else {
         		 infoWindow6 = new naver.maps.InfoWindow({
         			content : contentString6
         		});       
                 infoWindow6.open(map,marker6);
         	 	}
             });              
      	 
         var marker7 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.565015173193885, 126.98198506877975),
             map:map
          });
          var contentString7 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>롯데백화점본점 </span><a href='/placedetail.do?pNo=7' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow7 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker7, "click", function(e) {
         	 if(infoWindow7.getMap()) {
         		 infoWindow7.close(); 
         	 } else {
         		 infoWindow7 = new naver.maps.InfoWindow({
         			content : contentString7
         		});       
                 infoWindow7.open(map,marker7);
         	 	}
             });              
      	 
         var marker8 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.57082616468603, 126.98353165035743),
             map:map
          });
          var contentString8 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>미도인 </span><a href='/placedetail.do?pNo=8' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow8 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker8, "click", function(e) {
         	 if(infoWindow8.getMap()) {
         		 infoWindow8.close(); 
         	 } else {
         		 infoWindow8 = new naver.maps.InfoWindow({
         			content : contentString8
         		});       
                 infoWindow8.open(map,marker8);
         	 	}
             });              
      	 
         var marker9 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56910509614473, 126.98459648130057),
             map:map
          });
          var contentString9 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>3POP </span><a href='/placedetail.do?pNo=9' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow9 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker9, "click", function(e) {
         	 if(infoWindow9.getMap()) {
         		 infoWindow9.close(); 
         	 } else {
         		 infoWindow9 = new naver.maps.InfoWindow({
         			content : contentString9
         		});       
                 infoWindow9.open(map,marker9);
         	 	}
             });              
      	 
         var marker10 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56641918461979, 126.9800565555758),
             map:map
          });
          var contentString10 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>라칸티나 </span><a href='/placedetail.do?pNo=10' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow10 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker10, "click", function(e) {
         	 if(infoWindow10.getMap()) {
         		 infoWindow10.close(); 
         	 } else {
         		 infoWindow10 = new naver.maps.InfoWindow({
         			content : contentString10
         		});       
                 infoWindow10.open(map,marker10);
         	 	}
             });              
      	 
         var marker11 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56921826886126, 126.98631969790583),
             map:map
          });
          var contentString11 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>아이센스리그PC </span><a href='/placedetail.do?pNo=11' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow11 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker11, "click", function(e) {
         	 if(infoWindow11.getMap()) {
         		 infoWindow11.close(); 
         	 } else {
         		 infoWindow11 = new naver.maps.InfoWindow({
         			content : contentString11
         		});       
                 infoWindow11.open(map,marker11);
         	 	}
             });              
      	 
         var marker12 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.562797522685, 126.98575282674064),
             map:map
          });
          var contentString12 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>명동교자 본점 </span><a href='/placedetail.do?pNo=12' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow12 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker12, "click", function(e) {
         	 if(infoWindow12.getMap()) {
         		 infoWindow12.close(); 
         	 } else {
         		 infoWindow12 = new naver.maps.InfoWindow({
         			content : contentString12
         		});       
                 infoWindow12.open(map,marker12);
         	 	}
             });              
      	 
         var marker13 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56443645045869, 126.9738461266077),
             map:map
          });
          var contentString13 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>서울시립미술관 </span><a href='/placedetail.do?pNo=13' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow13 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker13, "click", function(e) {
         	 if(infoWindow13.getMap()) {
         		 infoWindow13.close(); 
         	 } else {
         		 infoWindow13 = new naver.maps.InfoWindow({
         			content : contentString13
         		});       
                 infoWindow13.open(map,marker13);
         	 	}
             });              
      	 
         var marker14 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.567233102869295, 126.98390983256601),
             map:map
          });
          var contentString14 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>안즈 </span><a href='/placedetail.do?pNo=14' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow14 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker14, "click", function(e) {
         	 if(infoWindow14.getMap()) {
         		 infoWindow14.close(); 
         	 } else {
         		 infoWindow14 = new naver.maps.InfoWindow({
         			content : contentString14
         		});       
                 infoWindow14.open(map,marker14);
         	 	}
             });              
      	 
         var marker15 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.563611692633145, 126.98410375557573),
             map:map
          });
          var contentString15 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>명동피시방 </span><a href='/placedetail.do?pNo=15' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow15 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker15, "click", function(e) {
         	 if(infoWindow15.getMap()) {
         		 infoWindow15.close(); 
         	 } else {
         		 infoWindow15 = new naver.maps.InfoWindow({
         			content : contentString15
         		});       
                 infoWindow15.open(map,marker15);
         	 	}
             });              
      	 
         var marker16 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56737030650101, 126.98178924392538),
             map:map
          });
          var contentString16 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>남포면옥 </span><a href='/placedetail.do?pNo=16' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow16 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker16, "click", function(e) {
         	 if(infoWindow16.getMap()) {
         		 infoWindow16.close(); 
         	 } else {
         		 infoWindow16 = new naver.maps.InfoWindow({
         			content : contentString16
         		});       
                 infoWindow16.open(map,marker16);
         	 	}
             });              
      	 
         var marker17 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.567778780739225, 126.98154135557583),
             map:map
          });
          var contentString17 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>우리당구장 </span><a href='/placedetail.do?pNo=17' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow17 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker17, "click", function(e) {
         	 if(infoWindow17.getMap()) {
         		 infoWindow17.close(); 
         	 } else {
         		 infoWindow17 = new naver.maps.InfoWindow({
         			content : contentString17
         		});       
                 infoWindow17.open(map,marker17);
         	 	}
             });              
      	 
         var marker18 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56241459138794, 126.9854532555756),
             map:map
          });
          var contentString18 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>더식당 </span><a href='/placedetail.do?pNo=18' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow18 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker18, "click", function(e) {
         	 if(infoWindow18.getMap()) {
         		 infoWindow18.close(); 
         	 } else {
         		 infoWindow18 = new naver.maps.InfoWindow({
         			content : contentString18
         		});       
                 infoWindow18.open(map,marker18);
         	 	}
             });              
      	 
         var marker19 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.569828571072875, 126.98606519975077),
             map:map
          });
          var contentString19 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>종로당구장 </span><a href='/placedetail.do?pNo=19' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow19 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker19, "click", function(e) {
         	 if(infoWindow19.getMap()) {
         		 infoWindow19.close(); 
         	 } else {
         		 infoWindow19 = new naver.maps.InfoWindow({
         			content : contentString19
         		});       
                 infoWindow19.open(map,marker19);
         	 	}
             });              
      	 
         var marker20 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56862409810483, 126.97776854023591),
             map:map
          });
          var contentString20 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>엘쁠라또 </span><a href='/placedetail.do?pNo=20' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow20 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker20, "click", function(e) {
         	 if(infoWindow20.getMap()) {
         		 infoWindow20.close(); 
         	 } else {
         		 infoWindow20 = new naver.maps.InfoWindow({
         			content : contentString20
         		});       
                 infoWindow20.open(map,marker20);
         	 	}
             });              
      	 
         var marker21 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56612530728135, 126.97527661331496),
             map:map
          });
          var contentString21 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>덕수궁 </span><a href='/placedetail.do?pNo=21' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow21 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker21, "click", function(e) {
         	 if(infoWindow21.getMap()) {
         		 infoWindow21.close(); 
         	 } else {
         		 infoWindow21 = new naver.maps.InfoWindow({
         			content : contentString21
         		});       
                 infoWindow21.open(map,marker21);
         	 	}
             });              
      	 
         var marker22 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56908976530101, 126.98730968256595),
             map:map
          });
          var contentString22 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>종로돈부리 </span><a href='/placedetail.do?pNo=22' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow22 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker22, "click", function(e) {
         	 if(infoWindow22.getMap()) {
         		 infoWindow22.close(); 
         	 } else {
         		 infoWindow22 = new naver.maps.InfoWindow({
         			content : contentString22
         		});       
                 infoWindow22.open(map,marker22);
         	 	}
             });              
      	 
         var marker23 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.569505096721564, 126.98537826380587),
             map:map
          });
          var contentString23 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>주사위왕국 </span><a href='/placedetail.do?pNo=23' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow23 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker23, "click", function(e) {
         	 if(infoWindow23.getMap()) {
         		 infoWindow23.close(); 
         	 } else {
         		 infoWindow23 = new naver.maps.InfoWindow({
         			content : contentString23
         		});       
                 infoWindow23.open(map,marker23);
         	 	}
             });              
      	 
         var marker24 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.57140939960245, 126.97904723932284),
             map:map
          });
          var contentString24 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>빌즈 </span><a href='/placedetail.do?pNo=24' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow24 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker24, "click", function(e) {
         	 if(infoWindow24.getMap()) {
         		 infoWindow24.close(); 
         	 } else {
         		 infoWindow24 = new naver.maps.InfoWindow({
         			content : contentString24
         		});       
                 infoWindow24.open(map,marker24);
         	 	}
             });              
      	 
         var marker25 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.57608526245499, 126.97683755959783),
             map:map
          });
          var contentString25 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>광화문 </span><a href='/placedetail.do?pNo=25' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow25 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker25, "click", function(e) {
         	 if(infoWindow25.getMap()) {
         		 infoWindow25.close(); 
         	 } else {
         		 infoWindow25 = new naver.maps.InfoWindow({
         			content : contentString25
         		});       
                 infoWindow25.open(map,marker25);
         	 	}
             });              
      	 
         var marker26 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.570042085657086, 126.98111885557589),
             map:map
          });
          var contentString26 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>고양메리 </span><a href='/placedetail.do?pNo=26' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow26 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker26, "click", function(e) {
         	 if(infoWindow26.getMap()) {
         		 infoWindow26.close(); 
         	 } else {
         		 infoWindow26 = new naver.maps.InfoWindow({
         			content : contentString26
         		});       
                 infoWindow26.open(map,marker26);
         	 	}
             });              
      	 
         var marker27 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56221368267337, 126.98400382101421),
             map:map
          });
          var contentString27 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>스위트룸명동 </span><a href='/placedetail.do?pNo=27' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow27 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker27, "click", function(e) {
         	 if(infoWindow27.getMap()) {
         		 infoWindow27.close(); 
         	 } else {
         		 infoWindow27 = new naver.maps.InfoWindow({
         			content : contentString27
         		});       
                 infoWindow27.open(map,marker27);
         	 	}
             });              
      	 
         var marker28 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.570939338555974, 126.97982221140099),
             map:map
          });
          var contentString28 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>스시소라 </span><a href='/placedetail.do?pNo=28' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow28 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker28, "click", function(e) {
         	 if(infoWindow28.getMap()) {
         		 infoWindow28.close(); 
         	 } else {
         		 infoWindow28 = new naver.maps.InfoWindow({
         			content : contentString28
         		});       
                 infoWindow28.open(map,marker28);
         	 	}
             });              
      	 
         var marker29 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.569398956802516, 126.97791389790602),
             map:map
          });
          var contentString29 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>청계광장 </span><a href='/placedetail.do?pNo=29' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow29 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker29, "click", function(e) {
         	 if(infoWindow29.getMap()) {
         		 infoWindow29.close(); 
         	 } else {
         		 infoWindow29 = new naver.maps.InfoWindow({
         			content : contentString29
         		});       
                 infoWindow29.open(map,marker29);
         	 	}
             });              
      	 
         var marker30 = new naver.maps.Marker({
             position: new naver.maps.LatLng(37.56956547179378, 126.98408906907092),
             map:map
          });
          var contentString30 = ["<div style='padding:10px; color: #eeb6a5; font-weight: bold; font-size: 13px;'><span>숙달돼지 </span><a href='/placedetail.do?pNo=30' class='far fa-arrow-alt-circle-right' style='color: #eeb6a5;'></a></div>"].join("");
          var infoWindow30 = new naver.maps.InfoWindow();
          naver.maps.Event.addListener(marker30, "click", function(e) {
         	 if(infoWindow30.getMap()) {
         		 infoWindow30.close(); 
         	 } else {
         		 infoWindow30 = new naver.maps.InfoWindow({
         			content : contentString30
         		});       
                 infoWindow30.open(map,marker30);
         	 	}
             });              
         }); 
	</script>
</html>