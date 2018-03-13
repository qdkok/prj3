<%@page import="java.util.Date"%>
<%@page import="com.sun.org.apache.bcel.internal.classfile.Attribute"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
	.c_t{text-align: center; margin: 0 auto;}
	.intro_table tr td{font-size: 20px; font-weight: bold;}
	.center{text-align: center;}
</style>
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- JS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script type="text/javascript" >
	
		function changeImg(value){
			if(value.files && value.files[0]){
				var reader=new FileReader();
				reader.onload=function(e){
					$('#imgView').attr('src',e.target.result);
				}
				reader.readAsDataURL(value.files[0]);
			}
		}
	
		function day(){
			var objSel = document.getElementById("st_day");

			  for(i=objSel.length; i>=0; i--){
			    objSel.options[i]=null;
			}//end for
			  
			var year=$("[name=st_year]").val();
			if(year<2018){
				alert(year+"년보다 높게 입력해 주세요");
				$("[name=st_year]").focus();
				return;
			}//end if
			
			var month=$("[name=st_month]").val();
			
			var maxday=0;
			var monArr=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
			if(month!=2){
				maxday=monArr[month-1];
			}else{
				if((year%4==0 && year%100 !=0 || year%400 ==0)){
					maxday=29;
				}else{
					maxday=28;
				}//end esle
			}//end else
			var option=null;
			for(i=1; i<=maxday;i++){
				option=document.createElement("option");
				option.text=i;
				option.value=i;
				document.getElementById("st_day").options.add(option);
			}//end for
		}//day
		
		function endday(){
			var objSel = document.getElementById("ed_day");

			  for(i=objSel.length; i>=0; i--){
			    objSel.options[i]=null;
			}//end for
			  
			var year=$("[name=ed_year]").val();
			if(year<2018){
				alert(year+"년보다 높게 입력해 주세요");
				$("[name=ed_year]").focus();
				return;
			}//end if
			
			var month=$("[name=ed_month]").val();
			
			var maxday=0;
			var monArr=new Array(31,28,31,30,31,30,31,31,30,31,30,31);
			if(month!=2){
				maxday=monArr[month-1];
			}else{
				if((year%4==0 && year%100 !=0 || year%400 ==0)){
					maxday=29;
				}else{
					maxday=28;
				}//end esle
			}//end else
			var option=null;
			for(i=1; i<=maxday;i++){
				option=document.createElement("option");
				option.text=i;
				option.value=i;
				document.getElementById("ed_day").options.add(option);
			}//end for
		}//ed_day
		
		function insert(){
			document.frm.submit();
		}
		
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
		<div id="rightArea" style="overflow: scroll;">
			<div id="r_content">
				<div id="r_content_title">
					<h2>이용권관리<small><span style="font-size: 15px;">HK Land 이용권 목록</span></small></h2>
				</div>
				<div id="r_content_view" style="width: 1000px;">
					<div style=" margin-left: 100px;">
						<form action="Voucher_write_process.do" name="frm" method="post" enctype="multipart/form-data">
						<div style="margin-left: 550px;margin-bottom: 10px;" >
								<input type="hidden" name="selVoucher" value="<%=request.getParameter("selVoucher") %>" />
						</div>
						
						<table class="table table-striped table-bordered" style="width: 700px;">
							<tr>
								<td colspan="3" class="center">
									<img src="http://localhost:8080/project_3/uplioad/voucher/${load.u_image ne null?load.u_image:'180219_erd.PNG'}" style="width: 200px; height: 200px;" id="imgView" />
								</td>
							</tr>
							<tr>
								<td colspan="3" class="center"><input type="file" name="img" value="등록" onchange="changeImg(this);" accept=".jpg, .png, .jpeg" /></td>
							</tr>
							<tr>
								<td>이용권명</td>
								<td colspan="2"><input type="text" name="name" value="${ load.u_name}"/></td>
							</tr>
							<tr>
								<td>가격</td>
								<td colspan="2"><input type="text" name="price" value="${load.price }"/></td>
							</tr>
							<tr>
								<td>권종</td>
								<td colspan="2">
									<select name="ticket">
										<option>--권종선택--</option>
										<c:forEach var="tck" items="${ticket}">
										<c:choose>
											<c:when test='${load.t_no==tck.t_no}'>
												<option value="${tck.t_no }"  selected="selected">${tck.t_name }</option>
											</c:when>
											<c:otherwise>
												<option value="${tck.t_no }" >${tck.t_name }</option>
											</c:otherwise>
										</c:choose>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>쿠폰할인여부</td>
								<td colspan="2">
									<c:choose>
									<c:when test='${load.sale_flag eq "y"}'>
										<input type="checkbox" name="coupon" checked="checked">
									</c:when>
									<c:otherwise>
										<input type="checkbox" name="coupon">
									</c:otherwise>
									</c:choose>	
								</td>
							</tr>
							<tr>
								<td>이용권 설명</td>
								<td colspan="2"><textarea style="width: 200px; height: 200px;" name="info" >${load.info }</textarea></td>
							</tr>
							<tr>
								<td>판매 시작 일자</td>
								<td colspan="2">
									<input type="text" name="st_year" maxlength="4" width="50px;" value="${load.start_year }"/>년
									<select name="st_month" onchange="day()">
									<c:forEach var="st_month" begin="${1}" end="${12}">
										<c:choose>
										<c:when test="${st_month eq load.start_month }">
											<option value="${st_month}" selected="selected">${st_month}</option>
										</c:when>
										<c:otherwise>
											<option value="${st_month}">${st_month}</option>
										</c:otherwise>
										</c:choose>
									</c:forEach>
									</select>월
									<select name="st_day" id="st_day">
										<c:if test="${load.start_day ne null }">
											<option value="${load.start_day}" selected="selected">${load.start_day}</option>
										</c:if>
									</select>일
								</td>
							</tr>
							<tr>
								<td>판매 종료 일자</td>
								<td colspan="2">
									<input type="text" name="ed_year" maxlength="4" width="50px;" value="${load.end_year }"/>년
									<select name="ed_month"  onchange="endday()">
									<c:forEach var="ed_month" begin="${1}" end="${12}">
									
										<c:choose>
										<c:when test="${ed_month eq load.end_month }">
											<option value="${ed_month}" selected="selected">${ed_month}</option>
										</c:when>
										<c:otherwise>
											<option value="${ed_month}">${ed_month}</option>
										</c:otherwise>
										</c:choose>
									</c:forEach>
									</select>월
									<select name="ed_day" id="ed_day">
										<c:if test="${load.end_day ne null }">
											<option value="${load.end_day}" selected="selected">${load.end_day}</option>
										</c:if>
									</select>일
								</td>
							</tr>
							<tr>
								<td colspan="3" class="center">
									<input type="button" value="등록" onclick="insert()"/>
									<input type="button" value="취소" onclick="javascript:location.back()"/>
								</td>
							</tr>
						</table>
						
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