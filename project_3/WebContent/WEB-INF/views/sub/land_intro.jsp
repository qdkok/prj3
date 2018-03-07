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
    
    
    <script type="text/javascript">
    $(function(){
    	var obj=document.frm;
    	$("#intro").click(function(){
    		obj.action="land_intro.do";
    		obj.submit();
    	});
    	var obj=document.frm;
    	$("#roller").click(function(){
    		obj.action="land_roller.do";
    		obj.submit();
    	});
    	var obj=document.frm;
    	$("#info").click(function(){
    		obj.action="land_info.do";
    		obj.submit();
    	});
    });
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
    	<div id="test_top" style="max-width: 1300px; border: 3px dotted #EDEDED; margin: 0px auto;" >
	  		<div style=" border: 1px dotted #EDEDED;width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px">HK랜드 소개</div>
			<div style=" width: 100%;  height: 150px; border: 1px dotted #EDEDED;">공백</div>
		</div>
		<div id="test_center" style="max-width: 1300px; border: 3px dotted #EDEDED; margin: 0px auto;" >
	  		<div style=" width: 250px; min-height: 800px; float: left; border: 1px dotted #EDEDED;">
			    <form name="frm" method="post" id="frm">
		  			<div><input type="button" class="button2" value="랜드소개" id="intro"></div>
		  			<div><input type="button" class="button2" value="놀이기구" id="roller"></div>
		  			<div><input type="button" class="button2" value="랜드정보" id="info"></div>
			    </form>
	  		</div>
			<div style=" width: 100%;  height: 800px; border: 1px dotted #EDEDED;">
				<table>
					<tr>
						<td>꿈과 환상의 HK랜드로 초대합니다.</td>
						<td>꿈과 환상의 HK랜드로 초대합니다.</td>
						<td>꿈과 환상의 HK랜드로 초대합니다.</td>
					</tr>
				</table>
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
