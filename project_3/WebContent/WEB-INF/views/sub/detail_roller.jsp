<%@page import="kr.co.sist.hkland.vo.RideVO"%>
<%@page import="org.apache.ibatis.annotations.Param"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="kr.co.sist.hkland.domain.RideDomain"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.sist.hkland.dao.RideDAO"%>
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
    
   	function chgimg(name){
    	$("#bigimg").attr("src","http://localhost:8080/project_3/commons/rides/"+name); 
    };
    
    

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
    	<div id="test_top" style="max-width: 1300px; margin: 0px auto;"  >
	  		<div style=" background-color: #cd493c; width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; color: #333">HK랜드 소개</div>
			<div style=" background-color: #cd493c; width: 100%;  height: 150px;"></div>
		</div>
		<div id="test_center" style="max-width: 1300px;  margin: 0px auto;" >
	  		<div style=" width: 250px; min-height: 800px; float: left; ">
			    <form name="frm" method="post" id="frm">
		  			<div><input type="button" class="button2" value="랜드소개" id="intro"></div>
		  			<div><input type="button" class="button2" value="놀이기구" id="roller"></div>
		  			<div><input type="button" class="button2" value="랜드정보" id="info"></div>
			    </form>
	  		</div>
			<div style=" width: 100%;  height: 800px; ">
				<div style="border: 1px sold #333">
				<hr/>
				
				
				<div style=" height: 800px; padding-left: 300px ; padding-right: 50px">
					
					<c:catch var="e">
								
								<table >
									<tr>
										<td><img src="commons/rides/${details.r_image1}" style="width: 498px; height: 450px" id="bigimg" /></td>
										<td width="500px">
											<div style="margin-left: 70px"><font size="7"><strong>${details.r_name }</strong><hr/></font><p>${details.r_info }</p><br/>▶ 이용요금  ${details.r_price }원<br/>▶ 탑승인원  ${details.r_cnt }<br/>▶ 탑승제한<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  키 : ${details.r_height }cm 이상<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  나이 : ${details.r_age }세 이상 ~ 65세 미만</div>
										</td>
									</tr>
									<tr>
										<td>
											<img src="commons/rides/${details.r_image1}" style="width: 121px; height: 80px" name="${details.r_image1}" onclick="chgimg(name)"/>
											<img src="commons/rides/${details.r_image2}" style="width: 121px; height: 80px" name="${details.r_image2}" onclick="chgimg(name)"/>
											<img src="commons/rides/${details.r_image3}" style="width: 121px; height: 80px" name="${details.r_image3}" onclick="chgimg(name)"/>
											<img src="commons/rides/${details.r_image4}" style="width: 121px; height: 80px" name="${details.r_image4}" onclick="chgimg(name)"/>
										</td>
										<td><div style="margin-left: 100px"><img src="commons/images/caution.PNG" style="width:250px; height:70px"/></div></td>
									</tr>
								</table>
							
							<c:if test="${ e ne null }">
									${ e }
							<span style="color:#FF0000">조회시 문제가 발생했습니다.</span>
							</c:if>
							
					</c:catch>
					
					
				</div>
				
				</div>
				
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
