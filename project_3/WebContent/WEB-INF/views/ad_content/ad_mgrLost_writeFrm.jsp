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
<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/lost.css"/>

<script type="text/javascript">
	function formchk(obj){
		if(obj.l_name.value == ""){
			alert("분실물명을 입력해주세요.");
			return ;
		}
		if(obj.l_kate.value == ""){
			alert("분실물 습득 장소를 입력해주세요.");
			return ;
		}
		if(obj.l_year.value == ""){
			alert("습득년도를 입력해주세요.");
			return ;
		}
		if(obj.l_month.value == ""){
			alert("습득월을 입력해주세요.");
			return ;
		}
		if(obj.l_day.value == ""){
			alert("습득일을 입력해주세요.");
			return ;
		}
		if(obj.l_image.value == ""){
			alert("습득물 이미지를 등록해주세요.");
			return ;
		}
		
		obj.submit();
	}

	$(document).ready(function() {
		  $('#summernote').summernote({
			  placeholder: '이벤트 내용을 작성해주세요.',
			  width: 998,
			  height: 308,                 // set editor height
			  minHeight: 100,             // set minimum height of editor
			  maxHeight: 308,             // set maximum height of editor
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
					<h2><strong>분실물관리</strong><small><span style="margin-left:10px; font-size: 15px;">분실물 목록 확인</span></small></h2>
				</div>
				<div id="r_content_view">
					<div id="mainContent">
						<!-- form안의 Textarea를 GET 방식으로 넘기면 255자가 넘어간다고 Error가 난다. -->
						<form method="get" name="frm1" action="mgr_lost_writeFrm.do" id="noteFrm">
						<input type="hidden" name="cmd" value="wc">
						<input type="hidden" name="a_id" value="${ sessionScope.a_id }">
						
						<table id="writeTable">
							<tr>
								<td>등록자</td>
								<td width="370px;">${ sessionScope.a_id }( ${ sessionScope.a_name } )</td>
							</tr>
                            <tr>
								<td>분실물명</td>
								<td><input type="text" name="l_name" class="inputBox" style="width:650px;"></td>
							</tr>
                            <tr>
								<td>습득장소</td>
								<td><input type="text" name="l_kate" class="inputBox" style="width:650px;"></td>
							</tr>
							<tr>
								<td>습득일</td>
								<td><input type="text" name="l_year" class="dateBox" maxlength="4" size="15">년&nbsp;&nbsp;&nbsp;
								<input type="text" name="l_month" class="dateBox" maxlength="2" size="13">월&nbsp;&nbsp;&nbsp;
								<input type="text" name="l_day" class="dateBox" maxlength="2" size="13">일</td>
							</tr>
							<tr>
								<td>처리결과</td>
								<td>
									<select name="l_result">
										<option value="o">방문수령</option>
										<option value="x" selected="selected">보관중</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>이미지</td>
								<td style="padding-left: 10px;"><input type="file" name="l_image"></td>
							</tr>
						</table>
							<div id="btnBox1">
								<input type="button" value="목록" class="btn" id="listBtn" onclick="javascript:location.href='mgr_lostArticle.do'">
								<input type="reset" value="초기화" class="btn" id="resetBtn">
								<input type="button" value="등록" class="btn" id="writeBtn" onclick="formchk( document.frm1 )">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- rightArea End -->
	</div>
	<div id="footer">Copyrightⓒ 2018. SIST. Group2. HKLAND. All rights reserved</div>
</div>

</body>
</html>