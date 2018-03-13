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
		
		function key(e){
			if(e.keyCode==13){
				search();
			}//end if
		}//end key
		
		function noticeWrite(){
			location.href="mgrNotice_writeFrm.do";
		}//noticeWrite
		
		function chk(cnt){
			document.getElementById("selID").value = cnt;
		}//chk
		
	</script>
<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/notice.css"/>
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
					<h2>공지사항관리<small><span style="font-size: 15px;">공지사항 목록 확인</span></small></h2>
				</div>
				<div id="r_content_view">
				<c:catch var="e">
			<div id="mainContent">
				<table id="noticeList" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
						<td width="40px">/</td>
						<td width="40px">No</td>
						<td width="225px">제목</td>
						<td width="465px">내용</td>
						<td width="115px">작성자</td>
						<td width="115px">작성일</td>
						</tr>
					</thead>
					<c:if test="${ empty AllNoticeList }">
						<tr>
							<td colspan="6">${ param.searchBox }이 포함된 제목은 없습니다.</td>
						</tr>
					</c:if>
					<c:set var="cnt" value="${ AllNoticeList.size() +1 }"/>
				<c:forEach var="AllNoticeList" items="${ AllNoticeList }">
					<c:set var="cnt" value="${cnt-1}"/>
					<tbody>
						<tr class="cnt${AllNoticeList.n_no}">
							<td>
								<input type="radio" name="notice_radio" onchange="chk('${AllNoticeList.n_no}')"/>
							</td>
							<td>${ cnt }</td>
							<%-- <td>${ AllNoticeList.n_no }</td> --%>
							<td>${ AllNoticeList.n_name_sub }</td>
							<td><a href="mgrNotice_readFrm.do?noticeNo=${AllNoticeList.n_no}" style="color:#000;">${ AllNoticeList.n_info_sub }</a></td>
							<td>${ AllNoticeList.a_id }</td>
							<td>${ AllNoticeList.n_inputdate }</td>
						</tr>
					</tbody>
				</c:forEach>
				</table>
				</div>
				</c:catch>
				<c:if test="${ e ne null }">
					${e }
					페이지 로딩 중 문제가 발생했습니다. 다시 시도해 주세요.
				</c:if>
				</div>
				<div style="margin-bottom: 10px;">
					<form action="mgr_notice.do" method="get"  name="frm">
					<input type="hidden" name="selID" id="selID"/>
						<div id="btnBox">
							<input type="text" name="searchBox" id="searchBox" class="inputBox" placeholder="제목검색" style="width: 200px;"/>
							<input type="button" onclick="search()" onkeydown="return Key(event)" value="검색" style="width: 80px;"/>
							<input type="button" value="전체목록" id="allNoteList" onclick="search()">
							<input type="button" value="공지 등록" id="noteWrite" onclick="noticeWrite()">
							<input type="submit" value="공지 삭제" id="noteRemove" onclick="javascript:form.action='mgrNotice_remove.do';">
						</div>
					</form>
				</div>
			</div>
		</div><!-- rightArea End -->
	</div>
	<div id="footer">footer</div>
</div>

</body>
</html>