<%@page import="com.sun.org.apache.bcel.internal.classfile.Attribute"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- <%
if(session.getAttribute("delvoucher")!=null&&!"".equals(session.getAttribute("delvoucher"))){
	System.out.print(session.getAttribute("delvoucher"));
	out.print("<script type='text/javascript' >alert('선택항목이 삭제되었습니다');</script>");
}//end 
%> --%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
	.c_t{text-align: center; margin: 0 auto;}
	.intro_table tr td{font-size: 20px; font-weight: bold;}
</style>
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" >
	
		function chkVoucher(selNo){
			$("[name=selVoucher]").val(selNo);	
		}//chkVoucher
		
		function insert_Voucher(){
			$("[name=selVoucher]").val("");	
			document.frm.action="ad_mgrVoucher_write_frm.do"
			document.frm.submit();
		}//delMemeber
		
		function update_Voucher(){
			var id=$("[name=selVoucher]").val();
			if(id!="" && id!=null){
				document.frm.action="ad_mgrVoucher_write_frm.do"
				document.frm.submit();
			}else{
				alert("수정할 이용권을 선택해 주세요");
			}//end else
		}//delMemeber
		
		function delVoucher(){
			var id=$("[name=selVoucher]").val();
			if(id!=""){
				if(confirm(id+"을 삭제하시겠습니까?")){
					document.frm.action="mgr_voucher.do"
					document.frm.submit();
					$("[name=selVoucher]").val("");
				}//end if
			}else{
				alert("이용권을 선택해 주세요.");
			}
		}//delMemeber
	</script>
<!-- CSS -->
	<link rel="stylesheet" type="text/css" href="http://localhost:8080/project_3/ad_common/css/main.css"/>
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
			<div id="r_content" >
				<div id="r_content_title">
					<h2>이용권관리<small><span style="font-size: 15px;">HK Land 이용권 목록</span></small></h2>
				</div>
				<div id="r_content_view" style="width: 1000px; height: 600px; overflow: scroll; ">
					<div style=" margin-left: 100px; overflow: auto;">
						<div style="margin-left: 550px;margin-bottom: 10px;" >
							<form name="frm" method="get">
								<input type="hidden" name="selVoucher" />
								<input type="button" value="이용권 등록" onclick="insert_Voucher()"/>
								<input type="button" value="수정" onclick="update_Voucher()"/>
								<input type="button" value="삭제" onclick="delVoucher()"/>
							</form>
						</div>
						<table class="table table-striped table-bordered" style="width: 750px;">
							<c:forEach var="vou"  items="${voucher}">
							
							<tr>
								<td class="c_t">
									<input type="radio" name="voucher"  onclick="chkVoucher('${vou.u_no}')" />
								</td>
								<td class="c_t" style="width: 250px;">
									<img src="http://localhost:8080/project_3/uplioad/voucher/${vou.u_image}" style="width: 200px;height: 200px;"/>
								</td>
								<td style="width: 500px;">
									<table class="intro_table">
										<tr>
											<td width="150px;">이용권 명 </td>
											<td>${vou.u_name}</td>
										</tr>
										<tr>
											<td>가격정보 </td>
											<td>${vou.price} 원</td>
										</tr>
										<tr>
											<td>쿠폰할인 </td>
											<td>${vou.sale_flag}</td>
										</tr>
										<tr>
											<td>판매 일자 </td>
											<td>${vou.start_year}년${vou.start_month}월${vou.start_day}일~${vou.end_year}년-${vou.end_month}월-${vou.end_day}일</td>
										</tr>
									</table>
								</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</div><!-- rightArea End -->
	</div>
	<div id="footer">footer</div>
</div>

</body>
</html>