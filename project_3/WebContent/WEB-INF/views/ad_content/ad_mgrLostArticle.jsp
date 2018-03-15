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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!-- JS -->
	<script type="text/javascript">
		function search(){
			var obj = document.frm;
			obj.submit();
		}//end search
		
		function LostWrite(){
			document.frm.action="mgr_lost_writeFrm.do";
			document.frm.submit();
		}//noticeWrite
		
		function chk(cnt){
			document.getElementById("selID").value = cnt;
		}//chk
		
		function remove(){
			var obj=document.frm;
				
			if(confirm("선택하신 분실물을 삭제 하시겠습니까?")){
				obj.action="mgrLost_remove.do";
				obj.submit();
			}
		}
		
		function statusChg(flag,l_no){
			document.getElementById("l_no").value = l_no;
			document.getElementById("l_result").value = flag=='x'?'o':flag;
			
			document.frm.submit();
		}
	</script>
<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/main.css"/>
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/lost.css"/>
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
					<h2>분실물관리<small><span style="font-size: 15px;">분실물 목록 확인</span></small></h2>
				</div>
				<div id="r_content_view">
						<c:catch var="e">
			<div id="mainContent">
				<table id="lostList" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<td>/</td>
							<td>No</td>
							<td>이미지</td>
							<td>분실물명</td>
							<td>습득장소</td>
							<td>습득일</td>
							<td>처리결과</td>
							<td>상태변경</td>
							<td>등록자</td>
						</tr>
					</thead>
					<tbody>
						<c:if test="${ empty AllLostList }">
							<tr>
								<td colspan="9">등록된 분실물 목록이 없습니다.</td>
							</tr>
						</c:if>
					<c:set var="cnt" value="${ AllLostList.size() + 1 }"/>
				<c:forEach var="AllLostList" items="${ AllLostList }">
					<c:set var="cnt" value="${ cnt-1 }"/>
						<tr>
							<td>
								<input type="radio" name="Lost_radio" onchange="chk('${AllLostList.l_no}')"/>
							</td>
							<td>${cnt}</td>
							<td>${ AllLostList.l_image}</td>
							<td>${ AllLostList.l_name }</td>
							<td>${ AllLostList.l_kate }</td>
							<td>${ AllLostList.l_year }-${ AllLostList.l_month }-${ AllLostList.l_day }</td>
							<td>
								<c:if test="${ 'o' eq AllLostList.l_result}">
									방문수령
								</c:if>
								<c:if test="${ 'x' eq AllLostList.l_result}">
									보관중
								</c:if>
							</td>
							<td>
									<input type="button" name="chgStatus" value="상태변경" onclick="statusChg('${AllLostList.l_result}',${AllLostList.l_no})">
							</td>
							<td>${ AllLostList.a_id }</td>
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
					<form action="mgr_lostArticle.do" method="get" name="frm">
					<input type="hidden" name="selID" id="selID"/>
					<input type="hidden" name="l_no" id="l_no"/>
					<input type="hidden" name="l_result" id="l_result"/>
						<div id="btnBox">
							<input type="hidden" name="cmd" value="w">
							<input type="text" name="searchBox" id="searchBox" class="inputBox" placeholder="제목검색" style="width: 200px;"/>
							<input type="button" onclick="search()" value="검색" style="width: 80px;"/>
							<input type="button" value="전체목록" id="allLostList" onclick="search()">
							<input type="button" onclick="LostWrite()" value="분실물 등록">
							<input type="button" value="분실물 삭제" id="LostRemove" onclick="remove()">
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