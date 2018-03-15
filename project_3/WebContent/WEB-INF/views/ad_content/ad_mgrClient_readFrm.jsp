<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
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
<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/event.css"/>

<script type="text/javascript">
function formchk(obj){
	obj.submit();
}

	$(document).ready(function() {
		  $('#summernote').summernote({
			  placeholder: '이벤트 내용을 작성해주세요.',
			  width: 998,
			  height: 337,                 // set editor height
			  minHeight: 100,             // set minimum height of editor
			  maxHeight: 337,            // set maximum height of editor
			  focus: true                  // set focus to editable area after initializing summernote
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
					<h2>고객서비스관리<small><span style="font-size: 15px;">고객 문의사항 확인</span></small></h2>
				</div>
				<div id="r_content_view">
					<div id="mainContent">
						<!-- form안의 Textarea를 GET 방식으로 넘기면 255자가 넘어간다고 Error가 난다. -->
						<form method="get" name="frm1" action="mgrClient_writeFrm.do" id="noteFrm">
						<input type="hidden" name="cmd" value="wc">
						<input type="hidden" name="a_id" value="${ sessionScope.a_id }">
						<input type="hidden" name="ClientNo" value="${ readClient.s_no }">
						
						<table id="writeTable">
							<tr>
								<td>문의번호</td>
								<td width="370px;">${ readClient.s_no }</td>
								<td>문의날짜</td>
								<td width="370px;">${ readClient.s_inputdate }</td>
							</tr>
							<tr>
								<td>문의자</td>
								<td colspan="3">${ readClient.m_id }</td>
							</tr>
							<tr>
								<td>문의제목</td>
								<td colspan="3">${ readClient.s_name }</td>
							</tr>
							<tr>
								<td colspan="4">문의내용</td>
							</tr>
                            <tr>
                            	<td colspan="4" style="padding:10px; background-color: #FFFFFF; height: 410px; text-align: left; vertical-align: top;">${ readClient.s_info }</td>
                            </tr>
						</table>
							<div id="btnBox1">
								<input type="button" value="목록" class="btn" id="listBtn" onclick="javascript:location.href='mgr_clientService.do'">
								<input type="button" value="답변등록" class="btn" id="writeBtn" onclick="formchk( document.frm1 )">
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