<%@page import="kr.co.sist.hkland.dao.HklandDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 <head>
    <!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>HK랜드 플랫폼</title>
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="commons/css/business-frontpage.css" rel="stylesheet">
    
     <!-- CDN -->    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <c:import url="../common.jsp"/>
    
     <!-- Bootstrap core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
    <!-- CSS 줄때 화면 -->
    <link href="commons/css/main.css" rel="stylesheet">
	<style type="text/css">
		.btn{background-color:#ededed;font-weight: bold;}
		.red{color: red;}
		.title{font-weight: bold; font-size: 15px;}
		table{/* border: 2px solid #ededed; */ min-width: 400px; }
		.inputBox{width: 500px; height: 45px;}
		.inputBox2{height: 45px;}
		.box{background-color: #ededed;}
		td{padding: 5px;}
	</style>
    <script type="text/javascript">
		    	
	   function reservation(){
	    	location.href='sub_menu_ticket_value.do';
	    }
	    function reservation_process(){
	    	location.href='reservation_process.do';
	    }
    </script>
    
  </head>
  <body>
  <div id="wrap">
  
  	<header>
	  		<!-- nav바 -->
	  		<c:import url="../../../commons/menu/menu_nav.jsp"/>
	  		<!-- 메뉴버튼바 -->
	  		<c:import url="../../../commons/menu/menu_btn.jsp"/>
	  		
  	</header>
    <!-- Page Content -->
	<%
		String name=(String)session.getAttribute("id");
		if(name==null){
			out.print("<script>alert('로그인이필요합니다!')</script>");
			out.print("<script>location.href='login.do'</script>");
			session.invalidate();
		}
	%>  
    <div class="contain" >
    	<div id="test_top" style="max-width: 1300px; margin: 0px auto; " >
	  		<div style="background-color: #cd493c; width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; color: #fff">온라인 예매</div>
			<div style="background-color: #cd493c; width: 100%;  height: 150px; "></div>
		</div>
		<div id="test_center" style="max-width: 1300px; min-height:800px; margin: 0px auto;" >
	  		<div style=" width: 250px; min-height: 800px; float: left; ">
			    <form name="frm" method="post" id="frm">
		  			<div><input type="button" class="button2" value="온라인 예매" onclick="reservation()"></div>
		  			<div><input type="button" class="button2" value="예매내역 확인" onclick="reservation_process()"></div>
			    </form>
	  		</div>
			<span style="font-size: 30px; font-weight: bold;">예매내역</span>
			<div  style="width: 1000px; height: 800px; border: 2px solid #ededed; float: left; overflow: scroll;">
				<table style="width: 992px; height: 600px; border:2px solid #ededed; ">
				<c:if test="${sessionScope.id ne ''}">
					<tr style="border: 2px solid #ededed;">
						<td>예매번호</td>
						<td>이용권이미지</td>
						<td>이용권명</td>
						<td>매수</td>
						<td>총 결재 가격</td>
						<td>예매일</td>
					</tr>
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${list.r_no}</td>
							<td><img src="http://localhost:8080/project_3/uplioad/voucher/${list.u_image}" style="width: 50px; height: 50px;"/></td>
							<td>${list.u_name}</td>
							<td>${list.count}</td>
							<td>${list.count*list.price}</td>
							<td>${list.input_date}</td>
						</tr>
					
					</c:forEach>
					</c:if>
				</table>
				<input type="button" value="확인" onclick="loginAccess()"/>
			</div>
		</div>
    </div>	
    
    <!-- Footer -->
	    <footer class="py-5 bg-dark">
	     	<c:import url="../../../commons/menu/menu_footer.jsp"/>
	    </footer>

	</div>
  </body>
</html>
