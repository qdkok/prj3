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
    
    <!-- CSS 줄때 화면 -->
    <style type="text/css">
    	#button{ background-color: #FFFFFF; width: 287px; height: 100px; margin-right: -3px; margin-left: -3px;}
    	#back-header{background-color: #fff; }	
    	#logo-button  { width: 1140px; margin: 0 auto;  }
    	.main-img{height: 600px;  margin: 0 auto;}
    	.img_div{ width: 285px; height: 250px;}
    	.line{  width: 1140px; height: 50px; margin: 0 auto;}
    	.notice{ width: 570px; height: 250px }
    </style>
    
    <!-- CDN -->    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <c:import url="common.jsp"/>
    
     <!-- Bootstrap core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
  </head>
  <body>
  <div id="wrap">
  
	  		<!-- nav바 -->
	  		
	  		<c:import url="../../commons/menu/menu_nav.jsp"/>
	  		<!-- 메뉴버튼바 -->
	  		<c:import url="../../commons/menu/menu_btn.jsp"/>
  			<div class="line">
						
	  		</div>
	    <!-- Page Content -->
	    <div class="main-img">
			<c:import url="main_img.jsp"/>
		</div>
	
	<div class="line"></div>
    <div class="container">
    <div class="row">
    	<div>
	    	<div class=img_div align="center" style="float: left;">
	    		<a href="sub_menu_ticket_value.do"><img src="commons/images/g1.JPG"  width="250px" height="250px" onclick=""/></a>
	    	</div>
	    	<div class=img_div align="center" style="float: left;">
	    		<a href="sub_menu_ticket_value.do"><img src="commons/images/g2.JPG"  width="250px" height="250px" onclick=""/></a>
	    	</div>
	    	<div class=img_div align="center" style="float: left;">
	    		<a href="sub_menu_ticket_value.do"><img src="commons/images/g3.JPG"  width="250px" height="250px" onclick=""/></a>
	    	</div>
	    	<div class=img_div align="center" style="float: left;">
	    		<a href="sub_menu_ticket_value.do"><img src="commons/images/g4.JPG"  width="250px" height="250px" onclick=""/></a>
	    	</div>
    	</div>
	      <div class="line"></div>
	      
		      <div class=img_div align="center">
		      	<a href="preference_coupon.do"><img src="commons/images/discount.png" width="250px" height="250px"onclick="" /></a>
		      </div>
		      <div class=img_div align="center">
			      <table style="border:2px solid #fff; height: 246px;" >
			      	<tr align="center">
			      		<td width="246px" valign="middle" >
			      			<img src="commons/images/location.png"/>
			      		</td>
			      		
			      	</tr>
			      	<tr align="center">
			      		<td width="246px" valign="middle" >
			      			<img src="commons/images/information.png"/>
			      		</td>
			      	</tr>
			      	<tr align="center">
			      		<td width="246px" valign="middle" >
			      			<img src="commons/images/attraction.png"/>
			      		</td>
			      	</tr>
			      </table>
		      </div>
		      <div class=notice>
		      	<table style="width: 536px; height: 246px; border: 2px solid #ededed; margin-left: 15px;">
		      		<tr>
		      			<td style="margin: 10px;">● 공지사항</td>
		      			<td style="margin: 10px;">● 분실물 센터</td>
		      		</tr>
		      		<tr>
		      			<td></td>
		      			<td></td>
		      		</tr>
		      	</table>
		      	
		      </div>
		   <div class="line"></div>
	      </div>
      
    </div>	
    
    <!-- Footer -->
	    <footer class="py-5 bg-dark">
	     	<c:import url="../../commons/menu/menu_footer.jsp"/>
	    </footer>

	</div>
  </body>
</html>
