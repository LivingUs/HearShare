<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	//차트 불러오기
	google.charts.load('current', {'packages':['bar']});
	//차트 로드
	google.charts.setOnLoadCallback(drawChart);
	
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
		  ['Month', '지출'],
		  ['20/10', 1000],
		  ['20/11', 1170],
		  ['20/12', 660],
		]);
		
		var options = {
		  chart: {
		    title: '최근 3개월 소비생활'
		  }
		};
		//차트 그리기
		var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
		chart.draw(data, google.charts.Bar.convertOptions(options));
			}
	</script>
</head>
<body>
	<div id="columnchart_material" style="width: 400px; height: 300px;"></div>
</body>
</html>
