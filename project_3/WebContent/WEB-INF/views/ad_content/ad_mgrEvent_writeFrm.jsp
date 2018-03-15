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
		if(obj.r_position.value == ""){
			alert("이벤트 장소를 입력해주세요.");
			return ;
		}
		if(obj.start_year.value == ""){
			alert("이벤트 시작년도를 입력해주세요.");
			return ;
		}
		if(obj.start_month.value == ""){
			alert("이벤트 시작월을 입력해주세요.");
			return ;
		}
		if(obj.start_day.value == ""){
			alert("이벤트 시작일을 입력해주세요.");
			return ;
		}
		if(obj.end_year.value == ""){
			alert("이벤트 종료년도를 입력해주세요.");
			return ;
		}
		if(obj.end_month.value == ""){
			alert("이벤트 종료월을 입력해주세요.");
			return ;
		}
		if(obj.end_day.value == ""){
			alert("이벤트 종료일을 입력해주세요.");
			return ;
		}
		if(obj.e_name.value == ""){
			alert("이벤트 제목을 입력해주세요.");
			return ;
		}
		if(obj.e_info.value == ""){
			alert("이벤트 내용을 입력해주세요.");
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
					<h2>이벤트관리<small><span style="font-size: 15px;">등록된 이벤트 목록 확인</span></small></h2>
				</div>
				<div id="r_content_view">
					<div id="mainContent">
						<!-- form안의 Textarea를 GET 방식으로 넘기면 255자가 넘어간다고 Error가 난다. -->
						<form method="get" name="frm1" action="mgr_event_writeFrm.do" id="noteFrm">
						<input type="hidden" name="cmd" value="wc">
						<input type="hidden" name="a_id" value="${ sessionScope.a_id }">
						
						<table id="writeTable">
							<tr>
								<td>작성자</td>
								<td width="370px;">${ sessionScope.a_id }( ${ sessionScope.a_name } )</td>
   								<td>이벤트 장소</td>
								<td style="color:#333;"><input type="text" name="r_position" style="width: 350px;"></td>
							</tr>
                            <tr>
								<td>시작날짜</td>
								<td><input type="text" name="start_year" class="dateBox" maxlength="4" size="5">년 
								<input type="text" name="start_month" class="dateBox" maxlength="2" size="3">월 
								<input type="text" name="start_day" class="dateBox" maxlength="2" size="3">일</td>
   								<td>종료날짜</td>
								<td><input type="text" name="end_year" class="dateBox" maxlength="4" size="5">년 
								<input type="text" name="end_month" class="dateBox" maxlength="2" size="3">월 
								<input type="text" name="end_day" class="dateBox" maxlength="2" size="3">일</td>
							</tr>
                            <tr>
	                            <td>첨부파일</td>
								<td><input type="file" name="r_file"></td>
    	                        <td>첨부이미지</td>
								<td><input type="file" name="r_image"></td>
							</tr>
                            <tr>
								<td>제목</td>
								<td colspan="3"><input type="text" name="e_name" class="inputBox" style="width: 830px;"></td>
							</tr>
							<tr>
								<td colspan="4">글내용 작성</td>
							</tr>
                            <tr>
                            	<td colspan="4"><textarea id="summernote" name="e_info"></textarea></td>
                            </tr>
						</table>
							<div id="btnBox1">
								<input type="button" value="목록" class="btn" id="listBtn" onclick="javascript:location.href='mgr_event.do'">
								<input type="reset" value="초기화" class="btn" id="resetBtn">
								<input type="button" value="등록" class="btn" id="writeBtn" onclick="formchk( document.frm1 )">
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