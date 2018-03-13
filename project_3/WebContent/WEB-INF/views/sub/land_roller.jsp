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
    
    $(function(){
    	
    	$("#loc_btn").click(function(){
    		var rand = $("[name='loc']").val();
    		
    		if(rand == "----지역별 위치----"){
    			$("[name='loc_frm']").action ="land_roller.do";
    			$("[name='loc_frm']").submit();
    		}
    		if(rand != "----지역별 위치----"){
    			$("[name='loc_frm']").action ="land_roller.do?loc="+rand;
    			$("[name='loc_frm']").submit();
    		}
    	})

    });//ready
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
				<div style="border: 1px sold #333">
				<hr/>
				
					<%
						String loc = request.getParameter("loc");
						if(loc == null){
							loc = "----지역별 위치----";
						}
						RideVO rvo = new RideVO(loc);
						RideDAO r_dao=RideDAO.getInstance();
						List<RideDomain> list=r_dao.selectquery(rvo);
						request.setAttribute("list", list);
					%>
					
					
					<form method="get" name="loc_frm">
					<select name="loc">
					
					<option value="----지역별 위치----" >----지역별 위치----</option>
						<option value="유러피안어드벤처" ${param.loc=="유러피안어드벤처"?"selected":""}>유러피안어드벤처</option>
						<option value="아시안어드벤처" ${param.loc=="아시안어드벤처"?"selected":""}>아시안어드벤처</option>
						<option value="매직랜드" ${param.loc=="매직랜드"?"selected":""}>매직랜드</option>
						<option value="아메리칸빌리지" ${param.loc=="아메리칸빌리지"?"selected":""}>아메리칸빌리지</option>
						<option value="주토피아" ${param.loc=="주토피아"?"selected":""}>주토피아</option>
					</select>
					<input type="button" value="검색" class="search_btn" id="loc_btn"/>
					</form>
				</div>
				<div style="border: 1px sold #333">
				<hr/>
				
				
				<c:catch var="e">
				
				
						<c:forEach var="rd" items="${ list }">
						<div class="rideBox" style="float: left; border: 1px solid #EEEEEE; margin-right:5px">
						<table>
							<tr>
 								<td><img src="commons/rides/${ rd.r_image1 }" style="width:220px; height:120px"/></td> 
							</tr>
							<tr>
								<td>${ rd.r_name }</td>
							</tr>
						</table>
						</div>
						</c:forEach>
						
						<c:if test="${ e ne null }">
								${ e }
						<span style="color:#FF0000">조회시 문제가 발생했습니다.</span>
						</c:if>
						
				</c:catch>
				
				
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
