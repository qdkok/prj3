<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/main2.css"/>
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/profit.css"/>
	<style type="text/css">
		table{border: 0px; width: 580px; margin: 0px auto}
		th{ border-top: 1px solid #DBDBDB; border-bottom: 1px solid #DBDBDB; font-size:15px; height:30px;}
		td{ border-bottom: 1px solid #DBDBDB; height:20px;}
	</style>
<!-- JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>	
	<script src="http://code.highcharts.com/highcharts.js"></script>
	<script src="http://code.highcharttable.org/master/jquery.highchartTable-min.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		  $('table.highchart').highchartTable();
	});
</script>
<!-- Title -->
	<title>HK LAND에 오신걸 환영합니다!</title>
</head>
<body>
<div id="wrap">
	<div id="header">
		<span id="main_title"><a href="ad_home.do">HK LAND 관리자 페이지</a></span>
	</div>
	<div id="container">
		<!-- LeftArea -->
		<div id="leftArea">
			<jsp:include page="/common/leftArea.do"/>
		</div><!-- leftArea End -->
		<!--************************* RightArea : 각 페이지의 Content 디자인 및 내용을 안에 넣어주세요. *************************-->
		<div id="rightArea">
			<div id="r_content">
				<div id="r_content_title">
					<h2><strong>매출현황</strong><small><span style="margin-left:10px; font-size: 15px;">단위 매출 현황 확인</span></small></h2>
				</div>
				<div id="r_content_view">
				<div id="mainContent">
				<!-- chart1 -->
					<div id="chart1" style="width:500px; height: 400px; float: left;">
					<table class="highchart" data-graph-container-before="1" data-graph-type="line" style="display:none; height: 2000px;" data-graph-datalabels-enabled="1" data-graph-datalabels-align="right">
				<caption>HK랜드 2018년도 목표 / 달성액</caption>
						<thead>
							<tr>
								<th>월</th>
								<th data-graph-dash-style="shortdot">판매목표</th>
								<th>달성</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${ AllProfitList }">
								<tr>
									<td>${ data.d_month }</td>
									<td>${ data.goal }</td>
									<td>${ data.attaintment }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				<!-- chart1 -->
				<!-- chart2 -->
					<div id="chart2" style="width:500px; height: 400px; float: right; margin-right:15px; ">
					<table class="highchart" data-graph-container-before="1" data-graph-type="column" style="display:none;" data-graph-datalabels-enabled="1" data-graph-datalabels-align="right">
				<caption>HK랜드 2018년도 실방문자 대비 매출액</caption>
						<thead>
							<tr>
								<th>월</th>
								<th data-graph-type="area">기대 매출</th>
								<th>달성</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${ AllProfitList }">
								<tr>
									<td>${ data.d_month }</td>
									<td>${ data.goal }</td>
									<td>${ data.attaintment }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				<!-- chart2 -->
				<!-- chart3 -->
					<div id="chart3" style="width:500px; height: 400px; float: left; margin-top: 30px;">
					<table class="highchart" data-graph-container-before="1"  data-graph-item-highlight="1" data-graph-type="pie" style="display:none;" data-graph-datalabels-enabled="1" data-graph-datalabels-align="right">
				<caption>HK랜드 2018년도 출입자 변동 추이</caption>
						<thead>
							<tr>
								<th>월</th>
								<th data-graph-dash-style="shortdot">출입자 수</th>
								<th>평년 출입자 수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${ AllProfitList }">
								<tr>
									<td>${ data.d_month }</td>
									<td>${ data.goal }</td>
									<td>${ data.attaintment }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				<!-- chart3 -->
				<!-- chart4 -->
					<div id="chart4" style="width:500px; height: 400px; float: right; margin-right:15px; margin-top: 30px;">
					<table class="highchart" data-graph-container-before="1" data-graph-type="column" style="display:none;" data-graph-datalabels-enabled="1" data-graph-datalabels-align="right">
				<caption>HK랜드 2018년도 점포 매출액 평균</caption>
						<thead>
							<tr>
								<th >월</th>
								<th data-graph-dash-style="shortdot">점포 매출액 평균</th>
								<th>점포 매출액</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="data" items="${ AllProfitList }">
								<tr>
									<td data-graph-item-color="#ccc">${ data.d_month }</td>
									<td>${ data.goal }</td>
									<td>${ data.attaintment }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
				<!-- chart4 -->
					</div>
				</div>
			</div>
		</div><!-- rightArea End -->
	</div>
	<div id="footer">Copyrightⓒ 2018. SIST. Group2. HKLAND. All rights reserved</div>
</div>

</body>
</html>