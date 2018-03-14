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
    <link href="commons/css/tab.css" rel="stylesheet">
    <link href="commons/css/table.css" rel="stylesheet">
    
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <script>
			$(function () {
			
			    $(".tab_content").hide();
			    $(".tab_content:first").show();
			
			    $("ul.tabs li").click(function () {
			        $("ul.tabs li").removeClass("active").css("color", "#333");
			        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			        $(this).addClass("active").css("color", "darkred");
			        $(".tab_content").hide()
			        var activeTab = $(this).attr("rel");
			        $("#" + activeTab).fadeIn()
			    });
			});
    </script>
    
    
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
    	<div id="test_top" style="max-width: 1300px;  margin: 0px auto;" >
	  		<div style=" background-color: #cd493c; width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; color: #fff">HK랜드 소개</div>
			<div style=" width: 100%;  height: 150px; background-color: #cd493c;"></div>
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
				<div style="font-size: 30px; padding-left: 600px;" >환상의 나라 HK 랜드로<br/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;당신을 초대합니다!</div>
				<div style="padding-left: 300px">
				<hr width="800px">
					<table >
						<tr>
							<td><img src="commons/images/roller.png" width="300px" height="150px"/></td>
							<td style="padding-left: 30px; padding-right: 30px">HK랜드에만 있는 심장을 뛰게 하는 26종의 아찔한 놀이기구!<br/>다양한 놀이기구를 타보며 연인, 가족과 함께 즐거운 시간을 보내세요!</td>
						</tr>
					</table>
				</div>
				<div style="padding-left: 350px; padding-right: 50px">
				<hr width="800px">
					<table >
						<tr>
							<td style="padding-left: 30px; padding-right: 30px">HK랜드만의 특별함 ! HK랜드 환상의 숲으로 여러분을 초대합니다.<br/> 
							프레리도그, 설가타 육지거북, 레오파드 육지거북, 고슴도치 등 새로운 친구들이 찾아왔어요 ~</td>
							<td><img src="commons/images/zoo.jpg" width="300px" height="150px"/></td>
						</tr>
					</table>
				</div>
					
					<div style="padding-left: 300px; padding-right: 50px">
					<!-- 탭메뉴 -->
					<div id="tab">
					<hr width="800px">
					    <ul class="tabs">
					        <li class="active" rel="tab1">대중교통</li>
					        <li class="active" rel="tab2">자가용</li>
					        <li class="active" rel="tab3">정기버스</li>
					    </ul>
					    <div id="tab1" class="tab_content">
						    <img src="commons/images/subway.png" width="600px" height="250px" style="float: left"/>
							<div style="font-size: 15px ; color: #333; padding-left: 700px; padding-top: 100px"><strong>◎지하철 이용시</strong>
							<br/>지하철 1호선 이용.<br/> 오산역 1번출구 하차 도보 15분<br/>※택시 이용 : 기본료 (2500원)</div>
						</div>
					    <div id="tab2" class="tab_content">
					  	  <img src="commons/images/car.png" width="600px" height="250px" style="float: left"/>
					  	  <div style="font-size: 15px ; color: #333; padding-left: 700px; padding-top: 50px"><strong>◎자가용 이용시</strong>
					  	  <br/>경부고속도로 오산 IC→오산TG→HK랜드<br/> <strong>◎자가용 주차 안내</strong>
					  	  <br/>* 정문 주차장 만차 시 주차요원(안내판)이 운영중인 주차장 중 가장 가까운 곳으로 안내해 드립니다.
					  	  <br/>* 각 주차장과 정문 간 무료 셔틀버스가 수시로 운행됩니다. (5분 정도 소요. 유모차 탑승 가능)</div>
					    </div>
					    <div id="tab3" class="tab_content">
					     	<table class=table14_11>
								<tr>
									<th width="150px">구분</th><th width="200px">출발지</th><th width="500px">경로</th>
								</tr>
								<tr>
									<td>고속버스 이용 시</td><td>강남고속버스터미널</td><td>지하철 7호선 (고속터미널역) 출발 > 지하철 1호선 오산역&환승센터 하차 > 도보 15분</td>
								</tr>
								<tr>
									<td>시외버스 이용 시</td><td>서울남부터미널</td><td>지하철 3호선 (남부터미널역) 출발 > 지하철 1호선 오산역&환승센터 하차 > 도보 15분</td>
								</tr>	
								<tr >
									<td rowspan="2">기차 이용 시</td><td>용산역 출발</td><td>오산역 1호선(누리로) > 지하철 1호선 오산역&환승센터 하차 > 도보 15분</td>
								</tr>	
								<tr>
									<td>서울역 출발</td><td>오산역 1호선(무궁화호) > 지하철 1호선 오산역&환승센터 하차 > 도보 15분</td>
								</tr>	
							</table>
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
