<%@page import="kr.co.sist.admin.domain.MemberDomain"
%><%@page import="java.util.List"
%><%@page import="kr.co.sist.admin.dao.HklandAdminDAO"
%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" 
%><%@ page session="true" 
%><%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/main.css"/>
<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" >
			function chk(cnt,sel_id){
				$('#test tr').css({
					'background-color':'#fff'
				 }); 
				$('.cnt'+cnt).css({
					'background-color':'#888'
				 }); 
				$("[name=selID]").val(sel_id);
			}//chk
			
			function delMember(){
				var id=$("[name=selID]").val();
				if(id!=""){
					if(confirm(id+"회원님을 삭제하시겠습니까?")){
						document.frm.submit();
						$("[name=searchID]").val("");
					}//end if
				}else{
					alert("삭제할 회원을 선택해 주세요.");
				}
			}//delMemeber
			
			function searchId(){
				$("[name=selID]").val("");
				document.frm.submit();
			}//end searchId
			
			function key(e){
				if(e.keyCode==13 && e.srcElement.type != 'textarea'){
					searchId();
				}//end if
			}//end key
	</script>

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
					<h2>회원관리<small><span style="font-size: 15px;">가입된 회원의 정보 목록</span></small></h2>
				</div>
				<div id="r_content_view">
					<div>
						<form action="mgr_customer.do" method="get"  name="frm">
							<input type="hidden" name="selID" />
							<div style="float: right; margin: 10px;">
								<input type="text" name="searchID"/>
								<input type="button" onclick="searchId()" onkeydown="return Key(event)" value="검색"/>
							</div>
						</form>
					</div>
						<div style="overflow:scroll; width: 1000px;">
						<table id="test" class="table table-striped table-bordered">
						 	<thead>
						 		<tr>
							 		<td></td>
							 		<td>ID</td>
							 		<td>이름</td>
							 		<td>생년월일</td>
							 		<td>성별</td>
							 		<td>이메일</td>
							 		<td>전화번호</td>
							 		<td>가입일</td>
						 		</tr>
						 	</thead>
						 	<tbody>
						 		<%
						 			HklandAdminDAO hk_dao=HklandAdminDAO.getInstance();
						 			
						 			//회원강제탈퇴 실행
							 		if(request.getParameter("selID")!=null){
							 			hk_dao.delMember(request.getParameter("selID"));
							 			out.print("<script type='text/javascript' >alert("+request.getParameter("selID")+"회원 강제탈퇴);</script>");
							 		}//end if
						 			
							 		List<MemberDomain> member=null;
							 		
						 			if(request.getParameter("searchID")!=null){
							 			member = hk_dao.seachMember(request.getParameter("searchID"));
						 			}else{
						 				member = hk_dao.selectMember();
						 			}//end else;
							 		
							 		//세션에 불러온값 저장
						 			session.setAttribute("member", member); 	
						 			
						 		%>
								<c:catch var="e">
								</c:catch>
								<c:if test="${ e ne null }">
									${e }
									사용자 정보 로딩중 문제발생
								</c:if>
								<c:set var="cnt" value="${0}" />
								<c:forEach var="member" items="${member}">
								<c:set var="cnt" value="${cnt+1}" />
									<tr class="cnt${cnt}">
										<td>
											<input type="radio" name="mem_radio" onchange="chk('${cnt}','${member.id }')"/>
										</td>
								 		<td>${member.id }</td>
								 		<td>${member.name} </td>
								 		<td>${member.birth }</td>
								 		<td>${member.gender }</td>
								 		<td>${member.email }</td>
								 		<td>${member.phone }</td>
								 		<td>${member.inputdate }</td>
							 		</tr>
						 		</c:forEach>
						 	</tbody>
						</table>
						</div>
				</div>
				<div style="float: right;">
					<input type="button" value="회원 강제탈퇴" onclick="delMember()">
				</div>
			</div>
		</div><!-- rightArea End -->
	</div>
	<div id="footer">footer</div>
</div>

</body>
</html>