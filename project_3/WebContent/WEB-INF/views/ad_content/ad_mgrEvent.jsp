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
	<script type="text/javascript">
		function search(){
			var obj = document.frm;
			obj.submit();
		}//end search
		
		function eventWrite(){
			document.frm.action="mgr_event_writeFrm.do";
			document.frm.submit();
		}//noticeWrite
		
		function chk(cnt){
			document.getElementById("selID").value = cnt;
		}//chk
		
		function remove(){
			var obj=document.frm;
			if(confirm("선택하신 이벤트를 삭제 하시겠습니까?")){
				obj.action="mgrEvent_remove.do";
				obj.submit();
			}
		}
	</script>
<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/event.css"/>
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
					<h2><strong>이벤트관리</strong><small><span style="margin-left:10px; font-size: 15px;">등록된 이벤트 목록 확인</span></small></h2>
				</div>
				<div id="r_content_view">
			<c:catch var="e">
			<div id="mainContent">
				<table id="eventList" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<td>/</td>
							<td>No</td>
							<td>이벤트명</td>
							<td>내용</td>
							<td>이벤트장소</td>
							<td>시작일자</td>
							<td>종료일자</td>
							<td>첨부이미지</td>
							<td>첨부파일</td>
							<td>등록자</td>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty AllEventList }">
							<tr>
								<td colspan="10">등록된 이벤트 목록이 없습니다.</td>
							</tr>
						</c:if>
					<c:set var="cnt" value="${ AllEventList.size() + 1 }"/>
				<c:forEach var="AllEventList" items="${ AllEventList }">
					<c:set var="cnt" value="${ cnt-1 }"/>
						<tr>
							<td>
								<input type="radio" name="event_radio" onchange="chk('${AllEventList.e_no}')"/>
							</td>
							<td>${cnt}</td>
							<td>${ AllEventList.e_name_sub }</td>
							<td><a href="mgrEvent_readFrm.do?EventNo=${AllEventList.e_no}" style="color:#000;">${ AllEventList.e_info_sub }</a></td>
							<td>${ AllEventList.r_position}</td>
							<td>${ AllEventList.start_year }-${ AllEventList.start_month }-${ AllEventList.start_day }</td>
							<td>${ AllEventList.end_year }-${ AllEventList.end_month }-${ AllEventList.end_day }</td>
							<td>${ AllEventList.r_image}</td>
							<td>${ AllEventList.r_file}</td>
							<td>${ AllEventList.a_id}</td>
						</tr>
				</c:forEach>
					</tbody>
				</table>
				</div>
				</c:catch>
				
				<c:if test="${ e ne null }">
					${e }
					페이지 로딩 중 문제가 발생했습니다. 다시 시도해 주세요.
				</c:if>
				</div>
				<div style="margin-bottom: 10px;">
					<form action="mgr_event.do" method="get" name="frm">
					<input type="hidden" name="selID" id="selID"/>
						<div id="btnBox">
							<input type="hidden" name="cmd" value="w">
							<input type="text" name="searchBox" id="searchBox" class="inputBox" placeholder="제목검색" style="width: 200px;"/>
							<input type="button" onclick="search()" value="검색" style="width: 80px;"/>
							<input type="button" value="전체목록" id="allEventList" onclick="search()">
							<input type="button" onclick="eventWrite()" value="이벤트 등록">
							<input type="button" value="이벤트 삭제" id="eventRemove" onclick="remove()">
						</div>
					</form>
				</div>
			</div>
		</div><!-- rightArea End -->
	</div>
	<div id="footer">Copyrightⓒ 2018. SIST. Group2. HKLAND. All rights reserved</div>
</div>

</body>
</html>