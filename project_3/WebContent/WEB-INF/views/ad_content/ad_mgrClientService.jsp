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
		
		function chk(cnt){
			document.getElementById("selID").value = cnt;
		}//chk
		
		function remove(){
			var obj=document.frm;
				
			if(confirm("선택하신 고객서비스를 삭제 하시겠습니까?")){
				obj.action="mgrClient_remove.do";
				obj.submit();
			}
		}
	</script>
<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/client.css"/>
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
					<h2>고객서비스관리<small><span style="font-size: 15px;">고객 문의사항 확인</span></small></h2>
				</div>
				<div id="r_content_view">
					<c:catch var="e">
			<div id="mainContent">
				<table id="clientList" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<td>/</td>
							<td>No</td>
							<td>문의제목</td>
							<td>문의내용</td>
							<td>문의날짜</td>
							<td>문의자</td>
							<td>답변번호</td>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty AllClientList }">
							<tr>
								<td colspan="8">등록된 문의사항이 없습니다.</td>
							</tr>
						</c:if>
					<c:set var="cnt" value="${ AllClientList.size() + 1 }"/>
				<c:forEach var="AllClientList" items="${ AllClientList }">
					<c:set var="cnt" value="${ cnt-1 }"/>
						<tr>
							<td>
								<input type="radio" name="client_radio" onchange="chk('${AllClientList.s_no}')"/>
							</td>
							<td>${cnt}</td>
							<td><a href="mgrClient_readFrm.do?ClientNo=${AllClientList.s_no}" style="color:#000;">${ AllClientList.s_name_sub }</a></td>
							<td>${ AllClientList.s_info_sub }</td>
							<td>${ AllClientList.s_inputdate }</td>
							<td>${ AllClientList.m_id}</td>
							<td>${ AllClientList.a_no}</td>
						</tr>
				</c:forEach>
					</tbody>
				</table>
				</div>
				</c:catch>
				
				<c:if test="${ e ne null }">
					${ e }
					페이지 로딩 중 문제가 발생했습니다. 다시 시도해 주세요.
				</c:if>
				</div>
				<div style="margin-bottom: 10px;">
					<form action="mgr_clientService.do" method="get" name="frm">
					<input type="hidden" name="selID" id="selID"/>
						<div id="btnBox">
							<input type="hidden" name="cmd" value="w">
							<input type="text" name="searchBox" id="searchBox" class="inputBox" placeholder="제목검색" style="width: 200px;"/>
							<input type="button" onclick="search()" value="검색" style="width: 80px;"/>
							<input type="button" value="전체목록" id="allClientList" onclick="search()">
							<input type="button" value="고객서비스 삭제" id="ClientRemove" onclick="remove()">
						</div>
					</form>
				</div>
				</div>
			</div>
		</div><!-- rightArea End -->
	</div>
	<div id="footer">footer</div>

</body>
</html>