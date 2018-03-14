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
    	$("#roller").click(function(){
    		obj.action="land_roller.do";
    		obj.submit();
    	});
    	var obj=document.frm;
    	$("#info").click(function(){
    		obj.action="land_info.do";
    		obj.submit();
    	});
    	
    	$( function() {
    		  $( "#tabs" ).tabs().addClass( "ui-tabs-vertical ui-helper-clearfix" );
    		  $( "#tabs li" ).removeClass( "ui-corner-top" ).addClass( "ui-corner-left" );
    	 } );
    	
    	/* $(function(){
    		$("#info"+i).click(function(){
    			$("#img").attr("src","commons/images/img"+i+".PNG")
    		});
    		$("#info2").click(function(){
    			$("#img").attr("src","commons/images/img2.PNG")
    		});
    		$("#info3").click(function(){
    			$("#img").attr("src","commons/images/img3.PNG")
    		}); 
    	});*/
    	  
    	
    });
    
    /////// 코드 간소화 ///////
    function chgImg( type, sec){
    	var types=new Array();
    	types[0]=['img1.PNG','img2.PNG','img3.PNG'];//안내
    	types[1]=['img1.PNG','img2.PNG','img2.PNG'];//의무
    	types[1]=['img1.PNG','img2.PNG','img2.PNG'];//의무
    	types[1]=['img1.PNG','img2.PNG','img2.PNG'];//의무
    	types[1]=['img1.PNG','img2.PNG','img2.PNG'];//의무
    	
    	$("#img").attr("src","commons/images/"+types[type][sec]);
    }
    
    function map(){
    	window.open("map.do","child","width=800, height=750, top="+(window.screenY+120)+",left="+(window.screenX+220));
    }
    
    </script>
    
  <style>
	  .ui-tabs-vertical { width: 55em; }
	  .ui-tabs-vertical .ui-tabs-nav { padding: .2em .1em .2em .2em; float: left; width: 12em; }
	  .ui-tabs-vertical .ui-tabs-nav li { clear: left; width: 100%; border-bottom-width: 1px !important; border-right-width: 0 !important; margin: 0 -1px .2em 0; }
	  .ui-tabs-vertical .ui-tabs-nav li a { display:block; }
	  .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active { padding-bottom: 0; padding-right: .1em; border-right-width: 1px; }
	  .ui-tabs-vertical .ui-tabs-panel { padding: 1em; float: right; width: 40em;}
  </style>
    
    
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
			<div style=" width: 100%;  height: 800px; ">
			<div style=" height: 800px; padding-left: 300px ">
				
				
				<div id="tabs">
			  <ul>
			    <li><a href="#tabs-1">1. 안내데스크</a></li>
			    <li><a href="#tabs-2">2. 의무실</a></li>
			    <li><a href="#tabs-3">3. 유모차 대여소</a></li>
			    <li><a href="#tabs-4">4. 기저기 교환실</a></li>
			    <li><a href="#tabs-5">5. 유아휴게실</a></li>
			    <li><a href="#tabs-6">6. 휠체어 대여소</a></li>
			    <li><a href="#tabs-7">7. 현금지급기</a></li>
			    <li><a href="#tabs-8">8. 고객상담실</a></li>
			    <li><a href="#tabs-9">9. 미아보호소</a></li>
			  </ul>
			  <div id="tabs-1">
			    <h2>안내데스크</h2>
			    	<img id="img" style="width: 600px; height: 400px"; src="commons/images/car.png"/>
			    	<input type="button" value="1" id="info1" onclick="chgImg(0,0)"/>
			    	<input type="button" value="2" id="info2" onclick="chgImg(0,1)"/>
			    	<input type="button" value="3" id="info3" onclick="chgImg(0,2)"/>
			    	<input type="button" value="지도로 보기" style="margin-left: 400px" onclick="map()"/>
			    	
			    	<p style="padding-top: 50px">
						<strong>전화번호<br/></strong>
						▶ 02-411-3502<br/>
						<strong>위치정보<br/></strong>
						▶ 중앙 안내데스크(만남의 장소 옆)<br/>
						<strong>세부정보<br/></strong>
						▶ 놀이시설, 공연안내, 분실물 신고, 미아신고 등 불편한 사항이나 궁금한 점을 친절하게 안내해 드립니다.
						<br/>
						▶ 각종 행사안내 및 가이드맵 배부 서비스 // 
						분실물 신고/접수 서비스 // 
						미아신고 서비스 // 
						미아방지용 어린이 팔찌 배부 서비스 // 
						무료주차 확인 서비스</p>
			    	

			  </div>
			  <div id="tabs-2">
			    <h2>의무실</h2>
			        <p>dddd</p>
			  </div>
			  <div id="tabs-3">
			    <h2>유모차 대여소</h2>
			        <p>dddd</p>
			  </div>
			  <div id="tabs-4">
			    <h2>기저기 교환실</h2>
			        <p>dddd</p>
			  </div>
			  <div id="tabs-5">
			    <h2>유아휴게실</h2>
			        <p>dddd</p>
			  </div>
			  <div id="tabs-6">
			    <h2>휠체어 대여소</h2>
			        <p>dddd</p>
			  </div>
			  <div id="tabs-7">
			    <h2>현금지급기</h2>
			        <p>dddd</p>
			  </div>
			  <div id="tabs-8">
			    <h2>고객상담실</h2>
			        <p>dddd</p>
			  </div>
			  <div id="tabs-9">
			    <h2>미아보호소</h2>
			    	<p>dddd</p>
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
