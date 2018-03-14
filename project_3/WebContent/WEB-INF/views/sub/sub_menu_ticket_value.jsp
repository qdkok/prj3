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
    <link href="commons/css/main.css" rel="stylesheet">
    <!-- <style type="text/css">
    	#button{border:1px solid #EDEDED; background-color: #FFFFFF; width: 287px; height: 100px; margin-right: -3px; margin-left: -3px;}
    	#back-header{background-color: #fff; }	
    	#logo-button  { width: 1140px; margin: 0 auto;  }
    	.main-img{height: 600px;  margin: 0 auto;}
    	.img_div{ border: 1px solid #EDEDED; width: 285px; height: 250px;}
    	.line{ border : 1px solid #EDEDED ; width: 1140px; height: 50px; margin: 0 auto;}
    	.notice{border : 1px solid #EDEDED ; width: 570px; height: 250px }
    	.contain{margin-top: 50px;margin-bottom: 50px; }
    	body{min-width: 1200px;}
    </style> -->
    
    <!-- CDN -->    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <c:import url="../common.jsp"/>
    
     <!-- Bootstrap core JavaScript -->
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
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
    	<div id="test_top" style="max-width: 1300px; margin: 0px auto;" >
	  		<div style="background-color: #cd493c; width: 250px; height: 150px; float: left; font-size: 25px; padding: 50px; color: #fff">ID/PW 찾기</div>
			<div style="background-color: #cd493c; width: 100%;  height: 150px; "></div>
		</div>
		<div id="test_center" style="max-width: 1300px;  margin: 0px auto;" >
	  		<div style=" width: 250px; min-height: 800px; float: left; ">
			    <form name="frm" method="post" id="frm">
		  			<div><input type="button" class="button2" value="온라인 예매" onclick="location.href='index.do'"></div>
		  			<div><input type="button" class="button2" value="예매내역 확인" onclick="joinAccess()"></div>
			    </form>
	  		</div>
			<div class="ticket_value" style=" width: 100%;  min-height: 700px;">
				<table style="border: 1px solid #333; margin: 0px auto; ">
					<tr>
						<td>
							<div id="ticket_1" class="ticket_value" style="width:450px; height:200px; background-color:blue;">
								<h3 style="width:180px; text-align:center; margin-top:5px; margin-left:5px;">입장권</h3>
								<table style="width:430px; margin-top:10px; margin-left:10px; margin:0px auto;">
									<tr>
										<td rowspan="4" style="width:200px; height:150px;"><img src="commons/images/jr.png"/></td>
										<td>설명1</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명2</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명3</td>
									</tr>
									<tr>
										<td style="margin-top:10px; margin-right:5px;float:right;">
											<a href="sub_menu_ticket_reservation.do">
												<input type="button" value="예매하기"/>
											</a>
										</td>
									</tr>
								</table>
							
							</div>
						</td>
						<td>
							<div id="ticket_2" class="ticket_value" style="width:450px; height:200px; background-color:gray; margin-left:50px;">
								<h3 style="width:180px; text-align:center; margin-top:5px; margin-left:5px;">주간권</h3>
								<table style="width:430px; margin-top:10px; margin-left:10px; margin:0px auto;">
									<tr>
										<td rowspan="4" style="width:200px; height:150px;"><img src="commons/images/jr.png"/></td>
										<td>설명1</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명2</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명3</td>
									</tr>
									<tr>
										<td style="margin-top:10px; margin-right:5px;float:right;">
											<a href="#void">
												<input type="button" value="예매하기"/>
											</a>
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="ticket_3" class="ticket_value" style="width:450px; height:200px; background-color:orange; margin-top:10px;">
								<h3 style="width:180px; text-align:center; margin-top:5px; margin-left:5px;">BIG3</h3>
								<table style="width:430px; margin-top:10px; margin-left:10px; margin:0px auto;">
									<tr>
										<td rowspan="4" style="width:200px; height:150px;"><img src="commons/images/jr.png"/></td>
										<td>설명1</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명2</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명3</td>
									</tr>
									<tr>
										<td style="margin-top:10px; margin-right:5px;float:right;">
											<a href="#void">
												<input type="button" value="예매하기"/>
											</a>
										</td>
									</tr>
								</table>
							</div>
						</td>
						<td>
							<div id="ticket_4" class="ticket_value" style="width:450px; height:200px; background-color:lightblue; margin-top:10px; margin-left:50px;">
								<h3 style="width:180px; text-align:center; margin-top:5px; margin-left:5px;">야간권</h3>
								<table style="width:430px; margin-top:10px; margin-left:10px; margin:0px auto;">
									<tr>
										<td rowspan="4" style="width:200px; height:150px;"><img src="commons/images/jr.png"/></td>
										<td>설명1</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명2</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명3</td>
									</tr>
									<tr>
										<td style="margin-top:10px; margin-right:5px;float:right;">
											<a href="#void">
												<input type="button" value="예매하기"/>
											</a>
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id="ticket_5" class="ticket_value" style="width:450px; height:200px; background-color:yellow; margin-top:10px;">
								<h3 style="width:180px; text-align:center; margin-top:5px; margin-left:5px;">BIG5</h3>
								<table style="width:430px; margin-top:10px; margin-left:10px; margin:0px auto;">
									<tr>
										<td rowspan="4" style="width:200px; height:150px;"><img src="commons/images/jr.png"/></td>
										<td>설명1</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명2</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명3</td>
									</tr>
									<tr>
										<td style="margin-top:10px; margin-right:5px;float:right;">
											<a href="#void">
												<input type="button" value="예매하기"/>
											</a>
										</td>
									</tr>
								</table>
							</div>
						</td>
						<td>
							<div id="ticket_6" class="ticket_value" style="width:450px; height:200px; background-color:yellow; margin-top:10px; margin-left:50px;">
								<h3 style="width:180px; text-align:center; margin-top:5px; margin-left:5px;">자유이용권</h3>
								<table style="width:430px; margin-top:10px; margin-left:10px; margin:0px auto;">
									<tr>
										<td rowspan="4" style="width:200px; height:150px;"><img src="commons/images/jr.png"/></td>
										<td>설명1</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명2</td>
									</tr>
									<tr>
										<td style="margin-top:10px;">설명3</td>
									</tr>
									<tr>
										<td style="margin-top:10px; margin-right:5px;float:right;">
											<a href="#void">
												<input type="button" value="예매하기"/>
											</a>
										</td>
									</tr>
								</table>
							</div>
						</td>
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
