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
	if(obj.start_year.value == ""){
		alert("쿠폰 적용 시작년도를 입력해주세요.");
		return ;
	}
	if(obj.start_month.value == ""){
		alert("쿠폰 적용 시작월을 입력해주세요.");
		return ;
	}
	if(obj.start_day.value == ""){
		alert("쿠폰 적용 시작일을 입력해주세요.");
		return ;
	}
	if(obj.end_year.value == ""){
		alert("쿠폰 적용 종료년도를 입력해주세요.");
		return ;
	}
	if(obj.end_month.value == ""){
		alert("쿠폰 적용 종료월을 입력해주세요.");
		return ;
	}
	if(obj.end_day.value == ""){
		alert("쿠폰 적용 종료일을 입력해주세요.");
		return ;
	}
	if(obj.c_name.value == ""){
		alert("쿠폰명을 입력해주세요.");
		return ;
	}
	if(obj.c_info.value == ""){
		alert("쿠폰 내용을 입력해주세요.");
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
					<h2>쿠폰관리<small><span style="font-size: 15px;">할인쿠폰 목록</span></small></h2>
				</div>
				<div id="r_content_view">
					<div id="mainContent">
						<!-- form안의 Textarea를 GET 방식으로 넘기면 255자가 넘어간다고 Error가 난다. -->
						<form method="get" name="frm1" action="mgrCoupon_readFrm.do" id="noteFrm">
						<input type="hidden" name="cmd" value="wc">
						<input type="hidden" name="a_id" value="${ sessionScope.a_id }">
						
						<table id="writeTable">
							<tr>
								<td>등록자</td>
								<td width="370px;" colspan="3">${ sessionScope.a_id }( ${ sessionScope.a_name } )</td>
							</tr>
							<tr>
								<td>쿠폰이미지</td>
								<td colspan="3" style="padding-left: 10px;">${ readCoupon.c_image }</td>
							</tr>
                            <tr>
								<td>쿠폰시작일자</td>
								<td>${ readCoupon.start_year }년 ${ readCoupon.start_month }월 ${ readCoupon.start_day }일</td>
   								<td>쿠폰종료일자</td>
								<td>${ readCoupon.end_year }년 ${ readCoupon.end_month }월 ${ readCoupon.end_day }일</td>
							</tr>
                            <tr>
								<td>쿠폰명</td>
								<td>${ readCoupon.c_name }</td>
								<td>할인율</td>
								<td>${ readCoupon.discount }</td>
							</tr>
							<tr>
								<td colspan="4">쿠폰내용 작성</td>
							</tr>
                            <tr>
                            	<td colspan="4"><textarea id="summernote" name="c_info">${ readCoupon.c_info }</textarea></td>
                            </tr>
						</table>
							<div id="btnBox1">
								<input type="button" value="목록" class="btn" id="listBtn" onclick="javascript:location.href='mgr_coupon.do'">
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