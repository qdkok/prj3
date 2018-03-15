<%@page import="java.io.File"%>
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
    
    <link rel="stylesheet" href="commons/css/info.css">
    <script src="commons/css/js/jquery/info.js"></script>
    
    <script type="text/javascript">
    $(function(){
    	var obj=document.frm;
    	$("#intro").click(function(){
    		obj.action="land_intro.do";
    		obj.submit();
    	});
    	var obj=document.frm;
    	$("#preference").click(function(){
    		obj.action="preference_coupon.do";
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
    <%
    	File file=new File("C:/dev/git/prj3/project_3/WebContent/upload");
    	//File file=new File("C:/dev/workspace/project_3/WebContent/upload");
  		File[] listFiles=file.listFiles();
    	
    %>
    
    <%
 	   File temp=null;
 	   for(int i=0 ; i<listFiles.length ; i++){
				temp=listFiles[i];
    %>
    <%
			}
	%>
		<div id="test_top" style="max-width: 1300px; margin: 0px auto;" >
	  		<div style=" background-color: #cd493c; width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; color: #fff">우대사항</div>
			<div style=" background-color: #cd493c;  width: 100%;  height: 150px;" ></div>
		</div>
		<div id="test_center" style="max-width: 1300px;  margin: 0px auto;" >
	  		<div style=" width: 250px; min-height: 900px; float: left; ">
			    <form name="frm" method="post" id="frm">
		  			<div><input type="button" class="button2" value="이벤트상세보기" id="event"></div>
		  			<div><input type="button" class="button2" value="우대사항 & 쿠폰 다운로드" id="preference"></div>
			    </form>
	  		</div>
			<div style=" width: 100%;  height: 800px; ">
			<div style=" height: 800px; padding-left: 300px; padding-top: 50px; ">
				
				<div style="/* background-color:#F0F0F0 */; width: 900px; height: 790px">
				<p style="font-size: 20px ;text-align: left">우대사항 </p><hr/>
				<div align="center">
					<table>
						<tr height="225px">
							<td width="225px"><img src="commons/images/preference1.PNG" style="padding: 5px"/></td>
							<td width="225px"><img src="commons/images/preference2.PNG" style="padding: 5px"/></td>
							<td width="225px"><img src="commons/images/preference3.PNG" style="padding: 5px"/></td>
						</tr>
						<tr height="225px">
							<td width="225px"><img src="commons/images/preference4.PNG" style="padding: 5px"/></td>
							<td width="225px"><img src="commons/images/preference5.PNG" style="padding: 5px"/></td>
							<td width="225px"><img src="commons/images/preference6.PNG" style="padding: 5px"/></td>
						</tr>
					</table>
				</div>
				<div style="padding-top: 30px">
					<p style="font-size: 20px ;text-align: left">쿠폰 다운로드 </p><hr/>
					<div align="center">
						<table >
							<tr>
								<td>
									
									  <a href="coupon_download.do?filename=coupon1.PNG"><img src="commons/images/coupon1.PNG" style="padding-right: 5px" /></a>
								</td>
								<td>
									<a href="coupon_download.do?filename=coupon2.PNG"><img src="commons/images/coupon2.PNG" style= "padding-left: 5px"/></a>
								</td>
							</tr>
						</table>
					</div>
				</div>
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
