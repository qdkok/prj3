<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- bootstrap -->	
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
  
<!-- summernote -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
  
<!-- CSS -->
<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/main.css"/>
<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/notice.css"/>

<script type="text/javascript">
	$(document).ready(function() {
		  $('#summernote').summernote({
			  placeholder: '당신의 경험을 글과 이미지로 남겨보세요.',
			  width: 1000,
			  height: 390,                 // set editor height
			  minHeight: 100,             // set minimum height of editor
			  maxHeight: 390,             // set maximum height of editor
			  focus: true                  // set focus to editable area after initializing summernote
			});
		
		  $("#saveBtn").click(function(){
			$("[name='frm']").submit();
		  });
		  
		  $("#resetBtn").click(function(){
			$('#summernote').summernote('reset');
		  });
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
					<h2>공지사항관리<small><span style="font-size: 15px;">공지사항 목록 확인</span></small></h2>
				</div>
				<div id="r_content_view">
					<div id="mainContent">
						<!-- form안의 Textarea를 GET 방식으로 넘기면 255자가 넘어간다고 Error가 난다. -->
						<form method="get" name="frm" action="mgr_notice_readFrm_modif.do" id="noteFrm">
						<input type="hidden" name="n_no" value="${ readNotice.n_no }">
						<input type="hidden" name="a_id" value="${ readNotice.a_id }">
						<table id="writeTable">
							<tr> 
								<td>작성자</td>
								<td>${ readNotice.a_id }</td>
							</tr>
							<tr>
								<td>제목</td>
								<td><input type="text" name="n_name" class="inputBox" value="${ readNotice.n_name }"></td>
							</tr>
							<tr>
								<td colspan="2">글내용 작성</td>
							</tr>
						</table>
							<textarea id="summernote" name="n_info">${ readNotice.n_info }</textarea>
							<div id="btnBox1">
								<input type="button" value="목록" class="btn" id="listBtn" onclick="javascript:location.href='mgr_notice.do'">
								<input type="reset" value="초기화" class="btn" id="resetBtn">
								<input type="button" value="저장" class="btn" id="saveBtn">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- rightArea End -->
	</div>
	<div id="footer">footer</div>
</div>

</body>
</html>