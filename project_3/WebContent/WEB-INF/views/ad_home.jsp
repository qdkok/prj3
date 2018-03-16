<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

.column {
  float: left;
  width: 220px;
  height: 320px;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.3);
  width: 250px; 
  height: 300px;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

#TeamTable{ margin: 50px 0px 0px 200px; width: 1090px; }
</style>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- JS -->
	
<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/main.css"/>
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
		<!-- RightArea -->
		<div id="rightArea" style="position: relative;">
			<div style="background: url('http://localhost:8080/project_3/ad_common/images/HKLogo.png') no-repeat;width: 300px;height: 150px;position: absolute;top: -39px;left: 1180px;background-size: 300px 200px;z-index: -9999999;"></div>
		<table id="TeamTable">
		<!-- Dae young / Hong ki / Hoe eon / JaeRyung / Eunhye / Kyoung pyo -->
		<tr>
			<td colspan="3"><h2 style="width:125px; height: 42px; text-shadow: 1px 1px 1px #000; color: #FFF; background-color: #CC493C">팀원소개</h2></td>
		</tr>
			<tr>
				<td>
					<div class="column">
						<div class="card">
						 	<img src="http://localhost:8080/project_3/ad_common/images/char6.png" alt="대영">
						 	<div class="container">
						        <h2>Dae young</h2>
						        <p class="title">Leader</p>
						        <p>총괄 / 관리자이용권 / 회원가입&탈퇴</p>
						        <p>온라인예매 / 예매확인 / ID&PW찾기</p>
						 	</div>
						</div>
					</div>
				</td>
				<td>
					<div class="column">
						<div class="card">
						 	<img src="http://localhost:8080/project_3/ad_common/images/char2.png" alt="은혜">
						 	<div class="container">
						        <h2>Eun hye</h2>
						        <p class="title">Crew</p>
						        <p>사용자 메인페이지 UI</p>
						        <p>관리자 메인페이지 UI</p>
						 	</div>
						</div>
					</div>
				</td>
				<td>
					<div class="column">
						<div class="card">
						 	<img src="http://localhost:8080/project_3/ad_common/images/char1.png" alt="재령">
						 	<div class="container">
						        <h2>Jae Ryung</h2>
						        <p class="title">Crew</p>
						        <p>티켓 정보</p>
						        <p>예매 내역확인</p>
						 	</div>
						</div>
					</div>
				</td>
				
				</tr>
			<tr>
				<td>
					<div class="column">
						<div class="card">
						 	<img src="http://localhost:8080/project_3/ad_common/images/char4.png" alt="회언">
						 	<div class="container">
						        <h2>Hoe eon</h2>
						        <p class="title">Crew</p>
						        <p>회원관리 / 공지사항관리 / 이벤트관리</p>
						        <p>쿠폰관리 / 분실물관리 / 고객서비스관리</p>
						 	</div>
						</div>
					</div>
				</td>
				<td>
					<div class="column">
						<div class="card">
						 	<img src="http://localhost:8080/project_3/ad_common/images/char3.png" alt="경표">
						 	<div class="container">
						        <h2>Kyoung pyo</h2>
						        <p class="title">Crew</p>
						        <p>프로젝트 기획 / 회원가입</p>
						        <p>통합테스트</p>
						 	</div>
						</div>
					</div>
				</td>
				<td>
					<div class="column">
						<div class="card">
						 	<img src="http://localhost:8080/project_3/ad_common/images/char5.png" alt="홍기">
						 	<div class="container">
						        <h2>Hong ki</h2>
						        <p class="title">Crew</p>
						        <p>사용자 메인 / HK랜드 소개 / 랜드정보</p>
						        <p>우대사항 / 쿠폰다운로드 / 놀이기구안내</p>
						 	</div>
						</div>
					</div>
				</td>
				
				</tr>
			</table>
		</div><!-- rightArea End -->
	</div>
	<div id="footer">Copyrightⓒ 2018. SIST. Group2. HKLAND. All rights reserved</div>
</div>

</body>
</html>
