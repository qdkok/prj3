<%@page import="kr.co.sist.admin.domain.MemberDomain"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.admin.dao.HklandAdminDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- JS -->
	<!-- <script type="text/javascript" src=""></script> -->
<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/main.css"/>
<!-- Title -->
	<title>HK LAND에 오신걸 환영합니다!</title>
</head>
<body>
<div id="wrap">
	<div id="header">
		<span id="main_title"><a href="ad_index.do">HK LAND 관리자 페이지</a></span>
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
					<h2>회원관리<small><span style="font-size: 15px;">가입된 회원의 정보 목록</span></small></h2>
				</div>
				<div id="r_content_view">
					<table id="" class="table table-striped table-bordered">
					 	<thead>
					 		<tr>
						 		<td>ID</td>
						 		<td>이름</td>
						 		<td>생년월일</td>
						 		<td>성별</td>
						 		<td>이메일</td>
						 		<td>전화번호</td>
						 		<td>가입일</td>
					 		</tr>
					 	</thead>
					 	<tbody>
					 		<%
					 			HklandAdminDAO hk_dao=HklandAdminDAO.getInstance();
					 			List<MemberDomain> member = hk_dao.selectMember();
					 			session.setAttribute("member", member);
					 		%>
							<c:catch var="e">
							</c:catch>
							<c:if test="${ e ne null }">
								${e }
								사용자 정보 로딩중 문제발생
							</c:if>
							<c:forEach var="member" items="${member}">
								<tr>
							 		<td>${member.id }</td>
							 		<td>${member.name} </td>
							 		<td>${member.birth }</td>
							 		<td>${member.gender }</td>
							 		<td>${member.email }</td>
							 		<td>${member.phone }</td>
							 		<td>${member.inputdate }</td>
						 		</tr>
					 		</c:forEach>
					 	</tbody>
					</table>
				</div>
			</div>
		</div><!-- rightArea End -->
	</div>
	<div id="footer">footer</div>
</div>

</body>
</html>