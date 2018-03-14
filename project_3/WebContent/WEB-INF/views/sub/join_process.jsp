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
		    	
	   function loginAccess(){
	    	location.href='login.do';
	    }
	    function joinAccess(){
	    	location.href='join_terms.do';
	    }
	    function searchIDAccess(){
	    	location.href='searchId.do';
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
	
    <div class="contain" >
    	<div id="test_top" style="max-width: 1300px;  margin: 0px auto;" >
	  		<div style=" width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; background-color: #cd493c; color: #fff ">회원가입</div>
			<div style=" width: 100%;  height: 150px; background-color: #cd493c;"></div>
		</div>
		<div id="test_center" style="max-width: 1300px; margin: 0px auto;" >
	  		<div style=" width: 250px; min-height: 800px; float: left; ">
			    <form name="frm" method="post" id="frm">
		  			<div><input type="button" class="button2" value="로그인" onclick="loginAccess()"></div>
		  			<div><input type="button" class="button2" value="회원가입" onclick="joinAccess()"></div>
		  			<div><input type="button" class="button2" value="ID/PASS 찾기" onclick="searchIDAccess()"></div>
			    </form>
	  		</div>
			<div style=" width: 100%;  height: 800px; " align="center" >
					<c:choose>
						<c:when test="${join_flag}">
							회원가입을 축하드립니다.
							<input type="button" value="로그인" onclick="loginAccess()"/>
						</c:when>
						<c:otherwise>
							회원가입중 문제가 발생했습니다 잠시 후 다시 시도해 주세요
							<input type="button" value="돌아가기" onclick="history.back()"/>
						</c:otherwise>
					</c:choose>
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
