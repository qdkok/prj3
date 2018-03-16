<%@page import="java.util.Date"%>
<%@page import="com.sun.org.apache.bcel.internal.classfile.Attribute"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
	.c_t{text-align: center; margin: 0 auto;}
	.intro_table tr td{font-size: 20px; font-weight: bold;}
	.center{text-align: center;}
</style>
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" >
	</script>
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
		<!--************************* RightArea : 각 페이지의 Content 디자인 및 내용을 안에 넣어주세요. *************************-->
		<div id="rightArea" style="overflow: scroll;">
			<div id="r_content">
				<div id="r_content_title">
					<h2><strong>이용권관리</strong><small><span style="margin-left:10px; font-size: 15px;">HK Land 이용권 목록</span></small></h2>
				</div>
				<div id="r_content_view" style="width: 1000px;">
					<div style=" margin-left: 100px;">
					<c:choose>
						<c:when test="${upload_result}">
							등록에 성공했습니다.
						</c:when>
						<c:otherwise>
							등록에 실패했습니다.
						</c:otherwise>
					</c:choose>
					<input type="button" style="width:100px; height: 50px;" value="목록으로 가기" onclick="javascript:location.href('mgr_voucher.do');"/>
					</div>
				</div>
			</div>
		</div><!-- rightArea End -->
	</div>
	<div id="footer">Copyrightⓒ 2018. SIST. Group2. HKLAND. All rights reserved</div>
</div>

</body>
</html>